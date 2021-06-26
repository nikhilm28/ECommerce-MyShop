package com.myshop.servlets;

import com.myshop.connection.Product;
import com.myshop.dao.DAOConnection;
import com.myshop.dao.ProductDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
/* TODO output your page here. You may use following sample code. */
            String pName = request.getParameter("pName");
            String pDescription = request.getParameter("pDescription");
            int pPrice = Integer.parseInt(request.getParameter("pPrice"));
            int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
            int catId = Integer.parseInt(request.getParameter("catId"));
            Part part = request.getPart("pPic");
            
            Product p =  new Product();
            p.setpName(pName);
            p.setpDescription(pDescription);
            p.setpPrice(pPrice);
            p.setpDiscount(pDiscount);
            p.setpQty(pQuantity);
            p.setpImage(part.getSubmittedFileName());
            p.setCatId(catId);
            
      //      CategoryDAO cdao = new CategoryDAO(DAOConnection.sqlconnection());
     //       Category category = cdao.
            
            ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
            pdao.saveProducts(p);
            
            String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
            System.out.println(path);
            
            try {
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();
                
                byte[] data = new byte[is.available()];
                
                is.read(data);
                
                fos.write(data);
                
                fos.close();
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("success_message", "Product Added Successfully...");
    //        response.sendRedirect("admin.jsp");
            if(p.getCatId()==1)
            {
                response.sendRedirect("mobile.jsp");
            }
            else if(p.getCatId()==2)
            {
                response.sendRedirect("laptop.jsp");
            }
            else
            {
                session.setAttribute("success_message", "Product Added Successfully...");
                response.sendRedirect("admin.jsp");
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
