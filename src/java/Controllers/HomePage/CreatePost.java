package Controllers.HomePage;

import DAL.DAOManagePost;
import Model.Post;
import Model.Quanlity;
import Model.Type;
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
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

@MultipartConfig
public class CreatePost extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOManagePost daoManagePost = new DAOManagePost();
        String typeId_raw = request.getParameter("typePost");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String instructions = request.getParameter("instructions");
        String expiresDate_raw = request.getParameter("expiresDate");
        String commune = request.getParameter("ward");
        String district = request.getParameter("district");
        String streetNumber = request.getParameter("newAddress");
        String quantityId_raw = request.getParameter("quanlity");

        HttpSession session = request.getSession();
        User userInfor = (User) session.getAttribute("userInfo");
        int idPost = daoManagePost.getMaxIdPost();

        String uploadDirectory = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").length()-10) + "web\\FolderImages\\ImagePost";
        String imgFileName = idPost + "_image.jpg";
        String imgFilePath = uploadDirectory + "\\" + imgFileName;
        String linkDB = "FolderImages/ImagePost/" + imgFileName;
        try {
            Part imgPart = request.getPart("imgPath");

            int type = Integer.parseInt(typeId_raw);
            int quantity = Integer.parseInt(quantityId_raw);
            int dateExpires = Integer.parseInt(expiresDate_raw);

            Post newPost = new Post();
            newPost.setTitle(title);
            newPost.setDescription(description);
            newPost.setIntructions(instructions);
            newPost.setImageUrl(linkDB); 
            newPost.setCommune(commune);
            newPost.setDistrict(district);
            newPost.setStreet_Number(streetNumber);
            newPost.setStatusID(1);
            newPost.setQuanlityID(quantity);
            newPost.setTypeID(type);

            if (daoManagePost.createPost(newPost, dateExpires, "", userInfor.getUserID())) {
                imgPart.write(imgFilePath);
                response.getWriter().write("success");
            } else {
                response.getWriter().write("failed");
            }
        } catch (Exception e) {
            response.getWriter().write(" " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         DAOManagePost dao = new DAOManagePost();
        ArrayList<Type> listType = dao.getAllType();
        ArrayList<Quanlity> listQuanlity = dao.getAllQuanlity();
        request.setAttribute("listQuanlity", listQuanlity);
        request.setAttribute("listType", listType);
        request.getRequestDispatcher("HomePage/createPost.jsp").forward(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreatePost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePost at " + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
