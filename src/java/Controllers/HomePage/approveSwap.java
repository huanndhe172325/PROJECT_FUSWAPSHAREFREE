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
@WebServlet(name = "approveSwap", urlPatterns = {"/approveSwap"})
public class approveSwap extends HttpServlet {

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
            out.println("<title>Servlet approveSwap</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet approveSwap at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String idPost_raw = request.getParameter("idPost");
        String userIdSentRequest_raw = request.getParameter("userIdSentRequest");
        DAOManagePost dao = new DAOManagePost();
        SentMail sent = SentMail.getInstance();

        try {
            int idPost = Integer.parseInt(idPost_raw);
            int userSent = Integer.parseInt(userIdSentRequest_raw);
            String emailReceive = dao.getUserIdByUserId(userSent).getEmail();
            Post post = dao.getPostByIdPost(idPost);
            HttpSession session = request.getSession();
            User userLogin = (User) session.getAttribute("userInfo");
            if (post.getStatusID() == 1
                    && dao.approveRequestSwap(userSent, idPost)
                    && dao.updateStatusPost(idPost, 2)
                    && dao.createNotifycation("has accepted your exchange request", userLogin.getUserID(), idPost, userSent, 1)) {
                String contentMail = sent.contentEmailApprove(post, dao.getUserIdByUserId(userSent));
                sent.sentEmail(emailReceive, "Bạn đã được chấp nhận trao đổi", contentMail);
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
