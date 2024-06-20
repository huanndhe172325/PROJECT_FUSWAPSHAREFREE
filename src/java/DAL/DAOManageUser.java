/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Quanlity;
import Model.ReportUser;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author admin
 */
public class DAOManageUser extends DBContext {

    public ArrayList<User> getUsersInSameDistrict(String district) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE District = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, district);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList<User> getListUserRanking() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] ORDER BY Point DESC";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList<User> getAllUsers(int offset, int limit) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, limit);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID")
                );
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public ArrayList<User> searchUsers(String query, int offset, int limit) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE Email LIKE ? "
                + "OR Phone LIKE ? OR UserName LIKE ? "
                + "ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            String likeQuery = "%" + query + "%";
            st.setString(1, likeQuery);
            st.setString(2, likeQuery);
            st.setString(3, likeQuery);
            st.setInt(4, offset);
            st.setInt(5, limit);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID")
                );
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public int getTotalRecords() {
        int totalRecords = 0;
        String sql = "SELECT COUNT(*) FROM [User]";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalRecords;
    }

    public void updateUser(User user) {

        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [RoleID] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, user.getRoleID());
            stm.setInt(2, user.getUserID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateStatus(int UserID, int stt) {

        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, stt);
            stm.setInt(2, UserID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User getUserByIdUserSend(int id) {
        String sql = "    SELECT * FROM Have_ReportUser h join [User] u on h.IdUserSend=u.UserID where h.IdUserSend=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByIdUserReceive(int id) {
        String sql = "      SELECT * FROM Have_ReportUser h join [User] u on h.IdUserReceive=u.UserID where h.IdUserReceive=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByID(int UserID) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE UserID = ?\n";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ReportUser getByIdUserReceive(int id) {
        String sqlString = "  SELECT * FROM Have_ReportUser where IdUserReceive=?";
        ReportUser rp = new ReportUser();
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                rp.setIdUserReceive(rs.getInt("IdUserReceive"));
                rp.setIdUserSend(rs.getInt("IdUserSend"));
                rp.setMessage(rs.getString("Message"));
                rp.setReportTime(rs.getString("reportTime"));
            }
            return rp;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Map<ReportUser, Integer> reportRankUser() {
        String sqlString = " SELECT TOP 5 IdUserReceive, COUNT(*) as [Count] FROM Have_ReportUser GROUP BY IdUserReceive ORDER BY COUNT(*) DESC ";
        Map<ReportUser, Integer> map = new HashMap<>();
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ReportUser rpReportUser = new ReportUser();
                rpReportUser = getByIdUserReceive(rs.getInt("IdUserReceive"));
                int count = rs.getInt("Count");
                map.put(rpReportUser, count);
            }
            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//   public static void main(String[] args) {
//        DAOManageUser userDAO = new DAOManageUser();
//        ArrayList<User> users = userDAO.getAllUsers();
//
//        for (User user : users) {
//            System.out.println("UserID: " + user.getUserID());
//            System.out.println("Email: " + user.getEmail());
//            System.out.println("Phone: " + user.getPhone());
//            System.out.println("AvatarUrl: " + user.getAvatarUrl());
//            System.out.println("PassWord: " + user.getPassWord());
//            System.out.println("JoinDate: " + user.getJoinDate());
//            System.out.println("UserName: " + user.getUserName());
//            System.out.println("Full_Name: " + user.getFull_Name());
//            System.out.println("District: " + user.getDistrict());
//            System.out.println("Commune: " + user.getCommune());
//            System.out.println("StreetNumber: " + user.getStreetNumber());
//            System.out.println("Point: " + user.getPoint());
//            System.out.println("RoleID: " + user.getRoleID());
//            System.out.println("StatusID: " + user.getStatusID());
//            System.out.println("--------------------------------");
//        }
//    }
    public static void main(String[] args) {
        DAOManageUser daomu = new DAOManageUser();
        User u = daomu.getUserByIdUserSend(2);
//        System.out.println(u.getUserID());
        Map<ReportUser, Integer> map = daomu.reportRankUser();
        for (Map.Entry<ReportUser, Integer> entry : map.entrySet()) {
            System.out.println(entry.getKey().getNameIdUserReceive().getFull_Name() + ":" + entry.getValue());
        }
    }
}
