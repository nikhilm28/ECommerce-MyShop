package com.myshop.dao;


import com.myshop.connection.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CategoryDAO {
    Connection con;
    
    public CategoryDAO(Connection con)
    {
        this.con = con;
    }
    
    public int saveCategory(Category cat)
    {
        try
        {
           String query = "insert into category(category_name, category_desp) values(?, ?)";
           con = DAOConnection.sqlconnection();
           PreparedStatement pt = con.prepareStatement(query);
           
           pt.setString(1, cat.getCategoryName());
           pt.setString(2, cat.getCategoryDesp());
           
           pt.executeUpdate();
            System.out.println("CatId: "+cat.getCatId());
        }
        catch(SQLException e)
        {
            
        }
        return cat.getCatId();        
    }
    
    public List<Category> getCategories() throws SQLException
    {
        List<Category> categories = new ArrayList<Category>();
        
            
        String query = "select * from category";
        con = DAOConnection.sqlconnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next())
        {
            Category category = new Category();
            category.setCatId(rs.getInt("cat_id"));
            category.setCategoryName(rs.getString("category_name"));
            categories.add(category);
        }
        System.out.println(categories);
        return categories;
        
    }
    
    public Category getCategoryById(int cid)
    {
        Category cat = null;
        try
        {
            String query = "select cat_id from category";
            con = DAOConnection.sqlconnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next())
            {
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    
}

