package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import coffeeshop.model.UserBean;
import java.util.List;
import coffeeshop.model.ProductBean;
import coffeeshop.model.OrderBean;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    ");

        UserBean user = (UserBean) session.getAttribute("user");
        if (user == null || !"Admin".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
    
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Admin Dashboard - CoffeeShop</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            /* Consistent Theme: Espresso & Mocha */\n");
      out.write("            body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }\n");
      out.write("            \n");
      out.write("            .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }\n");
      out.write("            .navbar-brand img { height: 40px; margin-right: 10px; }\n");
      out.write("\n");
      out.write("            /* Stats Cards matching Order Progress cards */\n");
      out.write("            .stat-card { \n");
      out.write("                border-radius: 15px; \n");
      out.write("                color: #fff; \n");
      out.write("                padding: 24px; \n");
      out.write("                text-align: center; \n");
      out.write("                transition: transform 0.2s;\n");
      out.write("                border: none;\n");
      out.write("                box-shadow: 0 4px 12px rgba(0,0,0,0.08);\n");
      out.write("            }\n");
      out.write("            .stat-card:hover { transform: translateY(-5px); }\n");
      out.write("\n");
      out.write("            /* Professional Palette */\n");
      out.write("            .bg-espresso { background-color: #3e2723; } \n");
      out.write("            .bg-mocha { background-color: #5d4037; }    \n");
      out.write("            .bg-latte { background-color: #8d6e63; }    \n");
      out.write("            .bg-cream { background-color: #a1887f; }    \n");
      out.write("\n");
      out.write("            .nav-tabs .nav-link { color: #5d4037; font-weight: 600; border: none; }\n");
      out.write("            .nav-tabs .nav-link.active { color: #3e2723; border-bottom: 3px solid #3e2723; background: none; }\n");
      out.write("\n");
      out.write("            .table-container { \n");
      out.write("                background: white; \n");
      out.write("                border-radius: 20px; \n");
      out.write("                overflow: hidden; \n");
      out.write("                box-shadow: 0 8px 20px rgba(0,0,0,0.05); \n");
      out.write("            }\n");
      out.write("            .table thead { background-color: #3e2723; color: white; }\n");
      out.write("            \n");
      out.write("            .btn-update { background-color: #3e2723; color: white; border-radius: 20px; font-size: 0.8rem; }\n");
      out.write("            .btn-update:hover { background-color: #5d4037; color: white; }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark shadow-sm\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <a class=\"navbar-brand d-flex align-items-center fw-bold\" href=\"#\">\n");
      out.write("                    <img src=\"img/coffeeshopN.png\" alt=\"Logo\"> Admin Panel\n");
      out.write("                </a>\n");
      out.write("                <div class=\"navbar-nav ms-auto align-items-center\">\n");
      out.write("                    <span class=\"text-white-50 me-3 small\">Admin: <strong class=\"text-white\">");
      out.print( user.getUsername());
      out.write("</strong></span>\n");
      out.write("                    <a class=\"btn btn-outline-light btn-sm rounded-pill px-3 me-2\" href=\"MenuServlet\">Live Menu</a>\n");
      out.write("                    <a class=\"nav-link text-white small\" href=\"LogoutServlet\"><i class=\"bi bi-box-arrow-right\"></i> Logout</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"container mt-4\">\n");
      out.write("            <ul class=\"nav nav-tabs mb-4\" id=\"adminTab\" role=\"tablist\">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <button class=\"nav-link active\" id=\"tab-overview\" data-bs-toggle=\"tab\" data-bs-target=\"#overview\" type=\"button\">Analytics Report</button>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <button class=\"nav-link\" id=\"tab-orders\" data-bs-toggle=\"tab\" data-bs-target=\"#ordersMan\" type=\"button\">Order Queue</button>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <button class=\"nav-link\" id=\"tab-manage\" data-bs-toggle=\"tab\" data-bs-target=\"#manage\" type=\"button\">Product Inventory</button>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            <div class=\"tab-content\" id=\"adminTabContent\">\n");
      out.write("                <div class=\"tab-pane fade show active\" id=\"overview\">\n");
      out.write("                    <div class=\"row g-3 mb-4\">\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"stat-card bg-espresso\">\n");
      out.write("                                <small class=\"text-uppercase opacity-75\">Total Orders</small>\n");
      out.write("                                <h2 class=\"display-6 fw-bold m-0\">");
      out.print( request.getAttribute("totalOrders"));
      out.write("</h2>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"stat-card bg-mocha\">\n");
      out.write("                                <small class=\"text-uppercase opacity-75\">Revenue</small>\n");
      out.write("                                <h2 class=\"display-6 fw-bold m-0\">RM ");
      out.print( String.format("%.2f", request.getAttribute("totalRevenue")));
      out.write("</h2>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"stat-card bg-latte\">\n");
      out.write("                                <small class=\"text-uppercase opacity-75\">Products</small>\n");
      out.write("                                <h2 class=\"display-6 fw-bold m-0\">");
      out.print( request.getAttribute("menuItems"));
      out.write("</h2>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"stat-card bg-cream\">\n");
      out.write("                                <small class=\"text-uppercase opacity-75\">Pending</small>\n");
      out.write("                                <h2 class=\"display-6 fw-bold m-0\">");
      out.print( request.getAttribute("pendingOrders"));
      out.write("</h2>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-12\">\n");
      out.write("                            <div class=\"card border-0 shadow-sm p-4 mb-4\" style=\"border-radius: 20px;\">\n");
      out.write("                                <div class=\"d-flex justify-content-between align-items-center mb-4\">\n");
      out.write("                                    <h5 class=\"m-0 fw-bold\" style=\"color: #3e2723;\">Sales Performance Overview</h5>\n");
      out.write("                                    <button onclick=\"window.print()\" class=\"btn btn-sm btn-outline-brown rounded-pill\">\n");
      out.write("                                        <i class=\"bi bi-printer\"></i> Print PDF Report\n");
      out.write("                                    </button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"bg-light rounded-4 d-flex align-items-center justify-content-center\" style=\"height: 350px; border: 2px dashed #d7ccc8;\">\n");
      out.write("                                    <div class=\"text-center\">\n");
      out.write("                                        <i class=\"bi bi-graph-up text-muted display-1\"></i>\n");
      out.write("                                        <p class=\"text-muted mt-2\">Dynamic Revenue Chart will render here</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"tab-pane fade\" id=\"ordersMan\">\n");
      out.write("                    <div class=\"table-container shadow-sm\">\n");
      out.write("                        <table class=\"table table-hover align-middle mb-0\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th class=\"ps-4\">Order ID</th>\n");
      out.write("                                    <th>Service</th>\n");
      out.write("                                    <th>Customization</th>\n");
      out.write("                                    <th>Status</th>\n");
      out.write("                                    <th class=\"text-center\">Action</th>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                ");

                                    List<OrderBean> orders = (List<OrderBean>) request.getAttribute("orders");
                                    if (orders != null) {
                                        for (OrderBean o : orders) {
                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td class=\"ps-4 fw-bold\">#");
      out.print( o.getOrderId());
      out.write("</td>\n");
      out.write("                                    <td><span class=\"badge rounded-pill bg-info text-dark px-3\">");
      out.print( o.getOrderType());
      out.write("</span></td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <small class=\"text-muted\">\n");
      out.write("                                            ");
      out.print( (o.getOrderCustomization() == null || o.getOrderCustomization().equalsIgnoreCase("null")) ? "No instructions" : o.getOrderCustomization());
      out.write("\n");
      out.write("                                        </small>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.write("\n");
      out.write("                                        <span class=\"badge rounded-pill ");
      out.print( o.getOrderStatus().equals("Done") ? "bg-success" : "bg-warning text-dark");
      out.write(" px-3\">\n");
      out.write("                                            ");
      out.print( o.getOrderStatus());
      out.write("\n");
      out.write("                                        </span>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td class=\"pe-4\">\n");
      out.write("                                        <form action=\"UpdateOrderStatusServlet\" method=\"POST\" class=\"d-flex gap-2 justify-content-center\">\n");
      out.write("                                            <input type=\"hidden\" name=\"orderId\" value=\"");
      out.print( o.getOrderId());
      out.write("\">\n");
      out.write("                                            <select name=\"newStatus\" class=\"form-select form-select-sm rounded-pill\" style=\"width: 140px;\">\n");
      out.write("                                                <option value=\"Pending\" ");
      out.print( o.getOrderStatus().equals("Pending") ? "selected" : "");
      out.write(">Pending</option>\n");
      out.write("                                                <option value=\"In the making\" ");
      out.print( o.getOrderStatus().equals("In the making") ? "selected" : "");
      out.write(">In the making</option>\n");
      out.write("                                                <option value=\"Ready to pickup\" ");
      out.print( o.getOrderStatus().equals("Ready to pickup") ? "selected" : "");
      out.write(">Ready to pickup</option>\n");
      out.write("                                                <option value=\"Done\" ");
      out.print( o.getOrderStatus().equals("Done") ? "selected" : "");
      out.write(">Done</option>\n");
      out.write("                                            </select>\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-sm btn-update px-3\">Update</button>\n");
      out.write("                                            <a href=\"DeleteOrderServlet?id=");
      out.print( o.getOrderId());
      out.write("\" class=\"text-danger ms-2 mt-1\" onclick=\"return confirm('Permanently delete?')\">\n");
      out.write("                                                <i class=\"bi bi-trash\"></i>\n");
      out.write("                                            </a>\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                ");
 } } 
      out.write("\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"tab-pane fade\" id=\"manage\">\n");
      out.write("                    <div class=\"d-flex justify-content-between align-items-center mb-3\">\n");
      out.write("                        <h4 class=\"fw-bold\" style=\"color: #3e2723;\">Product Catalog</h4>\n");
      out.write("                        <a href=\"add_menu.jsp\" class=\"btn btn-mocha rounded-pill px-4 text-white\" style=\"background-color: #5d4037;\">\n");
      out.write("                            <i class=\"bi bi-plus-circle\"></i> Add New Coffee\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"table-container shadow-sm\">\n");
      out.write("                        <table class=\"table table-hover align-middle mb-0\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th class=\"ps-4\">ID</th>\n");
      out.write("                                    <th>Name</th>\n");
      out.write("                                    <th>Price</th>\n");
      out.write("                                    <th>Status</th>\n");
      out.write("                                    <th class=\"text-center\">Manage</th>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                ");

                                    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                                    if (products != null) {
                                        for (ProductBean p : products) {
                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td class=\"ps-4 text-muted\">");
      out.print( p.getProdId());
      out.write("</td>\n");
      out.write("                                    <td><strong style=\"color: #3e2723;\">");
      out.print( p.getProdName());
      out.write("</strong></td>\n");
      out.write("                                    <td class=\"fw-bold\">RM ");
      out.print( String.format("%.2f", p.getProdPrice()));
      out.write("</td>\n");
      out.write("                                    <td><span class=\"badge bg-success-subtle text-success border border-success px-3\">Active</span></td>\n");
      out.write("                                    <td class=\"text-center pe-4\">\n");
      out.write("                                        <a href=\"EditProductServlet?id=");
      out.print( p.getProdId());
      out.write("\" class=\"btn btn-sm btn-outline-mocha rounded-pill px-3\">Edit</a>\n");
      out.write("                                        <a href=\"DeleteProductServlet?id=");
      out.print( p.getProdId());
      out.write("\" class=\"btn btn-sm btn-outline-danger rounded-pill px-3 ms-1\" onclick=\"return confirm('Delete item?')\">Delete</a>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                ");
 } }
      out.write("\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
