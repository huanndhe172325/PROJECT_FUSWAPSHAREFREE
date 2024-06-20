/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Profile;

import DAL.DAOManagePost;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author FPT
 */
@WebServlet(name = "FetchPost", urlPatterns = {"/FetchPost"})
public class FetchPost extends HttpServlet {

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
            out.println("<title>Servlet FetchPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FetchPost at " + request.getContextPath() + "</h1>");
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
        String idPost = request.getParameter("idpost");
        DAOManagePost dao = new DAOManagePost();
        Post post = dao.getPostByIdPost(Integer.parseInt(idPost));
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String listImg = "";
            for (String img : post.getListImg()) {
                listImg += "<a style=\"margin: auto;\" href=\"javascript:void(0);\" class=\"modal-trigger post-detail post-open-detail\" data-modal=\"share-modal\">\n"
                        + "                                                                <img class=\"element-img-post\" src=\""+img+"\" data-demo-src=\"" + img + "\" alt=\"\" />\n"
                        + "                                                            </a>";
            }
            String btn = "";
            if (post.getListImg().size() >= 2) {
                btn = "<div class=\"image-btn\">\n"
                        + "                                                            <div class=\"btn-image-next btn-image\">\n"
                        + "                                                                <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1em\" height=\"1em\" viewBox=\"0 0 24 24\">\n"
                        + "                                                                <path stroke-width=\"1.5\" stroke=\"black\" fill=\"currentColor\" d=\"M5.536 21.886a1.004 1.004 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886\"/>\n"
                        + "                                                                </svg>\n"
                        + "                                                            </div>\n"
                        + "                                                            <div class=\"btn-image-pre btn-image\">\n"
                        + "                                                                <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1em\" height=\"1em\" viewBox=\"0 0 24 24\">\n"
                        + "                                                                <path stroke-width=\"1.5\" stroke=\"black\" fill=\"currentColor\" d=\"m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645\"/>\n"
                        + "                                                                </svg>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div>";
            }

            out.println("<div class=\"content-wrap\">\n"
                    + "                                            <!-- Post header -->\n"
                    + "                                            <div class=\"card-heading\">\n"
                    + "                                                <!-- User meta -->\n"
                    + "                                                <div class=\"user-block\" style=\"width: 100%;\">\n"
                    + "                                                    <div class=\"image\" style=\"cursor: pointer;\"  onclick=\"window.location.href = 'profile?id=" + post.getUserID() + "'\">\n"
                    + "                                                        <img src=\""+post.getAvatarOwner()+"\" data-demo-src=\"" + post.getAvatarOwner() + "\" data-user-popover=\"1\" alt=\"\" />\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"user-info\" style=\"width: 100%;\">\n"
                    + "                                                        <a class=\"post-name-owner\"  href=\"profile?id=" + post.getUserID() + "\">" + post.getFullNameOwner() + "</a>\n"
                    + "                                                        <span class=\"time\" style=\"display: inline-block\">" + post.getCreateTime() + "</span>\n"
                    + "                                                        <span class=\"status-post-name\" style=\"display: inline-block; padding: 0 10px; float: right;\">" + post.getStatusName() + "</span>\n"
                    + "                                                        <span class=\"type-post-name\" style=\"display: inline-block; float: right;\">" + post.getTypeName() + "</span>\n"
                    + "                                                        <span class=\"quanlity-post\" style=\"display: none; float: right;\">" + post.getQuanlityName() + "</span>\n"
                    + "                                                        <span class=\"addres-post\" style=\"display: none; float: right;\">" + post.getAddress() + "</span>\n"
                    + "                                                        <span class=\"intrucstion-post\" style=\"display: none; float: right;\">" + post.getIntructions() + "</span>\n"
                    + "\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                                <!-- Right side dropdown -->\n"
                    + "                                                <!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->\n"
                    + "                                                <div class=\"dropdown is-spaced is-right is-neutral dropdown-trigger\">\n"
                    + "                                                    <div>\n"
                    + "                                                        <div class=\"button\">\n"
                    + "                                                            <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-more-vertical\"><circle cx=\"12\" cy=\"12\" r=\"1\"></circle><circle cx=\"12\" cy=\"5\" r=\"1\"></circle><circle cx=\"12\" cy=\"19\" r=\"1\"></circle></svg>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"dropdown-menu\" role=\"menu\">\n"
                    + "                                                        <div class=\"dropdown-content\">\n"
                    + "                                                            \n"
                    + "                                                                <a class=\"dropdown-item open-modal-edit modal-trigger edit-modal-trigger\" data-post-id=\""+post.getPostID()+"\" data-post-title=\""+post.getTitle()+"\" data-post-quanlity=\""+post.getQuanlityID()+"\" data-post-desc=\""+post.getDescription()+"\" data-post-intr=\""+post.getIntructions()+"\" data-post-commune=\""+post.getCommune()+"\"  data-post-district=\""+post.getDistrict()+"\" data-post-street_Number=\""+post.getStreet_Number()+"\" data-all-img=\""+post.getImageUrl()+"\">\n"
                    + "                                                                    <div class=\"media\">\n"
                    + "                                                                        <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1em\" height=\"1em\" viewBox=\"0 0 24 24\"><g fill=\"none\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\"><path d=\"M12 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7\"/><path d=\"M18.375 2.625a2.121 2.121 0 1 1 3 3L12 15l-4 1l1-4Z\"/></g></svg>\n"
                    + "                                                                        <div class=\"media-content\">\n"
                    + "                                                                            <h3>Edit</h3>\n"
                    + "                                                                            <small>Edit your post.</small>\n"
                    + "                                                                        </div>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </a>\n"
                    + "                                                            \n"
                    + "                                                            \n"
                    + "                                                                <a class=\"dropdown-item open-modal-archive\" data-post-id=\""+post.getPostID()+"\">\n"
                    + "                                                                    <div class=\"media\">\n"
                    + "                                                                        <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1em\" height=\"1em\" viewBox=\"0 0 24 24\">\n"
                    + "                                                                        <path fill=\"currentColor\" d=\"M21 6a3 3 0 0 0-3-3H6a3 3 0 0 0-2 5.22V18a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V8.22A3 3 0 0 0 21 6M6 5h12a1 1 0 0 1 0 2H6a1 1 0 0 1 0-2m12 13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9h12Z\"/>\n"
                    + "                                                                        <rect width=\"6\" height=\"2\" x=\"9\" y=\"12\" fill=\"currentColor\" rx=\".87\" ry=\".87\"/>\n"
                    + "                                                                        </svg>\n"
                    + "                                                                        <div class=\"media-content\">\n"
                    + "                                                                            <h3>Archive</h3>\n"
                    + "                                                                            <small>Archive this post, others cannot see it</small>\n"
                    + "                                                                        </div>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </a>\n"
                    + "                                                            \n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                            <div class=\"card-body\">\n"
                    + "                                                <div class=\"post-text\">\n"
                    + "                                                    <h3 style=\"font-weight: 500; color: #6ba4e9; margin-bottom: 10px;\">\n"
                    + "                                                        " + post.getTitle() + "\n"
                    + "                                                    </h3>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"post-text\">\n"
                    + "                                                    <p class=\"post-text-description\">\n"
                    + "                                                        " + post.getDescription() + "\n"
                    + "                                                    </p>\n"
                    + "                                                </div>\n"
                    + "\n"
                    + "                                                <!-- Featured image -->\n"
                    + "                                                <div class=\"post-image\">\n"
                    + "                                                    <div class=\"style-img-post\">\n"
                    + "                                                        " + listImg + "\n"
                    + "                                                    </div>\n"
                    + "                                                    \n"
                    + "                                                        "+btn+"\n"
                    + "                                                    \n"
                    + "                                                </div>\n"
                    + "\n"
                    + "                                            </div>\n"
                    + "\n"
                    + "                                            <div class=\"card-footer\">\n"
                    + "                                                <div class=\"social-count\" style=\"margin-left: 0px;\">\n"
                    + "                                                    <div class=\"likes-count\">\n"
                    + "                                                        <i data-feather=\"heart\"></i>\n"
                    + "                                                        <span>27</span>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"shares-count\">\n"
                    + "                                                        <i data-feather=\"link-2\"></i>\n"
                    + "                                                        <span>9</span>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>");;
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
