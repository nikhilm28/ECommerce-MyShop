<%@page import="com.myshop.Helper"%>
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
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

.row {margin: 0 -5px;}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 300px;
  height: auto;
  margin: auto;
  text-align: center;
  font-family: arial;
}
    
.card-image{
   height: 200px; 
   width: 200px; 
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #04AA6D;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}

s {
  text-decoration: line-through;
}
        </style>
</head>
<body>
       <%@include  file="components/new_navbar.jsp" %>
       <script src="js/script.js"></script>
       <div class="wrapper">                                
           <div class="main_content">
                <div class="info">
                    <%  
                           String cat = request.getParameter("category");
                           
                            ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
                            List<Product> list = null;
                            if(cat == null || cat.trim().equals("all"))
                            {
                                list = pdao.getAllProducts();
                            }
                            else
                            {
                                int cid = Integer.parseInt(cat.trim());
                               list = pdao.getProductsById(cid);
                            }
                             
                            
                        %>
                        <div class="row">
                            
                                <% 
                                    for(Product p : list)
                                    {
                                %>
                             <div class="column">
                                <div class="card">
                                    <div class="container">
                                     <img src="img/products/<%= p.getpImage() %>" alt="Denim Jeans" style="width:80%"><br>   
                                    </div>                                                                     
                                    
                                        <b> <%= p.getpName() %></b>
                                        <p class="price">₹ <%= p.getPriceAfterDiscount() %> <span><b> <%=p.getpDiscount()%>% off</b> <s>₹<%=p.getpPrice()%></s></span></p>
                                        <p><%= Helper.get10Words(p.getpDescription()) %></p>
                                        <p><button>Add to Cart</button></p>
                                </div>
                            </div>
                                <% 
                                    }
                                    if(list.size() == 0)
                                    {
                                        out.println("<h1>Currently No Products in this Category</h1>");
                                    }
                                %>
                                
                            
                        </div>
                            
                </div>
            </div>
       </div>
<script>
    var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>        
</body>


</html>
