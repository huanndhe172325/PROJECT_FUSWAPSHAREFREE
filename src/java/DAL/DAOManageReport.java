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
        String sqlString = "  SELECT * FROM Have_ReportPost  ORDER BY PostID";
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

    public int countSearchReportUsers(String txtSearch) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS ReportCount "
                    + "FROM Have_ReportUser ru "
                    + "JOIN [User] us1 ON ru.IdUserSend = us1.UserID "
                    + "JOIN [User] us2 ON ru.IdUserReceive = us2.UserID "
                    + "WHERE us1.Full_Name LIKE ? OR us2.Full_Name LIKE ?";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ReportCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public ArrayList<ReportUser> searchReportUsers(String txtSearch, int index, int size) {
        ArrayList<ReportUser> reportUsers = new ArrayList<>();
        String sql = "WITH a AS (\n"
                + "    SELECT \n"
                + "        ROW_NUMBER() OVER (ORDER BY ru.reportTime DESC) AS r,\n"
                + "        ru.reportTime,\n"
                + "        ru.Message,\n"
                + "        us1.Full_Name AS FullNameSend,\n"
                + "        us2.Full_Name AS FullNameReceive,\n"
                + "        ru.IdUserSend,\n"
                + "        ru.IdUserReceive\n"
                + "    FROM \n"
                + "        Have_ReportUser ru\n"
                + "    JOIN \n"
                + "        [User] us1 ON ru.IdUserSend = us1.UserID\n"
                + "    JOIN \n"
                + "        [User] us2 ON ru.IdUserReceive = us2.UserID\n"
                + "    WHERE \n"
                + "        us1.Full_Name LIKE ? OR \n"
                + "        us2.Full_Name LIKE ? \n"
                + ")\n"
                + "SELECT * FROM a WHERE r BETWEEN (?*5-4) AND (?*5)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            st.setInt(3, index);
            st.setInt(4, index);
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

    public ArrayList<ReportUser> getAllReportUsers(int index, int size) {
        ArrayList<ReportUser> reportUsers = new ArrayList<>();
        String sql = "WITH a AS (\n"
                + "    SELECT \n"
                + "        ROW_NUMBER() OVER (ORDER BY ru.reportTime DESC) AS r,\n"
                + "        ru.reportTime,\n"
                + "        ru.Message,\n"
                + "        us1.Full_Name AS FullNameSend,\n"
                + "        us2.Full_Name AS FullNameReceive,\n"
                + "        ru.IdUserSend,\n"
                + "        ru.IdUserReceive\n"
                + "    FROM \n"
                + "        Have_ReportUser ru\n"
                + "    JOIN \n"
                + "        [User] us1 ON ru.IdUserSend = us1.UserID\n"
                + "    JOIN \n"
                + "        [User] us2 ON ru.IdUserReceive = us2.UserID\n"
                + ")\n"
                + "SELECT * FROM a WHERE r BETWEEN (?*5-4) AND (?*5)";

        try {
            PreparedStatement st = connect.prepareStatement(sql);

            st.setInt(1, index);
            st.setInt(2, index);
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

    public int countReportUsers() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS ReportCount "
                    + "FROM Have_ReportUser ru "
                    + "JOIN [User] us1 ON ru.IdUserSend = us1.UserID "
                    + "JOIN [User] us2 ON ru.IdUserReceive = us2.UserID ";
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ReportCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {

        DAOManageReport daoManageReport = new DAOManageReport();

        int count = daoManageReport.countReportUsers();
        System.out.println(count);
//        ArrayList<ReportUser> list = daoManageReport.getAllReportUsers(1, 5);
//        for (ReportUser reportUser : list) {
//            System.out.println("Report Time: " + reportUser.getReportTime());
//            System.out.println("Message: " + reportUser.getMessage());
//            System.out.println("IdUserSend: " + reportUser.getIdUserSend());
//            System.out.println("IdUserReceive: " + reportUser.getIdUserReceive());
//            System.out.println("----------------------");
//        }
    }
}
