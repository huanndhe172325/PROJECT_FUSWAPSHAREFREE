/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.LoginSystem;

import DAL.DAOSignup;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

/**
 *
 * @author Binhtran
 */
public class SignUp extends HttpServlet {

    private DAOSignup daoSignUp = new DAOSignup();

    // Handles the HTTP GET method
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
    }

    // Handles the HTTP POST method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String streetnumber = request.getParameter("streetnumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        ArrayList<User> listUser = daoSignUp.getAllUser();

        if (daoSignUp.checkUserNameExits(username, listUser)) {
            request.setAttribute("mess1", "UserName exists");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            return;
        }

        if (daoSignUp.checkEmailExits(email, listUser)) {
            request.setAttribute("mess2", "Email exists");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            return;
        }

        if (daoSignUp.checkPhoneExits(phone, listUser)) {
            request.setAttribute("mess3", "Phone exists");
            request.getRequestDispatcher("Signup/SignUp.jsp").forward(request, response);
            return;
        }
//        int idUser = daoSignUp.getMaxIdUser() + 1;
//
//        String uploadDirectory = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").length() - 10) + "web\\FolderImages\\ImageUser";
//        String imgFileName = idUser + "_image.jpg";
//        String imgFilePath = uploadDirectory + "\\" + imgFileName;
//        String linkDB = "FolderImages/ImageUser/" + imgFileName;
        User user = new User();
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassWord(password);
        user.setUserName(username);
        user.setFull_Name(fullname);
        user.setDistrict(district);
        user.setCommune(ward);
        daoSignUp.insertAccount(user);

        response.sendRedirect("Preview");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
