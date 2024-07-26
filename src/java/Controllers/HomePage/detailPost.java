/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import DAL.DAOManageUser;
import Model.DuringExchange;
import Model.FriendsRequest;
import Model.Notification;
import Model.Post;
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
@WebServlet(name = "detailPost", urlPatterns = {"/detailPost"})
public class detailPost extends HttpServlet {

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
            out.println("<title>Servlet detailPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet detailPost at " + request.getContextPath() + "</h1>");
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
        String idPost = request.getParameter("idpost");

        if (idPost == null) {
            response.sendRedirect("HomePage");
        }
        DAOManagePost dao = new DAOManagePost();
        try {
            Post post = dao.getPostByIdPost(Integer.parseInt(idPost));
            if(post.getStatusID() == 5){
                response.sendRedirect("HomePage");
            }
            ArrayList<Post> listPost = new ArrayList<>();
            listPost.add(post);
            request.setAttribute("listPost", listPost);

            HttpSession session = request.getSession();
            User userInfo_raw = (User) session.getAttribute("userInfo");
            DAOManageUser daoManagerUser = new DAOManageUser();
            //display
            if (post.getStatusID() == 1) {
                request.setAttribute("displayConfirm", 1);
            } else {
                request.setAttribute("displayConfirm", 0);
            }

            if (userInfo_raw != null) {
                User userInfor = daoManagerUser.getUserByID(userInfo_raw.getUserID());
                ArrayList<FriendsRequest> listFriendsRq = daoManagerUser.getListFriendRequest(userInfo_raw.getUserID());
                ArrayList<Notification> listNoti = dao.getListNotiByUserId(userInfo_raw.getUserID());
                request.setAttribute("listNoti", listNoti);
                request.setAttribute("listFriendsRq", listFriendsRq);
                request.setAttribute("user", userInfor);
                ArrayList<DuringExchange> listDuringExchange = dao.getListDuringExchange(userInfo_raw.getUserID());
                request.setAttribute("listDuringExchange", listDuringExchange);
            }

            //guest
            if (userInfo_raw == null) {
                request.setAttribute("roleView", 1);
            } //own post
            else if (post.getUserID() == userInfo_raw.getUserID()) {
                request.setAttribute("roleView", 2);
            }//user requested 
            else if (dao.checkAvaiableViewRequest(userInfo_raw.getUserID(), post.getPostID())) {
                request.setAttribute("roleView", 3);
            } else {
                request.setAttribute("roleView", 4);
            }

            request.getRequestDispatcher("HomePage/detailPost.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("HomePage");
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
