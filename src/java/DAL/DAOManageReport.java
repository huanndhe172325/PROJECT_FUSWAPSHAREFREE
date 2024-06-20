/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import Model.Post;
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

    public ArrayList<ReportPost> getAllReportPosts() {
        ArrayList<ReportPost> reportPosts = new ArrayList<>();
        String sqlString = "  SELECT * FROM Have_ReportPost";
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ReportPost rp = new ReportPost();
                rp.setMessage(rs.getString("Message"));
                rp.setReportTime(rs.getDate("reportTime"));

                int IdUserSend = rs.getInt("IdUserSend");
                DAOManageUser ud = new DAOManageUser();
                User u = ud.getUserByIdUserSend(IdUserSend);
                rp.setUser(u);
                int PostID = rs.getInt("PostID");
                DAOManagePost dp = new DAOManagePost();
                Post post = dp.getPostByIdPost(PostID);
                rp.setPost(post);
                reportPosts.add(rp);
            }
            return reportPosts;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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
//    ArrayList<ReportPost> reportPosts = daoManageReport.getAllReportPosts(idUserSend);
//
//    for (ReportPost reportPost : reportPosts) {
//        System.out.println("reportTime: " + reportPost.getReportTime());
//        System.out.println("message: " + reportPost.getMessage());
//        System.out.println("idUserSend" + reportPost.getIdUserSend());
//        System.out.println("postID: " + reportPost.getPostID());
//        System.out.println("---------------------------");
        ArrayList<ReportPost> rps = daoManageReport.getAllReportPosts();
        for (ReportPost xPost : rps) {
            System.out.println(xPost.getPost().getPostID());
        }
    }
}
