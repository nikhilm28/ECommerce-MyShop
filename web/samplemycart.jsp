<%@page import="com.myshop.connection.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.myshop.dao.ProductDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <style>
 * {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
    border: 5px solid #04AA6D;
  float: left;
  width: 50%;
  padding: 10px;
  height: 400px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row {
    margin-left: 100px;
    margin-top: 100px;
    width: 80%;
  content: "";
  display: table;
  clear: both;
}

#form{
                
                border: 5px solid #04AA6D;
                padding: 40px;
                margin: 0px auto;
                position: relative;
            }
        </style>
    </head>
    <body>
        
         <% 
            
            
        %>
        <form action="#" method="post">
            <div class="container">
             <div class="row">
            <h1>All Products..</h1>
                <%  
                                                      
                            ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
                            List<Product> list = pdao.getAllProducts();
                                                       
                           
                        %>
                        
                        <% 
                                    for(Product p : list)
                                    {
                                %>
                <table border="1">
                    <tr>
                        <td><img src="img/products/<%= p.getpImage() %>" style="width:50%"></td>
                        <td>    <h3>Product id: <%= p.getpId()  %></h3>
                                <h3>Product Name: <%= p.getpName() %></h3>
                                <h3>Product Price: <%= p.getpPrice() %></h3>
                                <h3>Product Discount: <%= p.getpDiscount() %>%</h3>
                                <h3>Product DiscountPrice: <%= p.getPriceAfterDiscount() %></h3>
                                <h3>Product Qty : <%= p.getpQty() %></h3>
                                <h3>Product Description : <%= p.getpDescription() %></h3>
                        </td>
                        </tr>
                </table>
                                <% 
                                    }
                                %>
            
                                
            </div>
         </div>
            
            
            
        </form>
        
                         
    </body>
</html>
