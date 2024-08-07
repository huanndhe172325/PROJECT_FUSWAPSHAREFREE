/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManageReport;
import Model.ReportUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class manageReportUsers extends HttpServlet {

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
            out.println("<title>Servlet manageReportUsers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageReportUsers at " + request.getContextPath() + "</h1>");
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
         HttpSession session = request.getSession();
        DAOManageReport dao = new DAOManageReport();
        ArrayList<ReportUser> reportUser;
        String txtSearch = request.getParameter("txtSearch");
        String indexString = request.getParameter("index");
       
        int index = 1; // Giá trị mặc định nếu không có index được cung cấp từ request

        // Xử lý ngoại lệ khi không có index từ request
        if (indexString != null && !indexString.isEmpty()) {
            try {
                index = Integer.parseInt(indexString);
            } catch (NumberFormatException e) {
                // Xử lý khi không thể chuyển đổi indexString thành số nguyên
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid page index");
                return;
            }
        }
        
        // Lấy số lượng báo cáo và tính số trang cuối cùng
        int count;
        if (txtSearch == null || txtSearch.isEmpty()) {
            count = dao.countReportUsers(); // Lấy tổng số báo cáo nếu không có tìm kiếm
        } else {
            count = dao.countSearchReportUsers(txtSearch); // Lấy tổng số báo cáo sau khi tìm kiếm
        }
        int pageSize = 5;
        int noOfPages = (int) Math.ceil((double) count / pageSize);

        // Lấy danh sách báo cáo theo trang và tìm kiếm
        if (txtSearch == null || txtSearch.isEmpty()) {
            reportUser = dao.getAllReportUsers(index, pageSize); // Lấy danh sách báo cáo nếu không có tìm kiếm
           
        } else {
            reportUser = dao.searchReportUsers(txtSearch, index, pageSize); // Lấy danh sách báo cáo sau khi tìm kiếm
        }
       

        // Đặt các thuộc tính cho request và điều hướng tới trang manageReportUsers.jsp
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", index);
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("reportUser", reportUser);
        request.getRequestDispatcher("HomePage/manageReportUsers.jsp").forward(request, response);
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
