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
        String sql = "SELECT p.postID, p.title, p.description, reportTime, message,idUserSend   FROM Post p inner  JOIN Have_ReportPost R  ON p.PostID = R.PostID\n"
                + "                WHERE R.IdUserSend = ?";
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

    public String getFullNameReceiveById(int id) {
        String sqlString = "select u.Full_Name from Have_ReportUser h join [User] u on h.IdUserSend = u.UserID\n"
                + "where h.IdUserReceive =?";
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("Full_Name");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String getFullNameSendById(int id) {
        String sqlString = "select Full_Name from Have_ReportUser h join [User] u on h.IdUserSend = u.UserID\n"
                + "where h.IdUserSend =?";
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("Full_Name");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        // Thay đổi idUserSend thành một giá trị thực tế để truy vấn dữ liệu
        DAOManageReport daoManageReport = new DAOManageReport();
//        ArrayList<ReportUser> reportUsers = daoManageReport.getAllReportUsers();
//
//        for (ReportUser reportUser : reportUsers) {
//            System.out.println("reportTime: " + reportUser.getReportTime());
//            System.out.println("message: " + reportUser.getMessage());
//            System.out.println("idUserSend: " + reportUser.getIdUserSend());
//            System.out.println("idUserReceive: " + reportUser.getIdUserReceive());
//            System.out.println("---------------------------");
//        }
//        ArrayList<ReportUser> rp = daoManageReport.getAllReportUsers();
//        for (ReportUser xPost : rp) {
//            System.out.println(xPost.getFullNameReceiveById());
//        }
    }
}
