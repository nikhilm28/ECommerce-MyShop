package com.myshop.dao;

import com.myshop.connection.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
            
             String query = "insert into order_info(u_id, product_id, productname, orderamount, orderdate) values(?,?,?,?,CURRENT_TIMESTAMP)";
             PreparedStatement ps = con.prepareStatement(query);
             
             ps.setInt(1, order.getUserId());
             ps.setInt(2, order.getProduct_id());
             ps.setString(3, order.getProductName());
             ps.setInt(4, order.getOrderAmount());
             
             ps.executeQuery();
                    
             result = true;
                    
        } catch (Exception e) {
        }
         return result;
    }
}
