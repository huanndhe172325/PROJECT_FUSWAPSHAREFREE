/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DAL.DBContext;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class DAOSignup extends DBContext {

    public int getMaxIdUser() {
        int maxId = 1;
        try {
            String sql = "select max(UserID) as MaxUserID from [User]";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt("MaxUserID");
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            return maxId;
        }
        return maxId;
    }

    public void insertAccount(User user) {
        String sql = "INSERT INTO [User] (Email, Phone, AvatarUrl, PassWord, JoinDate, UserName, Full_Name, District, Commune, StreetNumber, Point, RoleID, StatusID) "
                + "VALUES (?, ?, ?, ?, GETDATE(), ?, ?, ?, ?, ?, 0, 1, 1002)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            // Set các giá trị cho các tham số trong câu lệnh SQL
            st.setString(1, user.getEmail());
            st.setString(2, user.getPhone());
            st.setString(3, " ");
            st.setString(4, user.getPassWord());
            st.setString(5, user.getUserName());
            st.setString(6, user.getFull_Name());
            st.setString(7, user.getDistrict());
            st.setString(8, user.getCommune());
            st.setString(9, " ");
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User]";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setEmail(rs.getString("Email"));
                user.setPhone(rs.getString("Phone"));
                user.setAvatarUrl(rs.getString("AvatarUrl"));
                user.setPassWord(rs.getString("PassWord"));
                user.setJoinDate(rs.getString("JoinDate"));
                user.setUserName(rs.getString("UserName"));
                user.setFull_Name(rs.getString("Full_Name"));
                user.setDistrict(rs.getString("District"));
                user.setCommune(rs.getString("Commune"));
                user.setStreetNumber(rs.getString("StreetNumber"));
                user.setPoint(rs.getInt("Point"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setStatusID(rs.getInt("StatusID"));
                listUser.add(user);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listUser;
    }

    public boolean checkUserNameExits(String username, ArrayList<User> list) {
        for (User user : list) {
            if (user.getUserName().equals(username)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkEmailExits(String email, ArrayList<User> list) {
        for (User user : list) {
            if (user.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkPhoneExits(String phone, ArrayList<User> list) {
        for (User user : list) {
            if (user.getPhone().equals(phone)) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        DAOSignup daoSignup = new DAOSignup();
        User user = new User();
        user.setEmail("Haitac.com");
        user.setPhone("0123");
        user.setAvatarUrl("123");
        user.setPassWord("123");
        user.setUserName("Binh");
        user.setFull_Name("Binh tRAN");
        user.setDistrict("Thach That");
        user.setCommune("Thach hoa");
        user.setStreetNumber("123");
        daoSignup.insertAccount(user);
    }
}
