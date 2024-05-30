/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManageUser;
import DAL.DAOManagePost;
import Model.Post;
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

            out.println("<h1>Servlet HomePage at " + "</h1>");
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
        DAOManageUser daoGetUserNearMe = new DAOManageUser();
        HttpSession session = request.getSession();
        User userInfo_raw = (User) session.getAttribute("userInfo");
        User user;
        int id = -1;
        List<User> usersInSameDistrict = null;

        String district = "";
        if (userInfo_raw != null) {
            user = (User) userInfo_raw;
            district = daoGetUserNearMe.getDistrict(user.getUserID());

            if (district != null) {
                usersInSameDistrict = daoGetUserNearMe.getUsersInSameDistrict(district);
            }
        }
        DAOManageUser dao1 = new DAOManageUser();
        List<User> listPoint = dao1.getAllUsersSortedByPoint();

        DAOManagePost dao = new DAOManagePost();

        User userInfor = dao.getUserIdByUserId(userInfo_raw.getUserID());

        ArrayList<Type> listType = dao.getAllType();
        ArrayList<Quanlity> listQuanlity = dao.getAllQuanlity();
        ArrayList<Post> listPost = dao.getAllPost();
        request.setAttribute("i", district);
        request.setAttribute("usersInSameDistrict", usersInSameDistrict);
        request.setAttribute("listPoint", listPoint);
        request.setAttribute("id", id);
        request.setAttribute("listQuanlity", listQuanlity);
        request.setAttribute("listType", listType);
        request.setAttribute("user", userInfor);
        request.setAttribute("listPost", listPost);
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
