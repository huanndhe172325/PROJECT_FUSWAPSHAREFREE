/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.LoginSystem;

import DAL.DAOLoginSystem;
import Model.PasswordReset;
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

/**
 *
 * @author BinhTran
 */
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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

        String userName = request.getParameter("username").trim();
//
        String passWord = request.getParameter("password").trim();

        if (userName == null || passWord == null || userName.isEmpty() || passWord.isEmpty()) {
            request.setAttribute("mess", "Please enter both username or password");
            request.getRequestDispatcher("Login/login.jsp").forward(request, response);
        } else {
            ArrayList<User> listUser = daoLogin.getAllUser();
            if (!daoLogin.checkUserNameExits(userName, listUser)) {
                request.setAttribute("mess", "username does not exist");
                request.getRequestDispatcher("Login/login.jsp").forward(request, response);
            } else {
                int userID = daoLogin.getUserByUserName(userName).getUserID();

                Boolean checkLogin = daoLogin.login(userName, passWord);
                User userInfo = daoLogin.getUser(userName, passWord);
                if (checkLogin == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userInfo", userInfo);
                    session.setAttribute("loginsuccess", true);
                    response.sendRedirect("HomePage");
                } else {
                    PasswordReset passwordResetInfo = daoLogin.getPasswordResetByUserName(userName);
                    User userInfoLoginByPassReset = daoLogin.getUserLoginByPassReset(userName, passWord);
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
