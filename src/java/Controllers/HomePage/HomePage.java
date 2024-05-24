/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOGetUserNearMe;
import DAL.DAOManagePost;
import Model.Quanlity;
import Model.Type;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class HomePage extends HttpServlet {

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
            out.println("<title>Servlet HomePage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomePage at " + request.getContextPath() + "</h1>");
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

        DAOGetUserNearMe daoGetUserNearMe = new DAOGetUserNearMe();
        HttpSession session = request.getSession();
        Object userInfo_raw = (Object) session.getAttribute("userInfo");
        User user;
        int id = -1;
          List<User> usersInSameDistrict=null;
        String district = "";
        if (userInfo_raw != null) {
            // User is logged in
            user = (User) userInfo_raw;
            id = daoGetUserNearMe.getIdByUser(user.getUserName());
            district = daoGetUserNearMe.getDistrict(id);

            if (district != null) {
               usersInSameDistrict = daoGetUserNearMe.getUsersInSameDistrict(district);
            }
        }

        DAOManagePost dao = new DAOManagePost();
        ArrayList<Type> listType = dao.getAllType();
        ArrayList<Quanlity> listQuanlity = dao.getAllQuanlity();
        request.setAttribute("i", district);
        request.setAttribute("usersInSameDistrict", usersInSameDistrict);

        request.setAttribute("id", id);
        request.setAttribute("listQuanlity", listQuanlity);
        request.setAttribute("listType", listType);

        request.getRequestDispatcher("HomePage/HomePage.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println(".....");
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
