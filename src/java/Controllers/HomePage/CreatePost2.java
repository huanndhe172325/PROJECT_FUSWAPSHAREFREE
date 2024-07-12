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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "CreatePost2", urlPatterns = {"/CreatePost2"})
public class CreatePost2 extends HttpServlet {

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
            out.println("<title>Servlet CreatePost2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePost2 at " + request.getContextPath() + "</h1>");
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
        String typeId_raw = request.getParameter("typePost");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String instructions = request.getParameter("instructions");
        String expiresDate_raw = request.getParameter("expiresDate");
        String commune = request.getParameter("ward");
        String district = request.getParameter("district");
        String streetNumber = request.getParameter("newAddress");
        String quantityId_raw = request.getParameter("quality");
        String desire = request.getParameter("desire");
        HttpSession session = request.getSession();
        User userInfor = (User) session.getAttribute("userInfo");
        int idPost = daoManagePost.getMaxIdPost() + 1;

        String uploadDirectory = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").length() - 10) + "web\\FolderImages\\ImagePost";
        StringBuilder linkDBBuilder = new StringBuilder();

        try {
            int type = Integer.parseInt(typeId_raw);
            int quantity = Integer.parseInt(quantityId_raw);
            int dateExpires = Integer.parseInt(expiresDate_raw);

            // Iterate through parts and handle image uploads
            int partIndex = 0; // Initialize part index

            for (Part part : parts) {
                if (part.getName().equals("imgPath") && part.getSize() > 0) {
                    String imgFileName = idPost + "_image_" + partIndex + ".jpg";
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
            newPost.setTitle(title);
            newPost.setDescription(description);
            newPost.setIntructions(instructions);
            newPost.setImageUrl(linkDBBuilder.toString());
            newPost.setCommune(commune);
            newPost.setDistrict(district);
            newPost.setStreet_Number(streetNumber);
            newPost.setStatusID(1);
            newPost.setQuanlityID(quantity);
            newPost.setTypeID(type);
            newPost.setDesire(desire);
            if (daoManagePost.createPost(newPost, dateExpires, desire, userInfor.getUserID())) {
                if (type == 1) {
                    daoManagePost.updatePoint(10, userInfor.getUserID());
                } else if (type == 2) {
                    daoManagePost.updatePoint(20, userInfor.getUserID());
                }   
                response.getWriter().write("success");
            } else {
                response.getWriter().write("failed");
            }
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
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
