/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Profile;

import DAL.DAOManagePost;
import Model.Post;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.Collection;

/**
 *
 * @author FPT
 */
@MultipartConfig
public class editPost extends HttpServlet {

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
            out.println("<title>Servlet editPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editPost at " + request.getContextPath() + "</h1>");
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
        DAOManagePost daoManagePost = new DAOManagePost();
        Collection<Part> parts = request.getParts();
        String title = request.getParameter("titleEdit");
        String description = request.getParameter("descriptionEdit");
        String instructions = request.getParameter("instructionsEdit");
        String commune = request.getParameter("wardEdit");
        String district = request.getParameter("districtEdit");
        String streetNumber = request.getParameter("newAddressEdit");
        String quantityId_raw = request.getParameter("qualityEdit");
        String postId = request.getParameter("postIdEdit");
        Post currentPost = daoManagePost.getPostByIdPost(Integer.parseInt(postId));
        HttpSession session = request.getSession();
        User userInfor = (User) session.getAttribute("userInfo");

        String uploadDirectory = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").length() - 10) + "web\\FolderImages\\ImagePost";
        StringBuilder linkDBBuilder = new StringBuilder();

        try {
            int quantity = Integer.parseInt(quantityId_raw);

            int partIndex = 0;
            for (Part part : parts) {

                if (part.getName().equals("imgPathEdit") && part.getSize() > 0) {
                    String imgFileName = postId + "_image_" + partIndex + ".jpg";
                    String imgFilePath = uploadDirectory + "\\" + imgFileName;
                    String linkDB = "FolderImages/ImagePost/" + imgFileName;

                    part.write(imgFilePath);

                    if (linkDBBuilder.length() > 0) {
                        linkDBBuilder.append(",");
                    }
                    linkDBBuilder.append(linkDB);

                    partIndex++;
                }
            }

            Post newPost = new Post();

            boolean hasFileInput = false;
            for (Part part : parts) {
                if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
                    hasFileInput = true;
                    break;
                }
            }
            if (hasFileInput) {
                newPost.setImageUrl(linkDBBuilder.toString());
            } else {
                //khong input
                newPost.setImageUrl(currentPost.getImageUrl());
            }

            newPost.setTitle(title);
            newPost.setDescription(description);
            newPost.setIntructions(instructions);
            newPost.setCommune(commune);
            newPost.setDistrict(district);
            newPost.setStreet_Number(streetNumber);
            newPost.setQuanlityID(quantity);

            if (daoManagePost.updatePost(newPost, Integer.parseInt(postId))) {
                if (currentPost.getTitle().equals(title)
                        && currentPost.getDescription().equals(description)
                        && currentPost.getIntructions().equals(instructions)
                        && currentPost.getCommune().equals(commune)
                        && currentPost.getDistrict().equals(district)
                        && currentPost.getStreet_Number().equals(streetNumber)
                        && currentPost.getQuanlityID() == quantity && !hasFileInput) {
                    response.getWriter().write("no change");
                } else {
                    response.getWriter().write("successfull");
                }
            }
        } catch (Exception e) {
            response.getWriter().write("failed");
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
