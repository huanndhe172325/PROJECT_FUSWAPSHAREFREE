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

    public int countReportPosts() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS ReportCount FROM Have_ReportPost";
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ReportCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {

        DAOManageReport dao = new DAOManageReport();
        ArrayList<ReportPost> al = dao.getAllReportPostsBySort(1, 3);
        for (ReportPost xPost : al) {
            System.out.println(xPost.getReportTime());
        }
        System.out.println(dao.countReportPosts());
    }

    public ArrayList<ReportPost> getAllReportPostsBySort(int pageIndex, int pageSize) {
        ArrayList<ReportPost> reportPosts = new ArrayList<>();
        String sql = "SELECT * FROM Have_ReportPost ORDER BY PostID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, (pageIndex - 1) * pageSize); // Tính toán OFFSET
            st.setInt(2, pageSize); // Đặt số lượng hàng cần lấy

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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportPosts;
    }

    public int countReportedPPosts(int year, int month) {
        int count = 0;
        try {
            String sql = "SELECT \n"
                    + "    COUNT(DISTINCT IdUserSend) AS countReportedUsers\n"
                    + "FROM \n"
                    + "    [dbo].[Have_ReportPost]\n"
                    + "WHERE \n"
                    + "    YEAR(reportTime) = ?\n"
                    + "    AND MONTH(reportTime) = ?;";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countReportedUsers");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countReportedUsers(int year, int month) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(DISTINCT IdUserReceive) AS ReportCount "
                    + "FROM Have_ReportUser "
                    + "WHERE YEAR(reportTime) = ? AND MONTH(reportTime) = ?";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ReportCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countPostsWithStatusID4(int year, int month) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS countPostsWithStatusID4\n"
                    + "FROM [dbo].[Post]\n"
                    + "WHERE YEAR(CreateTime) = ?\n"
                    + "AND MONTH(CreateTime) = ?\n"
                    + "AND StatusID = 4;"; // assuming 4 means reported
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countPostsWithStatusID4");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
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

    public ArrayList<ReportUser> getAllReportUsersBySort(int index, int size) {
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
                + "SELECT * \n"
                + "FROM a \n"
                + "WHERE r BETWEEN (?*5-4) AND (?*5) \n"
                + "ORDER BY reportTime DESC;";

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

    public ArrayList<ReportUser> getAllReportUsers(int index, int size) {
        ArrayList<ReportUser> reportUsers = new ArrayList<>();
        String sql = "WITH a AS (\n"
                + "    SELECT \n"
                + "        ROW_NUMBER() OVER (ORDER BY ru.reportTime DESC) AS r,\n"
                + "        ru.reportTime,\n"
                + "        ru.Message, us2.StatusID,\n"
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
                        rs.getInt("IdUserReceive"),
                        rs.getInt("StatusID")
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

    public ArrayList<ReportUser> getAllReportUsers() {
        ArrayList<ReportUser> reportUsers = new ArrayList<>();
        String sql = "SELECT \n"
                + "    ru.reportTime,\n"
                + "    ru.Message,\n"
                + "    ru.IdUserSend,\n"
                + "    ru.IdUserReceive\n"
                + "FROM \n"
                + "    Have_ReportUser ru\n"
                + "ORDER BY ru.reportTime DESC";

        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            statement = connect.prepareStatement(sql);
            rs = statement.executeQuery();
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
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return reportUsers;
    }

}
