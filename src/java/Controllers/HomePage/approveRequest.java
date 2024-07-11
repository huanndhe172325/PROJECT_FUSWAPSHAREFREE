/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.HomePage;

import DAL.DAOManagePost;
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

/**
 *
 * @author FPT
 */
@WebServlet(name="approveRequest", urlPatterns={"/approveRequest"})
public class approveRequest extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet approveRequest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet approveRequest at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String idPost_raw = request.getParameter("idPost");
        String userIdSentRequest_raw = request.getParameter("userIdSentRequest");
        DAOManagePost dao = new DAOManagePost();
        SentMail sent = new SentMail();

        try {
            int idPost = Integer.parseInt(idPost_raw);
            int userSent = Integer.parseInt(userIdSentRequest_raw);
            String emailReceive = dao.getUserIdByUserId(userSent).getEmail();
            Post post = dao.getPostByIdPost(idPost);
            HttpSession session = request.getSession();
            User userLogin = (User) session.getAttribute("userInfo");
            if (post.getStatusID() == 1 
                    && dao.approveRequest(userSent, idPost)
                    && dao.updateStatusPost(idPost, 2) 
                    && dao.createNotifycation("has accepted your request", userLogin.getUserID(), idPost, userSent, 1)) {
                sent.sentEmail(emailReceive, "Yêu cầu được chấp nhận", "Yêu cầu của bạn đã được chấp nhận, hãy nhanh chân tới địa điểm để nhận đồ.");
                response.getWriter().println(1);
            } else {
                response.getWriter().println(2);
            }

        } catch (Exception e) {
            response.getWriter().println(2);

        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}