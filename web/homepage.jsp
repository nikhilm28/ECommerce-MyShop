<%@page import="java.util.List"%>
<%@page import="com.myshop.connection.Product"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="com.myshop.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>MyShop</title>
	<link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/card.css">
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>
        <%@include  file="components/new_navbar.jsp" %>
        <div class="wrapper">
            <div class="main_content">
                <div class="info">
                    <% 
                            ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
                            List<Product> list = pdao.getAllProducts();
                        %>
                        
                            <h1>No of Products <%= list.size() %></h1>
                            <%
                                for(Product product:list)
                                {
                                    out.println(product.getpImage()+ "<br>");
                                }
                            %>
                </div>
            </div>
        </div>
</body>


</html>
