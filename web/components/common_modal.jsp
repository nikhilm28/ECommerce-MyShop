<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="java.sql.Connection"%>
<div class="w3-container">
    <div id="id01" class="w3-modal ">
    <form class="w3-modal-content">
        <header class="w3-container" style="text-align: center;"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>My Cart</h2>
      </header>
      <div class="w3-container">
          <div class="cart-body">
            
           
          </div>
      </div>
      <footer class="w3-container">
                        <button class="checkout-btn" type="button" style="align: center;background-color: #04AA6D;color: white; width: 25%;padding: 14px 20px;margin: 8px 0;border: none; 
                                cursor: pointer;" onclick="goToCheckout()">
                  CheckOut</button>
      </footer>
    </form>
  </div>
</div>