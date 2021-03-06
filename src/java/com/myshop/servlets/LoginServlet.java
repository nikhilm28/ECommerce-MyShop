package com.myshop.servlets;

import com.myshop.connection.User;
import com.myshop.dao.DAOConnection;
import com.myshop.dao.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String userphone = request.getParameter("phone");
            String userpassword = request.getParameter("password");
            
            UserDAO userdao = new UserDAO(DAOConnection.sqlconnection());
            User user = userdao.getUserPhoneandPassword(userphone, userpassword);
            System.out.println(user);
            
            HttpSession session = request.getSession();
            HttpSession session1 = request.getSession();
            if(user == null)
            {
                session.setAttribute("alert_message", "Invalid Details");
                response.sendRedirect("login.jsp");
                return;
             //   out.println("<h1> User not found</h1>");
            }
            else
            {
                out.println("<h1> Weclome User: "+ user.getName() + "</h1>");
                session.setAttribute("current-user", user);
                if(user.getUsertype().equals("admin"))
                {
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUsertype().equals("normal"))
                {
                    response.sendRedirect("index.jsp");
                    session1.setAttribute("userphone", user.getPhone());
                    
                }
                else
                {
                    out.println("User not Identified!!");
                }
            }                              
                                         
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
