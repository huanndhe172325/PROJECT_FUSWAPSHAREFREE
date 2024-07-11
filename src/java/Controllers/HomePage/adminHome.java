/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManageReport;
import DAL.DAOManageUser;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
@WebServlet(name = "adminHome", urlPatterns = {"/adminHome"})
public class adminHome extends HttpServlet {

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
            out.println("<title>Servlet adminHome</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminHome at " + request.getContextPath() + "</h1>");
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
        DAOManageReport r = new DAOManageReport();
        DAOManageUser r1 = new DAOManageUser();
        ArrayList PostsReports = new ArrayList();
        ArrayList UsersReports = new ArrayList();
        ArrayList UserList = new ArrayList();
        ArrayList listYear = new ArrayList();
        int count = 0;
        String yearParam = request.getParameter("year");

        // lấy ra năm hiện tại 
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();

        if (yearParam != null) {
            currentYear = Integer.parseInt(yearParam);
        }

        // lấy ra list năm
        while (count <= 4) {
            listYear.add(currentYear - count);
            count++;
        }

        // lấy ra số lượng người bị report từ thnags 1 - tháng 12
        for (int i = 1; i <= 12; i++) {
            PostsReports.add(r.countReportedPPosts(currentYear, i));
            UsersReports.add(r.countReportedUsers(currentYear, i));
            UserList.add(r1.countUsersByJoinDate(currentYear, i));
        }

        // chuyển array sang string "[1,2,3,4,5,6,7,8,9,10,11,12]"
        String requestPostsReports = convertToStringArray(PostsReports).toString();
        String requestUsersReports = convertToStringArray(UserList).toString();
        String requestUserList = convertToStringArray(UsersReports).toString();

        request.setAttribute("requestPostsReports", requestPostsReports);
        request.setAttribute("requestUsersReports", requestUsersReports);
        request.setAttribute("requestUserList", requestUserList);
        request.setAttribute("listYear", listYear);

        request.getRequestDispatcher("HomePage/adminHome.jsp").forward(request, response);
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

    public StringBuilder convertToStringArray(ArrayList a) {
        // Chuyển đổi mảng Java thành chuỗi JSON thủ công
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < a.size(); i++) {
            json.append(a.get(i));
            if (i < a.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");
        if (json != null) {
            return json;
        }
        return null;
    }
}
