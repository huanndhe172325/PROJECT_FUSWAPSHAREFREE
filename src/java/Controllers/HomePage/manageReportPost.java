/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import DAL.DAOManageReport;
import Model.Post;
import Model.ReportPost;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author admin
 */
@WebServlet(name = "manageReportPost", urlPatterns = {"/manageReportPost"})
public class manageReportPost extends HttpServlet {

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
            out.println("<title>Servlet manageReportPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageReportPost at " + request.getContextPath() + "</h1>");
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

        // Lấy tham số phân trang từ yêu cầu
        String pageIndexStr = request.getParameter("index");
        String pageSizeStr = request.getParameter("size");
        int pageIndex = pageIndexStr != null ? Integer.parseInt(pageIndexStr) : 1;
        int pageSize = pageSizeStr != null ? Integer.parseInt(pageSizeStr) : 5;

        // Lấy danh sách report post phân trang
        ArrayList<ReportPost> reportPosts = dao.getAllReportPostsBySort(pageIndex, pageSize);

        // Đếm tổng số report post
        int totalReportPosts = dao.countReportPosts();

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalReportPosts / pageSize);

        // Thiết lập các thuộc tính cho yêu cầu
        request.setAttribute("reportPosts", reportPosts);
        request.setAttribute("currentPage", pageIndex);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("HomePage/manageReportPost.jsp").forward(request, response);
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
        // Thiết lập response
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=ReportPosTData.xls");

        // Tạo workbook và sheet
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("List Report Posts");

        // Tạo header row
        Row headerRow = sheet.createRow(0);
        String[] columns = {"ID", "Title", "Description", "Time", "Content"};
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
        }

        // Lấy dữ liệu người dùng từ database
        DAOManagePost dao = new DAOManagePost();
        List<Post> posts = dao.getReportPosts();

        // Điền dữ liệu vào sheet
        int rowNum = 1;
        for (Post post : posts) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(post.getPostID());
            row.createCell(1).setCellValue(post.getTitle());
            row.createCell(2).setCellValue(post.getDescription() );
            String reportTimePost = dao.getTimePostByPostId(post.getPostID());
            String reportMesP = dao.getMessPostByPostId(post.getPostID());
            row.createCell(3).setCellValue(reportTimePost);
            row.createCell(4).setCellValue(reportMesP);
        }

        // Tự động điều chỉnh kích thước cột
        for (int i = 0; i < columns.length; i++) {
            sheet.autoSizeColumn(i);
        }

        try (OutputStream out = response.getOutputStream()) {
            wb.write(out);
        } finally {
            wb.close();
        }

        // Chuyển hướng đến trang JSP
       response.sendRedirect("manageReportPost");
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
