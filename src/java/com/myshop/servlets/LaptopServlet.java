package com.myshop.servlets;

import com.myshop.connection.Laptop;
import com.myshop.dao.DAOConnection;
import com.myshop.dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LaptopServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String lBrand = request.getParameter("lBrand");
            int lRAM = Integer.parseInt(request.getParameter("lRam"));
            int lROM = Integer.parseInt(request.getParameter("lRom"));
            String lCPU = request.getParameter("lCPU");
            String lCPUType = request.getParameter("lCPUType");
            String lGraphics = request.getParameter("lGraphics");
            float lDisplay = Float.parseFloat(request.getParameter("lDisplay"));
            String lCPUSpeed = request.getParameter("lCPUSpeed");
            float lWeight = Float.parseFloat(request.getParameter("lWeight"));
            int pId = Integer.parseInt(request.getParameter("product_id"));
            
            Laptop l = new Laptop();
            
            l.setlBrand(lBrand);
            l.setlRam(lRAM);
            l.setlRom(lROM);
            l.setlCPU(lCPU);
            l.setlCPUType(lCPUType);
            l.setlGraphics(lGraphics);
            l.setlDisplay(lDisplay);
            l.setlCPUSpeed(lCPUSpeed);
            l.setlWeight(lWeight);
            l.setpId(pId);
            
            ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
            pdao.saveLaptop(l);
            
            HttpSession session = request.getSession();
            session.setAttribute("success_message", "Laptop Added Sucessfully");
            response.sendRedirect("admin.jsp");
            
            
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
