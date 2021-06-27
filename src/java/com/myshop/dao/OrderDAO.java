package com.myshop.dao;

import com.myshop.connection.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    
    Connection con;
    
    public OrderDAO(Connection con)
    {
        this.con = con;
    }
    
    public boolean saveOrder(Order order)
    {
         boolean result = false;
         try {
            
             String query = "insert into order_info(product_id, productname,quantity, orderamount, date, userphone) values(?,?,?,?,CURRENT_DATE,?)";
             PreparedStatement ps = con.prepareStatement(query);
             
             ps.setInt(1, order.getProduct_id());
             ps.setString(2, order.getProductName());
             ps.setInt(3, order.getProductQuantity());
             ps.setInt(4, order.getOrderAmount());
             ps.setString(5, order.getUserPhone());
             
             ps.executeQuery();
                    
             result = true;
                    
        } catch (Exception e) {
        }
         return result;
    }
    
    public List<Order> getAllOrders() throws SQLException
    {
        List<Order> orders = new ArrayList<Order>();
        
            
        String query = "select * from order_info";
        con = DAOConnection.sqlconnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next())
        {
            Order order = new Order();
            order.setOrderId(rs.getInt("order_id"));
            order.setProduct_id(rs.getInt("product_id"));
            order.setProductName(rs.getString("productname"));
            order.setProductQuantity(rs.getInt("quantity"));
            order.setOrderAmount(rs.getInt("orderamount"));
            order.setOrderDate(rs.getString("date"));
            order.setUserPhone(rs.getString("userphone"));
            orders.add(order);
        }
        return orders;
    }
    
    public List<Order> getMyOrders(String phone) throws SQLException
    {
        List<Order> orders = new ArrayList<Order>();
        
        String query="select * from order_info where userphone = ? order by order_id desc ";
        con = DAOConnection.sqlconnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, phone);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            Order order = new Order();
            order.setOrderId(rs.getInt("order_id"));
            order.setProductName(rs.getString("productname"));
            order.setProductQuantity(rs.getInt("quantity"));
            order.setOrderAmount(rs.getInt("orderamount"));
            order.setOrderDate(rs.getString("date"));
            orders.add(order);
        }
        return orders;
        
    }
}
