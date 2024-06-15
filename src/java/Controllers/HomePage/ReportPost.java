/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Binhtran
 */
public class ReportPost extends HttpServlet {

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
            out.println("<title>Servlet ReportPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportPost at " + request.getContextPath() + "</h1>");
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
    DAOManagePost dmnPost = new DAOManagePost();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int postId = Integer.parseInt(request.getParameter("post_id"));
        // Lấy các tham số từ form
        String postId = request.getParameter("post_id");
        String reportReason = request.getParameter("report_reason");
        String reportReasonOther = request.getParameter("report_reason_other");

        // Xử lý báo cáo
        // Thêm logic xử lý báo cáo của bạn ở đây
        // Đặt loại phản hồi và trả về thông báo thành công
        response.setContentType("text/plain");
        response.getWriter().write(reportReason);

//        if (userInfo == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//
//        int userIDReport = userInfo.getUserID();
//        String actualReportReason;
//
//        if ("Other".equals(reportReason)) {
//            actualReportReason = reportReasonOther;
//        } else {
//            actualReportReason = reportReason;
//        }
//        if (dmnPost.ReportPost(actualReportReason, userIDReport, postId)) {
//            response.getWriter().write("Report post successfully");
//        } else {
//            response.getWriter().write("Fail");
//        }
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
