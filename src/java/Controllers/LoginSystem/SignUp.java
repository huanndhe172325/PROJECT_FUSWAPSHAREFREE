/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.LoginSystem;

import DAL.DAOLoginSystem;
import DAL.DAOSignup;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Binhtran
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    DAOSignup daoSignUp = new DAOSignup();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
    }
    DAOLoginSystem daoLogin = new DAOLoginSystem();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim().toLowerCase();
        String password = request.getParameter("password");
        String userName = request.getParameter("username");
        ArrayList<User> listUser = daoSignUp.getAllUser();
        if (daoSignUp.checkEmailExits(email, listUser)) {
            request.setAttribute("mess2", "Email exists");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            return;
        }
        if (daoSignUp.checkUserNameExits(userName, listUser)) {
            request.setAttribute("mess1", "Username exists");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            return;
        }
        String newPassword = PassworDencryption.toSHA1(password);
        User user = new User();
        user.setEmail(email);
        user.setPassWord(newPassword);
        user.setUserName(userName);
        //create account
        daoSignUp.insertAccount(user);
        //verify email by otp 
        final String from = "fanjfla1989@gmail.com";
        final String password2 = "ggkcowdffnophotg";
        final String to = email;

        User userFindByEmail = daoLogin.getUserIdByEmail(email);
        int userId = userFindByEmail.getUserID();
        String otp = daoSignUp.generateOTP();
        //lấy ra thời gian thực
        Date dateNow = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dateNow);
        //thời gian + 5 phút 
        calendar.add(Calendar.MINUTE, 5);

        Date expiryDate = calendar.getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedExpiryDate = dateFormat.format(expiryDate);
        try {
            if (!daoSignUp.isUserEmailVerification(userId)) {
                daoSignUp.insertEmailVerification(userId, otp, formattedExpiryDate);
            } else {
                daoSignUp.updateEmailVerification(userId, otp, formattedExpiryDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mess", "An error occurred while saving your verification information. Please try again.");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            return;
        }

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //smtp host
        props.put("mail.smtp.port", "587"); // tls 582 ssl 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password2);
            }
        };

        //phiên làm việc
        Session session = Session.getInstance(props, auth);

        //Tạo tin nhắn 
        MimeMessage msg = new MimeMessage(session);
        HttpSession sess = request.getSession();
        sess.setAttribute("userID", userId);
        response.sendRedirect("verifyemail");

        new Thread(() -> {
            try {
                // Content type
                msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
                // Sender
                msg.setFrom(new InternetAddress(from));
                // Recipient
                msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                // Subject
                msg.setSubject("Verify Email");
                // Content
                msg.setContent("OTP : " + otp, "text/HTML; charset=UTF-8");
                // Send email
                Transport.send(msg);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }).start();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
