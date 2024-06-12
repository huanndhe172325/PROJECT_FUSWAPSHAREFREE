/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import Model.ReportUser;
import Model.ReportPost;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOManageReport extends DBContext {

    public ArrayList<ReportPost> getAllReportPosts(int idUserSend) {
        ArrayList<ReportPost> reportPosts = new ArrayList<>();
        String sql = "SELECT p.postID, p.title, p.description, r.reportTime, r.message, r.idUserSend "
                + "FROM Post p "
                + "JOIN Have_ReportUser r ON p.postID = r.postID "
                + "WHERE r.IdUserReceive = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, idUserSend);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                ReportPost reportPost = new ReportPost();
                reportPost.setPostID(rs.getInt("postID"));
                reportPost.setTitle(rs.getString("title"));
                reportPost.setDescription(rs.getString("description"));
                reportPost.setReportTime(rs.getString("reportTime"));
                reportPost.setMessage(rs.getString("message"));
                reportPost.setIdUserSend(rs.getInt("idUserSend")); // Thêm dòng này để lấy IdUserSend từ kết quả truy vấn
                reportPosts.add(reportPost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reportPosts;
    }
public ArrayList<ReportUser> getAllReportUsers() {
        ArrayList<ReportUser> reportUsers = new ArrayList<>();
        String sql = "SELECT * FROM Have_ReportUser";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ReportUser reportUser = new ReportUser(
                    rs.getString("reportTime"),
                    rs.getString("Message"),
                    rs.getInt("IdUserSend"),
                    rs.getInt("IdUserReceive")
                );
                reportUsers.add(reportUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportUsers;
    }
    public static void main(String[] args) {
          // Thay đổi idUserSend thành một giá trị thực tế để truy vấn dữ liệu
    int idUserSend = 1; // Ví dụ: lấy dữ liệu báo cáo cho người dùng có ID là 1

    DAOManageReport daoManageReport = new DAOManageReport();
    ArrayList<ReportPost> reportPosts = daoManageReport.getAllReportPosts(idUserSend);

    for (ReportPost reportPost : reportPosts) {
        System.out.println("reportTime: " + reportPost.getReportTime());
        System.out.println("message: " + reportPost.getMessage());
        System.out.println("idUserSend" + reportPost.getIdUserSend());
        System.out.println("postID: " + reportPost.getPostID());
        System.out.println("---------------------------");
    }
    }
}
