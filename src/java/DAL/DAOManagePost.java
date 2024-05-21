/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author FPT
 */
public class DAOManagePost extends DBContext{
    public ArrayList<Type> getAllType(){
        ArrayList<Type> listType = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Type";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Type type = new Type();
                type.setTypeID(rs.getInt("TypeID"));
                type.setName(rs.getString("Name"));
                listType.add(type);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listType;
    }
    public static void main(String[] args) {
        DAOManagePost dao = new DAOManagePost();
         ArrayList<Type> listType = new ArrayList<>();
         listType = dao.getAllType();
         for(Type ty : listType){
             System.out.println(ty.getTypeID());
         }
    }
}
