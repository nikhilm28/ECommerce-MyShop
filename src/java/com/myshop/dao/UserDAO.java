package com.myshop.dao;

import java.sql.*;

import com.myshop.connection.User;

public class UserDAO {
    Connection con;
    
    public UserDAO(Connection con)
    {
        this.con = con;
    }
    
    public  static int insertKey ;
    public static String username;
            
    public boolean saveUser(User user)
    {
        boolean result = false;
        try
        {
            String query = "insert into user_info(name, phone, email, address, zipcode, password, usertype) values(?,?,?,?,?,?,'normal')";
            con = DAOConnection.sqlconnection();
            PreparedStatement pt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        //    pt.setInt(1, 1);
            pt.setString(1, user.getName());
            pt.setString(2, user.getPhone());
            pt.setString(3, user.getEmail());
            pt.setString(4, user.getAddress());
            pt.setString(5, user.getZipcode());
            pt.setString(6, user.getPassword());
            
            pt.executeUpdate();
            ResultSet rskey = pt.getGeneratedKeys();
                
            if(rskey.next())
            {
                insertKey = rskey.getInt(1);
                username = rskey.getString(2);
                System.out.println("Uid:"+ insertKey);
                System.out.println("UName:"+ username);
                
            } else {
                
            }
            result = true;
        }
        catch(SQLException e)
        {
        }
        return result;
    }
    
   public User getUserPhoneandPassword(String phone, String password)
    {
        User user = null;
        try
        {
            con = DAOConnection.sqlconnection();
            String query = "SELECT * from user_info where phone = ? and password = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1,phone);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                user = new User();
                user.setU_id(rs.getInt("u_id"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setZipcode(rs.getString("zipcode"));
                user.setPassword(rs.getString("password"));
                user.setUsertype(rs.getString("usertype"));
             }
            
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
    
 
}