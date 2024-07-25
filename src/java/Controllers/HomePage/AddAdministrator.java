/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManageUser;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 *
 * @author admin
 */
public class AddAdministrator extends HttpServlet {

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
            out.println("<title>Servlet AddAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAdmin at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("HomePage/addAdmin.jsp").forward(request, response);
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
        String gmailPattern = "^[A-Za-z0-9._%+-]+@gmail\\.com$";
        // Compile the pattern
        Pattern pattern = Pattern.compile(gmailPattern, Pattern.CASE_INSENSITIVE);
        DAOManageUser dao = new DAOManageUser();

        String mailString = request.getParameter("mail");
        String userNameString = request.getParameter("user");
        String passString = request.getParameter("pass");
        String phoneString = request.getParameter("phone");
        String fullname = request.getParameter("fullname");
        String commune = request.getParameter("commune");
        String districtString = request.getParameter("district");

        if (mailString == null || mailString == "") {
            request.setAttribute("msgError", "Mail is empty");
        } else if (!isGmail(mailString)) {
            request.setAttribute("msgError", "Mail wrong format!");
        } else if (dao.isCheckEmail(mailString)) {
            request.setAttribute("msgError", "Mail Exist!");
        } else if (userNameString == null || userNameString == "") {
            request.setAttribute("msgError", "User Name is empty");
        } else if (passString == null || passString == "") {
            request.setAttribute("msgError", "passString is empty");
        } else if (phoneString == null || phoneString == "") {
            request.setAttribute("msgError", "phoneString is empty");
        } else if (phoneString.length() != 10) {
            request.setAttribute("msgError", "Phone max length is 10");
        } else if (dao.isCheckPhone(phoneString)) {
            request.setAttribute("msgError", "Phone Exist!");
        } else if (fullname == null || fullname == "") {
            request.setAttribute("msgError", "fullname is empty");
        } else if (commune == null || commune == "") {
            request.setAttribute("msgError", "commune is empty");
        } else if (districtString == null || districtString == "") {
            request.setAttribute("msgError", "districtString is empty");
        } else {
            LocalDate localDate = LocalDate.now();

            // Convert LocalDate to Date
            Date date = Date.valueOf(localDate);
            DAOManageUser daomu = new DAOManageUser();
            daomu.addAdmintrator(mailString, userNameString, passString, phoneString, fullname, commune, districtString, date);
            request.setAttribute("msgError", "Add successfully");
        }
        ArrayList<User> Administrator;
        String txtSearch = request.getParameter("txtSearch");
        String indexString = request.getParameter("index");
        int index = 1; // Giá trị mặc định nếu không có index được cung cấp từ request

        // Xử lý ngoại lệ khi không có index từ request
        if (indexString != null && !indexString.isEmpty()) {
            try {
                index = Integer.parseInt(indexString);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                index = 1; // Đặt giá trị mặc định nếu không thể chuyển đổi indexString thành số nguyên
            }
        }

        // Lấy số lượng quản trị viên và tính số trang cuối cùng
        int count;
        int pageSize = 5;
        if (txtSearch == null || txtSearch.isEmpty()) {
            count = dao.countAdministrator(); // Lấy tổng số quản trị viên nếu không có tìm kiếm
        } else {
            count = dao.countSearchAdministrator(txtSearch); // Lấy tổng số quản trị viên sau khi tìm kiếm
        }

        int endPage = (int) Math.ceil((double) count / pageSize);

        // Lấy danh sách quản trị viên theo trang và tìm kiếm
        if (txtSearch == null || txtSearch.isEmpty()) {
            Administrator = dao.getAllAdministrator(index, pageSize); // Lấy danh sách quản trị viên nếu không có tìm kiếm
        } else {
            Administrator = dao.searchAdministrator(txtSearch, index, pageSize); // Lấy danh sách quản trị viên sau khi tìm kiếm
        }

        // Đặt các thuộc tính cho request và điều hướng tới trang manageAdministrators.jsp
        request.setAttribute("endPage", endPage);
        request.setAttribute("Administrator", Administrator);
        request.setAttribute("currentPage", index);
        request.setAttribute("txtSearch", txtSearch);

        request.getRequestDispatcher("HomePage/manageAdministrator.jsp").forward(request, response);

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

    private static boolean isGmail(String email) {
        // Regular expression pattern to match Gmail addresses
        String gmailPattern = "^[A-Za-z0-9._%+-]+@gmail\\.com$";

        // Compile the pattern
        Pattern pattern = Pattern.compile(gmailPattern, Pattern.CASE_INSENSITIVE);

        // Create a matcher for the email
        Matcher matcher = pattern.matcher(email);

        // Check if the email matches the pattern
        return matcher.matches();
    }
}
