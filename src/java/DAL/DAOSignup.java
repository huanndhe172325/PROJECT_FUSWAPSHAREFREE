/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DAL.DBContext;
import Model.EmailVerification;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author admin
 */
public class DAOSignup extends DBContext {

    public void insertAccount(User user) {
        String sql = "INSERT INTO [User] (Email, Phone, AvatarUrl, PassWord, JoinDate, UserName, Full_Name, District, Commune, StreetNumber, Point, RoleID, StatusID) "
                + "VALUES (?, ?, ?, ?, GETDATE(), ?, ?, ?, ?, ?, 0, 1, 1002)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, user.getEmail());
            st.setString(2, "");
            st.setString(3, "FolderImages/ImageUser/pngtree-userpeoplelinear-iconuser-png-image_1859764.jpg");
            st.setString(4, user.getPassWord());
            st.setString(5, user.getUserName());
            st.setString(6, "USERFUSWAPSHAREFREE");
            st.setString(7, "-");
            st.setString(8, "-");
            st.setString(9, "-");
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

    public void insertEmailVerification(int idUser, String otp, String expiryTime) {
        String sql = "INSERT INTO EmailVerification (UserID, OTP, ExpiryDateTime) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, idUser);
            st.setString(2, otp);
            st.setString(3, expiryTime);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEmailVerification(int userId, String otp, String expiryTime) {
        String sql = "UPDATE PasswordReset SET OTP = ?, ExpiryDateTime = ? WHERE UserID = ?";
        try (PreparedStatement st = connect.prepareStatement(sql)) {
            st.setString(1, otp);
            st.setString(2, expiryTime);
            st.setInt(3, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean isUserEmailVerification(int userId) {
        String sql = "SELECT 1 FROM EmailVerification WHERE UserID = ?";
        try (PreparedStatement st = connect.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public EmailVerification getEmailVerificationByUserID(int userId) {
        String sql = "SELECT * FROM EmailVerification WHERE UserID = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new EmailVerification(
                        rs.getInt("UserID"),
                        rs.getString("OTP"),
                        rs.getString("ExpiryDateTime")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateUserStatusToActive(int userId) {
        String sql = "UPDATE [User] SET StatusID = 1 WHERE UserID = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
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
