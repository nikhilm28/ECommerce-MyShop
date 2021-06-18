<%
    String success_message = (String) session.getAttribute("success_message");
     if(success_message != null)
     {
        // out.println(message);
         
         
%>
<style> 
.alert {
  padding: 20px;
  background-color: #04AA6D;
  color: white;
}
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}
.closebtn:hover {
  color: black;
}
</style>
<div class="alert ">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%= success_message%></strong>
</div>

<%
       
         session.removeAttribute("success_message");
         
         
     }
     
%>