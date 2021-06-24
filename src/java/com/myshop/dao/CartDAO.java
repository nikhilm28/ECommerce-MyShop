package com.myshop.dao;

import com.myshop.connection.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    Connection con;
    
    public CartDAO(Connection con)
    {
        this.con = con;
    }
    
    public static int quantity = 1;
    public static int productPrice = 0;
    public static int productTotal = 0;
    public static int cartTotal = 0;
    public static int z = 0;
            
    public boolean saveToCart(Cart cart)
    {
        boolean result = false;
        try
        {
            String query = "insert into shopping_cart(phone, product_id, quantity, price, total, pname) values(?,?,?,?,?,?)";
            con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, cart.getUserPhone());
            ps.setInt(2, cart.getProductId());
            ps.setInt(3, cart.getProductQuantity());
            ps.setInt(4, cart.getProductPrice());
            ps.setInt(5, cart.getProductTotal());
            ps.setString(6, cart.getProductName());
            
            ps.executeUpdate();
            result = true;
            
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
    
    public Cart updateCart(int total, int quantity, int product_id, String phone)
    {
        Cart cart = null;
        try {
            String query ="update shopping_cart set total =?, quantity=? where product_id=? and phone=?";
            con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, total);
            ps.setInt(2, quantity);
            ps.setInt(3, product_id);
            ps.setString(4, phone);
            
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }
    
    public int checkProductInCart(int product_id, String phone)
    {
        try {
            String query = "select * from shopping_cart where product_id = ? and phone = ?";
            con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, product_id);
            ps.setString(2, phone);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                cartTotal = rs.getInt("total");
                cartTotal = cartTotal + productTotal;
                quantity = rs.getInt("quantity");
                quantity = quantity + 1;
                z = 1;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return z;
    }
    
    public List<Cart> getProductsInCart(String phone) throws SQLException
    {
        List<Cart> cartproducts = new ArrayList<Cart>();
        String query = "select * from shopping_cart where phone = ?";
        con = DAOConnection.sqlconnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, phone);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            Cart cartproduct = new Cart();
            cartproduct.setUserPhone(rs.getString("phone"));
            cartproduct.setProductId(rs.getInt("product_id"));
            cartproduct.setProductQuantity(rs.getInt("quantity"));
            cartproduct.setProductPrice(rs.getInt("price"));
            cartproduct.setProductTotal(rs.getInt("total"));
            cartproduct.setProductName(rs.getString("pname"));
                        
            cartproducts.add(cartproduct);
        }
        return cartproducts;
                
    }
    public boolean deleteFromCart(int pid, String phone)
    {
        boolean result = false;
        try
        {
            String query = "delete from shopping_cart where phone = ? and product_id = ?";
            con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, phone);
            ps.setInt(2, pid);
            
            ps.executeQuery();
            result = true;
            
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }
}
