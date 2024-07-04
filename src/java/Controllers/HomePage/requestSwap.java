/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import Model.HaveSwap;
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
@WebServlet(name = "requestSwap", urlPatterns = {"/requestSwap"})
public class requestSwap extends HttpServlet {

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
            out.println("<title>Servlet requestSwap</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet requestSwap at " + request.getContextPath() + "</h1>");
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
        DAOManagePost dao = new DAOManagePost();

        String idPostSwap = request.getParameter("idPostSwap");
        String descriptionSwap = request.getParameter("descriptionSwap");

        Collection<Part> parts = request.getParts();
        HttpSession session = request.getSession();
        User userInfor = (User) session.getAttribute("userInfo");

        String uploadDirectory = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").length() - 10) + "web\\FolderImages\\ImageSwap";
        StringBuilder linkDBBuilder = new StringBuilder();
        try {
            int partIndex = 0;
            for (Part part : parts) {
                if (part.getName().equals("imgPath") && part.getSize() > 0) {
                    String imgFileName = userInfor.getUserID() + "_" + idPostSwap + "_image_" + partIndex + ".jpg";
                    String imgFilePath = uploadDirectory + "\\" + imgFileName;
                    String linkDB = "FolderImages/ImageSwap/" + imgFileName;

                    part.write(imgFilePath);

                    if (linkDBBuilder.length() > 0) {
                        linkDBBuilder.append(",");
                    }
                    linkDBBuilder.append(linkDB);
                    System.out.println(linkDB);
                    partIndex++;
                }
            }
            
            System.out.println("linkDB: ");
            System.out.println(linkDBBuilder.toString());
            
            HaveSwap newSwap = new HaveSwap();
            newSwap.setDescription(descriptionSwap);
            newSwap.setUserID(userInfor.getUserID());
            newSwap.setStatus("pending");
            newSwap.setImage(linkDBBuilder.toString());
            newSwap.setPostID(Integer.parseInt(idPostSwap));
            
            Post ownPost = dao.getPostByIdPost(Integer.parseInt(idPostSwap));
            if (dao.createRequestSwap(newSwap) && dao.createNotifycation("sent you a new request swap on", userInfor.getUserID(), Integer.parseInt(idPostSwap), ownPost.getUserID(), 1)) {
                response.getWriter().write("successfull");
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
