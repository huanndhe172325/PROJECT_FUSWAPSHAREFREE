/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManageReport;
import DAL.DAOManageUser;
import Model.ReportUser;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
@WebServlet(name = "manageAdministrator", urlPatterns = {"/manageAdministrator"})
public class manageAdministrator extends HttpServlet {

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
            out.println("<title>Servlet manageAdministrator</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageAdministrator at " + request.getContextPath() + "</h1>");
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
       DAOManageUser dao = new DAOManageUser();
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
