/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.controller;

import coffeeshop.dao.OrderDao;
import coffeeshop.model.CartItemBean;
import coffeeshop.model.OrderBean;
import coffeeshop.model.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ajiji
 */
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (cart != null && !cart.isEmpty()) {
            OrderBean order = new OrderBean();
            order.setUserId(user.getUserId()); // From USER_ID
            order.setOrderType(request.getParameter("orderType")); // Dine In / Take Away
            order.setOrderStatus("Pending");

            // Calculate Total Price
            double total = 0;
            for (CartItemBean item : cart) {
                total += (item.getProduct().getProdPrice() * item.getQuantity());
            }
            order.setTotalPrice(total);

            OrderDao dao = new OrderDao();
            // This method will handle both ORDERS and ORDER_ITEMS tables
            boolean success = dao.placeOrder(order, cart);

            if (success) {
                session.removeAttribute("cart"); // Clear cart on success
                response.sendRedirect("order_progress.jsp?msg=success");
            } else {
                response.sendRedirect("cart.jsp?err=failed");
            }
        }
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
