/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Binhtran
 */
public class SearchPost extends HttpServlet {

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
            out.println("<title>Servlet SearchPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchPost at " + request.getContextPath() + "</h1>");
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
    DAOManagePost dmnP = new DAOManagePost();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        ArrayList<Post> listPostSearch = dmnP.getPostByTilte(txtSearch);
        PrintWriter out = response.getWriter();
        for (Post p : listPostSearch) {
            out.println("<div id=\"feed-post-1\" class=\"card is-post\">\n"
                    + "    <!-- Main wrap -->\n"
                    + "    <div class=\"content-wrap\">\n"
                    + "        <!-- Post header -->\n"
                    + "        <div class=\"card-heading\">\n"
                    + "            <!-- User meta -->\n"
                    + "            <div class=\"user-block\" style=\"width: 100%;\">\n"
                    + "                <div class=\"image\" style=\"cursor: pointer;\"  onclick=\"window.location.href = 'profile?id=" + p.getUserID() + "'\">\n"
                    + "                    <img src=\"https://via.placeholder.com/300x300\" data-demo-src=\"" + p.getAvatarOwner() + "\" data-user-popover=\"1\" alt=\"\" />\n"
                    + "                </div>\n"
                    + "                <div class=\"user-info\" style=\"width: 100%;\">\n"
                    + "                    <a class=\"post-name-owner\" href=\"profile?id=" + p.getUserID() + "\">" + p.getFullNameOwner() + "</a>\n"
                    + "                    <span class=\"time\" style=\"display: inline-block\">" + p.getCreateTime() + "</span>\n"
                    + "                    <span class=\"status-post-name\" style=\"display: inline-block; padding: 0 10px; float: right;\">" + p.getStatusName() + "</span>\n"
                    + "                    <span class=\"type-post-name\" style=\"display: inline-block; float: right;\">" + p.getTypeName() + "</span>\n"
                    + "                    <span class=\"quanlity-post\" style=\"display: none; float: right;\">" + p.getQuanlityName() + "</span>\n"
                    + "                    <span class=\"addres-post\" style=\"display: none; float: right;\">" + p.getAddress() + "</span>\n"
                    + "                    <span class=\"intrucstion-post\" style=\"display: none; float: right;\">" + p.getIntructions() + "</span>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "            <!-- Right side dropdown -->\n"
                    + "            <div class=\"dropdown is-spaced is-right is-neutral dropdown-trigger\">\n"
                    + "                <div>\n"
                    + "                    <div class=\"button\">\n"
                    + "                        <i data-feather=\"more-vertical\"></i>\n"
                    + "                    </div>\n"
                    + "                </div>\n"
                    + "                <div class=\"dropdown-menu\" role=\"menu\">\n"
                    + "                    <div class=\"dropdown-content\">\n"
                    + "                        <a href=\"#\" class=\"dropdown-item\">\n"
                    + "                            <div class=\"media\">\n"
                    + "                                <i data-feather=\"bookmark\"></i>\n"
                    + "                                <div class=\"media-content\">\n"
                    + "                                    <h3>Bookmark</h3>\n"
                    + "                                    <small>Add this post to your bookmarks.</small>\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "                        </a>\n"
                    + "                        <a class=\"dropdown-item\">\n"
                    + "                            <div class=\"media\">\n"
                    + "                                <i data-feather=\"bell\"></i>\n"
                    + "                                <div class=\"media-content\">\n"
                    + "                                    <h3>Notify me</h3>\n"
                    + "                                    <small>Send me the updates.</small>\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "                        </a>\n"
                    + "                        <hr class=\"dropdown-divider\" />\n"
                    + "                        <a class=\"dropdown-item flag-link\" post-id=\"" + p.getPostID() + "\">\n"
                    + "                            <div class=\"media\">\n"
                    + "                                <i data-feather=\"flag\"></i>\n"
                    + "                                <div class=\"media-content\">\n"
                    + "                                    <h3>Flag</h3>\n"
                    + "                                    <small>In case of inappropriate content.</small>\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "                        </a>\n"
                    + "                    </div>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "        </div>\n"
                    + "        <div class=\"card-body\">\n"
                    + "            <div class=\"post-text\">\n"
                    + "                <h3 style=\"font-weight: 500; color: #6ba4e9; margin-bottom: 10px;\">\n"
                    + "                    " + p.getTitle() + "\n"
                    + "                </h3>\n"
                    + "            </div>\n"
                    + "            <div class=\"post-text\">\n"
                    + "                <p class=\"post-text-description\">\n"
                    + "                    " + p.getDescription() + "\n"
                    + "                </p>\n"
                    + "            </div>\n"
                    + "            <!-- Featured image -->\n"
                    + "            <div class=\"post-image\">\n"
                    + "                <div class=\"style-img-post\">\n"
                    + "                    <a style=\"margin: auto;\" href=\"javascript:void(0);\" class=\"modal-trigger post-detail post-open-detail\" data-modal=\"share-modal\">\n"
                    + "                        <img class=\"element-img-post\" src=\"" + p.getImageUrl() + "\" alt=\"Post Image\" />\n"
                    + "                    </a>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "        </div>\n"
                    + "        <div class=\"card-footer\">\n"
                    + "            <div class=\"social-count\" style=\"margin-left: 0px;\">\n"
                    + "                <div class=\"likes-count\">\n"
                    + "                    <i data-feather=\"heart\"></i>\n"
                    + "                    <span>27</span>\n"
                    + "                </div>\n"
                    + "                <div class=\"shares-count\">\n"
                    + "                    <i data-feather=\"link-2\"></i>\n"
                    + "                    <span>9</span>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</div>");
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
