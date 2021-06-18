<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp for MyShop</title>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}

body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 120%;
  padding: 12px 20px;
  margin: 8px 15px;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

#form{
    height: 300px;
    width: 450px;
    padding: 20px;
    margin: 0px auto;
    position: relative;
}

button:hover {
  opacity: 0.8;
}

.imgcontainer {
  text-align: center;
  margin: 15px 0 20px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 20px;
}

span.psw {
  float: right;
  padding-top: 1px;
}

.navbar{
  width: 100%;
  background-color: #555;
  overflow: auto;
}

.navbar a{
    float: right;
    text-align: center;
    padding: 25px;
    color: white;
    text-decoration: none;
    font-size: 17px;
}

.navbar a:hover{
    background-color: #000;
}

.active {
  background-color: #04AA6D;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
}
</style>
</head>
<body>
    <div class="navbar">
          <a class="active" href="register.jsp"> <i class="fa fa-fw fa-address-book"></i>Register</a>
            <a href="login.jsp"> <i class="fa fa-fw fa-user"></i>Login</a>
            
            <a href="index.jsp"> <i class="fa fa-fw fa-home"></i>Home</a>
        
        </div>
<div id="form">
    <form action="RegisterServlet" method="post">
        <div class="imgcontainer">
            <h2> SignUp here!!</h2>
            <%@include  file="components/alert.jsp" %>
            <%@include  file="components/success.jsp" %>
        </div>
        
        <div class="container">
            <table style="width: 80%">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" required></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" required></td>
                </tr>
                <tr>
                    <td>Zipcode</td>
                    <td><input type="text" name="zipcode" required></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required></td>
                </tr>
            </table>
                <button type="submit" class="registerbtn">Register</button>

        </div>
    </form>
    
</div>
</body>
</html>