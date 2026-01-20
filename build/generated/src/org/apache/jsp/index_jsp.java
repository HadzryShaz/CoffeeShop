package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>CoffeeShop</title>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .card-img-standard {\n");
      out.write("                height: 200px; /* Set a fixed height for the *container* */\n");
      out.write("                width: 100%; /* Ensures the container takes the full width */\n");
      out.write("                object-fit: contain; /* **The key change**: Resizes while preserving aspect ratio */\n");
      out.write("\n");
      out.write("                /* Optional: Add a background color to the container \n");
      out.write("                   to fill the empty space left by 'contain' */\n");
      out.write("                background-color: #f8f9fa; /* Light gray background to match bg-light body */\n");
      out.write("            }\n");
      out.write("            .navbar-nav .nav-item {\n");
      out.write("                padding: 0 15px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"bg-light\">\n");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.html\">CoffeeShop</a>\n");
      out.write("\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\"\n");
      out.write("                        data-bs-target=\"#navbarNav\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("                    <ul class=\"navbar-nav ms-3\"> \n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"login.html\">Login</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"menu_list.html\">Menu</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"cart.html\">Cart</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"navbar-nav ms-auto\">\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link d-flex align-items-center\" href=\"find_us.html\">\n");
      out.write("                                Find our store&nbsp;&nbsp;\n");
      out.write("                                <img src=\"img/location.png\" alt=\"location\" \n");
      out.write("                                     style=\"width:18px; height:18px; margin-right:6px;\">\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid bg-white text-center p-5 shadow-sm\">\n");
      out.write("            <h1 class=\"display-5 fw-bold\">Welcome to CoffeeShop</h1>\n");
      out.write("            <p class=\"lead\">Freshly brewed coffee and warm pastries daily</p>\n");
      out.write("            <a href=\"menu_list.html\" class=\"btn btn-primary btn-lg\">Order Now</a>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"container mt-5\">\n");
      out.write("            <h2 class=\"text-center mb-4\">Today's Recommended Items</h2>\n");
      out.write("\n");
      out.write("            <div class=\"row g-4 justify-content-center\">\n");
      out.write("\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                    <div class=\"card h-100 shadow-sm\">\n");
      out.write("                        <img src=\"img/stock_latte.jpg\" class=\"card-img-standard\" alt=\"Latte\">\n");
      out.write("                        <div class=\"card-body text-center\">\n");
      out.write("                            <h5 class=\"card-title\">Latte</h5>\n");
      out.write("                            <p class=\"card-text\">Rich, smooth, and creamy</p>\n");
      out.write("                            <a href=\"menu_list.html\" class=\"btn btn-outline-primary\">Order</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                    <div class=\"card h-100 shadow-sm\">\n");
      out.write("                        <img src=\"img/stock_croissant.jpg\" class=\"card-img-standard\" alt=\"Croissant\">\n");
      out.write("                        <div class=\"card-body text-center\">\n");
      out.write("                            <h5 class=\"card-title\">Croissant</h5>\n");
      out.write("                            <p class=\"card-text\">Fresh and buttery</p>\n");
      out.write("                            <a href=\"menu_list.html\" class=\"btn btn-outline-primary\">Order</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                    <div class=\"card h-100 shadow-sm\">\n");
      out.write("                        <img src=\"img/stock_americano.jpg\" class=\"card-img-standard\" alt=\"Americano\">\n");
      out.write("                        <div class=\"card-body text-center\">\n");
      out.write("                            <h5 class=\"card-title\">Americano</h5>\n");
      out.write("                            <p class=\"card-text\">Bold traditional brew</p>\n");
      out.write("                            <a href=\"menu_list.html\" class=\"btn btn-outline-primary\">Order</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <footer class=\"bg-dark text-white text-center py-3 mt-5\">\n");
      out.write("            <p>&copy; 2025 CoffeeShop</p>\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
