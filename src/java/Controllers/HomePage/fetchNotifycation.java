/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import Model.Notification;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author FPT
 */
@WebServlet(name = "fetchNotifycation", urlPatterns = {"/fetchNotifycation"})
public class fetchNotifycation extends HttpServlet {

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
            out.println("<title>Servlet fetchNotifycation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet fetchNotifycation at " + request.getContextPath() + "</h1>");
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
        DAOManagePost dao = new DAOManagePost();
        HttpSession session = request.getSession();
        User userInfo_raw = (User) session.getAttribute("userInfo");
        if(userInfo_raw == null){
            return;
        }
        ArrayList<Notification> listNoti = dao.getListNotiByUserId(userInfo_raw.getUserID());
        if(listNoti.size() == 0){
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            for (Notification noti : listNoti) {
                out.println("<div class=\"media\" onclick=\"window.location.href = 'detailPost?idpost="+noti.getPostID()+"'\" style=\"cursor: pointer;\">\n"
                        + "                                                <figure class=\"media-left\">\n"
                        + "                                                    <p class=\"image\">\n"
                        + "                                                        <img src=\""+noti.getAvatarUserSent()+"\" onclick=\"window.location.href = 'otherprofile?id="+noti.getUserSent().getUserID()+"'\" data-demo-src=\""+noti.getAvatarUserSent()+"\" alt=\"\" style=\"cursor: pointer;\" />\n"
                        + "                                                    </p>\n"
                        + "                                                </figure>\n"
                        + "                                                <div class=\"media-content\">\n"
                        + "                                                    <span><a href=\"otherprofile?id="+noti.getUserSent().getUserID()+"\">"+noti.getFullNameUserSent()+"</a> "+noti.getDescripton()+"\n"
                        + "                                                        <a href=\"detailPost?idpost="+noti.getPostID()+"\">post</a>.</span>\n"
                        + "                                                    <span class=\"time\">"+noti.getCreateTime()+"</span>\n"
                        + "                                                </div>\n"
                        + "                                                <div class=\"media-right\">\n"
                        + "                                                    <div class=\"added-icon\">\n"
                        + "                                                        <i data-feather=\"message-square\"></i>\n"
                        + "                                                    </div>\n"
                        + "                                                </div>\n"
                        + "                                            </div>");
            }
        }
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
