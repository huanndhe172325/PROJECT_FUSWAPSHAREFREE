/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Profile;

import DAL.DAOManagePost;
import DAL.DAOManageUser;
import DAL.DAOProfile;
import Model.BlockList;
import Model.DuringExchange;
import Model.Like;
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
import java.util.List;

/**
 *
 * @author haoto
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        DAOProfile db = new DAOProfile();
        DAOManageUser db1 = new DAOManageUser();

        User userId = (User) session.getAttribute("userInfo");
        int id = userId.getUserID();
        User u = db.getUserbyId(id);
        ArrayList<Post> myPost = new ArrayList<>();
        List<BlockList> userBlock = db1.listBlockUser(u.getUserID());
        ArrayList<User> userList = db1.getAllUsersToBlockList(u.getUserID());

        request.setAttribute("userList", userList);
        request.setAttribute("userBlock", userBlock);
        DAOManagePost daoPost = new DAOManagePost();
        ArrayList<Post> hisPost = daoPost.getAllPostHistory(u.getUserID());
        List<Like> like = db.getPostsByLike(u.getUserID());
        myPost = daoPost.getAllPostByIdUser(u.getUserID());
        ArrayList<Notification> listNoti = daoPost.getListNotiByUserId(userId.getUserID());
        ArrayList<DuringExchange> listDuringExchange = daoPost.getListDuringExchange(u.getUserID());
        request.setAttribute("listDuringExchange", listDuringExchange);
        request.setAttribute("listNoti", listNoti);
        request.setAttribute("listLiked", like);
        request.setAttribute("hisPost", hisPost);
        request.setAttribute("myPost", myPost);
        request.setAttribute("profile", u);
        request.getRequestDispatcher("Profile/profile.jsp").forward(request, response);

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
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        DAOProfile db = new DAOProfile();
        DAOManageUser db1 = new DAOManageUser();

        User userId = (User) session.getAttribute("userInfo");
        int id1 = userId.getUserID();
        User u = db.getUserbyId(id1);
        db1.unlockUser(u.getUserID(), Integer.parseInt(id));
        response.sendRedirect("profile?id=" + id1);
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
