package com.myshop.dao;

import com.myshop.connection.Laptop;
import com.myshop.connection.Mobile;
import com.myshop.connection.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    Connection con;
    
    public ProductDAO(Connection con)
    {
        this.con = con;
    }
    
    public boolean saveProducts(Product product)
    {
       boolean result = false;
        try {
            String query = "insert into product(name, sale_price, discount, qty, description, cat_id, image) values(?,?,?,?,?,?,?)";
            con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, product.getpName());
            ps.setInt(2, product.getpPrice());
            ps.setInt(3, product.getpDiscount());
            ps.setInt(4, product.getpQty());
            ps.setString(5, product.getpDescription());
            ps.setInt(6, product.getCatId());
            ps.setString(7, product.getpImage());
            
            ps.executeUpdate();
            
            result = true;
            
        } catch (SQLException e) {
        }
        return result;
    }
    
    public List<Product> getAllProducts() throws SQLException
    {
        List<Product> products = new ArrayList<Product>();
        String query = "select * from product";
        con = DAOConnection.sqlconnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        
        while(rs.next())
        {
          Product product = new Product();
          product.setpId(rs.getInt("product_id"));
          product.setpName(rs.getString("name"));
          product.setpPrice(rs.getInt("sale_price"));
          product.setpDiscount(rs.getInt("discount"));
          product.setpQty(rs.getInt("qty"));
          product.setpDescription(rs.getString("description"));
          product.setpImage(rs.getString("image"));
          products.add(product);
        }
    //    System.out.println(products);
        return products;
    }
    
    public List<Product> getProductsById(int cid) throws SQLException
    {
        List<Product> products = new ArrayList<Product>();
        String query = "select * from product where cat_id = ?";
        con = DAOConnection.sqlconnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, cid);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
          Product product = new Product();
          product.setpId(rs.getInt("product_id"));
          product.setpName(rs.getString("name"));
          product.setpPrice(rs.getInt("sale_price"));
          product.setpDiscount(rs.getInt("discount"));
          product.setpDescription(rs.getString("description"));
          product.setpImage(rs.getString("image"));
          products.add(product);
        }
        return products;
        
    }
    
    public boolean saveMobile(Mobile mobile)
    {
        boolean result = false;
        try {
            String query = "insert into product_mobile(brand, ram, rom, cpu, camera, display, product_id) values(?,?,?,?,?,?,?)";
            con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, mobile.getmBrand());
            ps.setInt(2, mobile.getmRam());
            ps.setInt(3, mobile.getmRom());
            ps.setString(4, mobile.getmCPU());
            ps.setInt(5, mobile.getmCamera());
            ps.setFloat(6, mobile.getmDisplay());
            ps.setInt(7, mobile.getpId());
            
            ps.executeUpdate();
            result = true;
            
        } catch (SQLException e) {
        }
        
        return result;
    }
    
    public boolean saveLaptop(Laptop laptop)
    {
        boolean result = false;
        try {
            String query = "insert into product_laptop(brand, ram, rom, cpu, cpu_type, graphics, display, cpu_speed, weight, product_id) values(?,?,?,?,?,?,?,?,?,?)";
            con=DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, laptop.getlBrand());
            ps.setInt(2, laptop.getlRam());
            ps.setInt(3, laptop.getlRom());
            ps.setString(4, laptop.getlCPU());
            ps.setString(5, laptop.getlCPUSpeed());
            ps.setString(6, laptop.getlGraphics());
            ps.setFloat(7, laptop.getlDisplay());
            ps.setString(8, laptop.getlCPUSpeed());
            ps.setFloat(9, laptop.getlWeight());
            ps.setInt(10, laptop.getpId());
            
            ps.executeUpdate();
            result = true;
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
}
