/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManageUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Binhtran
 */
@WebServlet(name = "AddFriend", urlPatterns = {"/AddFriend"})
public class AddFriend extends HttpServlet {

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
            out.println("<title>Servlet AddFriend</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFriend at " + request.getContextPath() + "</h1>");
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
        try {
            int requestId = Integer.parseInt(request.getParameter("request_id"));
            String status = request.getParameter("status");

            DAOManageUser dmng = new DAOManageUser();

            if ("accepted".equals(status)) {
                int senderUserId = Integer.parseInt(request.getParameter("sender_user_id"));
                int receiverUserId = Integer.parseInt(request.getParameter("receiver_user_id"));

                boolean isUpdated = dmng.deleteRejectedRequest(requestId);

                if (isUpdated) {
                    boolean isInserted = dmng.insertIntoListFriends(senderUserId, receiverUserId);

                    if (isInserted) {
                        response.getWriter().write("Friend request accepted and added to ListFriends");
                    } else {
                        response.getWriter().write("Failed to add to ListFriends");
                    }
                } else {
                    response.getWriter().write("Failed to update request status");
                }

            } else if ("rejected".equals(status)) {
                boolean isDelete = dmng.deleteRejectedRequest(requestId);
                if (isDelete) {
                    response.getWriter().write("Friend request rejected");
                } else {
                    response.getWriter().write("Failed to update request status");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error processing friend request");
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
