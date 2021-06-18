<%
    String alert_message = (String) session.getAttribute("alert_message");
     if(alert_message != null)
     {
        // out.println(message);
         
         
%>
<style> 
.alert {
  padding: 20px;
  background-color: #f44336;
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
  <strong><%= alert_message%></strong>
</div>

<%
       
         session.removeAttribute("alert_message");
         
         
     }
     
%>