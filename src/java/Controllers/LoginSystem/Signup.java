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
import java.time.LocalDateTime;
import java.util.ArrayList;
import org.eclipse.jdt.core.compiler.CharOperation;

/**
 *
 * @author admin
 */
@WebServlet(name = "Signup", urlPatterns = {"/Signup"})
public class Signup extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAOSignup dao = new DAOSignup();
    DAOLoginSystem daoLogin = new DAOLoginSystem();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* TODO output your page here. You may use following sample code. */
        String email = request.getParameter("email");
        String Phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String userName = request.getParameter("username");
        String Fname = request.getParameter("fname");
        String District = request.getParameter("district");
        String Commune = request.getParameter("commune");
        String StreetNumber = request.getParameter("streetnumber");

        ArrayList<User> listUser = daoLogin.getAllUser();
        if (Fname.equals("") || email.equals("") || pass.equals("") || repass.equals("") || userName.equals("") || Phone.equals("") || District.equals("") || Commune.equals("") || StreetNumber.equals("")) {
            request.setAttribute("mess", "Please fill all blank");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
        } else {
            if (!pass.equals(repass)) {
                request.setAttribute("mess", "Pass and repass does not match!");
                request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            } else {
                if (daoLogin.checkUserNameExits(userName, listUser)) {
                    request.setAttribute("mess", "This username already exist");
                    request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
                } else {
                    if (pass.equals(repass)) {
                        dao.insertAccount(email, Phone, pass, userName, Fname, District, Commune, StreetNumber);
                        request.setAttribute("mess", "Register successful please login!!");
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
