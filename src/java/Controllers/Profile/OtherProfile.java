/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Profile;

import DAL.DAOManagePost;
import DAL.DAOManageUser;
import DAL.DAOProfile;
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
 * @author haoto
 */
@WebServlet(name = "OtherProfile", urlPatterns = {"/otherprofile"})
public class OtherProfile extends HttpServlet {

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
            out.println("<title>Servlet OtherProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OtherProfile at " + request.getContextPath() + "</h1>");
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
    DAOManageUser daouser = new DAOManageUser();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAOProfile db = new DAOProfile();
        User user = (User) session.getAttribute("userInfo");
        int userID = user.getUserID();
        User user1 = db.getUserbyId(userID);
        request.setAttribute("user1", user1);
        int id = Integer.parseInt(request.getParameter("id"));
        User u = db.getUserbyId(id);
        ArrayList<Post> myPost = new ArrayList<>();
        DAOManagePost daoPost = new DAOManagePost();
        ArrayList<Notification> listNoti = daoPost.getListNotiByUserId(user.getUserID());
        myPost = daoPost.getAllPostByIdUser(u.getUserID());
        
        boolean isfriends = daouser.checkisFriends(userID, id);
        request.setAttribute("isfriend", isfriends);
        request.setAttribute("myPost", myPost);
        request.setAttribute("profile", u);
        request.setAttribute("listNoti", listNoti);
        request.getRequestDispatcher("Profile/otherprofile.jsp").forward(request, response);

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
