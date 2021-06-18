package com.myshop.servlets;

import com.myshop.connection.Mobile;
import com.myshop.dao.DAOConnection;
import com.myshop.dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MobileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String mBrand = request.getParameter("mBrand");
            int mRAM = Integer.parseInt(request.getParameter("mRam"));
            int mROM = Integer.parseInt(request.getParameter("mRom"));
            String mCPU = request.getParameter("mCPU");
            int mCamera = Integer.parseInt(request.getParameter("mCamera"));
            float mDisplay = Float.parseFloat(request.getParameter("mDisplay"));
            int pId = Integer.parseInt(request.getParameter("product_id"));
            
            Mobile m = new Mobile();
            
            m.setmBrand(mBrand);
            m.setmRam(mRAM);
            m.setmRom(mROM);
            m.setmCPU(mCPU);
            m.setmCamera(mCamera);
            m.setmDisplay(mDisplay);
            m.setpId(pId);
            
            ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
            pdao.saveMobile(m);
            
            HttpSession session = request.getSession();
            session.setAttribute("success_message", "Mobile Added Successfully...");
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
