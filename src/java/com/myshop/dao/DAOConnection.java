package com.myshop.dao;

import java.sql.*;

public class DAOConnection {
    static Connection con;
    static String username=null;
    static String passwd=null;
    
    public static Connection sqlconnection()
    {
        try
        {
            String dbUrl = "jdbc:postgresql://localhost:5433/projectdb";
            Class.forName("org.postgresql.Driver").newInstance();
            con=DriverManager.getConnection(dbUrl, "postgres", "nik4psql");
            System.out.println("connection.DAOConnection.sqlconnection()");
        }
        catch(Exception e)
                {
                    System.out.println("Db Exception");
                }
        return con;
    }
    
}
