/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.controller;

import coffeeshop.dao.ProductDao;
import coffeeshop.model.ProductBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ajiji
 */
@MultipartConfig
public class EditProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDao dao = new ProductDao();
        ProductBean product = dao.getProductById(id);
        
        request.setAttribute("product", product);
        request.getRequestDispatcher("edit_menu.jsp").forward(request, response);
    }

    // 2. Process the Update
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProductBean p = new ProductBean();
        p.setProdId(Integer.parseInt(request.getParameter("prodId")));
        p.setProdName(request.getParameter("prodName"));
        p.setProdDescription(request.getParameter("prodDescription"));
        p.setProdPrice(Double.parseDouble(request.getParameter("prodPrice")));

        // Simple filename logic as you requested
        Part filePart = request.getPart("prodImage");
        String fileName = filePart.getSubmittedFileName();
        
        // Use new image if uploaded, otherwise keep the old one
        if (fileName != null && !fileName.isEmpty()) {
            p.setProdImagePath("img/" + fileName);
        } else {
            p.setProdImagePath(request.getParameter("existingImage"));
        }

        ProductDao dao = new ProductDao();
        dao.updateProduct(p);
        response.sendRedirect("DashboardServlet");
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
