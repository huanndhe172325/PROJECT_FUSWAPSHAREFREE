/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.LoginSystem;

import DAL.DAOLoginSystem;
import Model.GoogleAccount;
import Model.PasswordReset;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author BinhTran
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        request.getRequestDispatcher("Login/login.jsp").forward(request, response);
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
        String code = request.getParameter("code");
        if (code != null) {
            String accessToken = GoogleLogin.getToken(code);
            User userAcc = GoogleLogin.getUserInfo(accessToken);
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Logout</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet Logout at " + userAcc + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
            if (userAcc != null) {
                ArrayList<User> listUser = daoLogin.getAllUser();
                if (!daoLogin.checkEmailExits(userAcc.getEmail(), listUser)) {
                    daoLogin.addUser(userAcc);
                }

                User userInfo = daoLogin.getUserByEmail(userAcc.getEmail());
                HttpSession session = request.getSession();
                session.setAttribute("userInfo", userInfo);
                session.setAttribute("loginsuccess", true);
                if (userInfo.getRoleID() == 1) {
                    response.sendRedirect("HomePage");
                } else if (userInfo.getRoleID() == 2) {
                    response.sendRedirect("adminHome");
                }
                return;
            } else {
                request.setAttribute("mess", "Google login failed");
                request.getRequestDispatcher("Login/login.jsp").forward(request, response);
                return;
            }
        }
        String email = request.getParameter("email").trim();
//
        String passWord = request.getParameter("password").trim();

        if (email == null || passWord == null || email.isEmpty() || passWord.isEmpty()) {
            request.setAttribute("mess", "Please enter both username or password");
            request.getRequestDispatcher("Login/login.jsp").forward(request, response);
        } else {
            ArrayList<User> listUser = daoLogin.getAllUser();
            if (!daoLogin.checkEmailExits(email, listUser)) {
                request.setAttribute("mess", "email does not exist");
                request.getRequestDispatcher("Login/login.jsp").forward(request, response);
            } else {
                Boolean checkLogin = daoLogin.login(email, PassworDencryption.toSHA1(passWord));
                User userInfo = daoLogin.getUser(email, PassworDencryption.toSHA1(passWord));
                if (checkLogin == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userInfo", userInfo);
                    session.setAttribute("loginsuccess", true);
                    if (userInfo.getRoleID() == 1) {
                        response.sendRedirect("HomePage");
                    } else if (userInfo.getRoleID() == 2) {
                        response.sendRedirect("adminHome");
                    }
                    else if (userInfo.getRoleID() == 3) {
                    response.sendRedirect("SideBarAdmin");
                }
                } else {

                    PasswordReset passwordResetInfo = daoLogin.getPasswordResetByEmail(email);
                    User userInfoLoginByPassReset = daoLogin.getUserLoginByPassReset(email, passWord);

                    if (passwordResetInfo != null && passWord.equals(passwordResetInfo.getPassword())) {

                        Date dateNow = new Date();
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(dateNow);
                        Date CurrentDate = calendar.getTime();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String formattedCurrentDate = dateFormat.format(CurrentDate);

                        try {
                            Date currentDate = dateFormat.parse(formattedCurrentDate);
                            Date expiryDateTime = dateFormat.parse(passwordResetInfo.getExpiryDateTime());
                            if (currentDate.before(expiryDateTime)) {
                                HttpSession session = request.getSession();
                                session.setAttribute("userInfo", userInfoLoginByPassReset);
                                session.setAttribute("loginsuccess", true);
                                response.sendRedirect("changepassword");
                            } else {
                                request.setAttribute("mess", "Password reset has expired");
                                request.getRequestDispatcher("Login/login.jsp").forward(request, response);
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    } else {
                        request.setAttribute("mess", "Wrong username or password");
                        request.getRequestDispatcher("Login/login.jsp").forward(request, response);
                    }
                }

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
