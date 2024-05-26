/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.ForgotPassword;

import DAL.DAOLoginSystem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Binhtran
 */
public class ForgotPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("ForgotPassword/ForgotPassword.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAOLoginSystem daoLogin = new DAOLoginSystem();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        ArrayList<User> listUser = daoLogin.getAllUser();

        final String from = "fanjfla1989@gmail.com";
        final String password = "ggkcowdffnophotg";
        final String to = email;

        if (!daoLogin.checkEmailExits(email.trim(), listUser)) {
            request.setAttribute("msg", "Email does not exist, please check your email again!!!");
            request.getRequestDispatcher("ForgotPassword/ForgotPassword.jsp").forward(request, response);
        } else {
            HttpSession sess = request.getSession();
            sess.setAttribute("email", to);
            String passwordLevelTwo = RandomPasswordGenerator.generateRandomString();

            User user = daoLogin.getUserIdByEmail(email);
            int userId = user.getUserID();

            //lấy ra thời gian thực
            Date dateNow = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dateNow);
            //thời gian + 5 phút 
            calendar.add(Calendar.MINUTE, 5);

            Date expiryDate = calendar.getTime();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formattedExpiryDate = dateFormat.format(expiryDate);

            daoLogin.insertPasswordReset(userId, passwordLevelTwo, formattedExpiryDate);

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); //smtp host
            props.put("mail.smtp.port", "587"); // tls 582 ssl 465
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            //create Authenticator
            Authenticator auth = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, password);
                }
            };

            //phiên làm việc
            Session session = Session.getInstance(props, auth);

            //Tạo tin nhắn 
            MimeMessage msg = new MimeMessage(session);

            try {
                //kiểu nội dung
                msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
                //người gửi
                msg.setFrom(from);
                //người nhận
                msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                //tiêu đề email
                msg.setSubject("Recover account");
                //nội dung 
                msg.setContent("Mật khẩu mới của bạn là : " + passwordLevelTwo, "text/HTML; charset=UTF-8");
                //gửi email
                Transport.send(msg);
                response.sendRedirect("Login");
            } catch (Exception e) {
                request.setAttribute("msg", "Can't send password for your email");
                request.getRequestDispatcher("ForgotPassword/ForgotPassword.jsp").forward(request, response);
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
