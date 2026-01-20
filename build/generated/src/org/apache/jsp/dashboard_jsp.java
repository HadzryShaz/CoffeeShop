package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Dashboard - CoffeeShop</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\n");
      out.write("    <style>\n");
      out.write("        /* Stronger, neat card colors */\n");
      out.write("        .card-total-orders { background-color: #00b4d8; color: #fff; }\n");
      out.write("        .card-total-revenue { background-color: #90be6d; color: #fff; }\n");
      out.write("        .card-menu-items { background-color: #f4a261; color: #fff; }\n");
      out.write("        .card-pending-orders { background-color: #e76f51; color: #fff; }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-light\">\n");
      out.write("\n");
      out.write("<!-- Navbar -->\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <a class=\"navbar-brand\" href=\"index.html\">CoffeeShop</a>\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\"\n");
      out.write("                data-bs-target=\"#navbarNav\">\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("            <ul class=\"navbar-nav ms-3\">\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" href=\"login.html\">Login</a></li>\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" href=\"menu_list.html\">Menu</a></li>\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" href=\"cart.html\">Cart</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <ul class=\"navbar-nav ms-auto\">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link d-flex align-items-center\" href=\"find_us.html\">\n");
      out.write("                        <img src=\"img/location.png\" alt=\"location\" style=\"width:18px; height:18px; margin-right:6px;\">\n");
      out.write("                        Find our store\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("<div class=\"container mt-5\">\n");
      out.write("    <h2 class=\"mb-4 text-center\">Dashboard Overview</h2>\n");
      out.write("\n");
      out.write("    <!-- Summary Cards -->\n");
      out.write("    <div class=\"row mb-4 g-3\">\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("            <div class=\"card card-total-orders text-center p-3 shadow-sm\">\n");
      out.write("                <h5 class=\"card-title\">Total Orders</h5>\n");
      out.write("                <p class=\"fs-3 mb-0\">45</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("            <div class=\"card card-total-revenue text-center p-3 shadow-sm\">\n");
      out.write("                <h5 class=\"card-title\">Total Revenue</h5>\n");
      out.write("                <p class=\"fs-3 mb-0\">$650</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("            <div class=\"card card-menu-items text-center p-3 shadow-sm\">\n");
      out.write("                <h5 class=\"card-title\">Menu Items</h5>\n");
      out.write("                <p class=\"fs-3 mb-0\">12</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("            <div class=\"card card-pending-orders text-center p-3 shadow-sm\">\n");
      out.write("                <h5 class=\"card-title\">Pending Orders</h5>\n");
      out.write("                <p class=\"fs-3 mb-0\">8</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Charts -->\n");
      out.write("    <div class=\"row g-4\">\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("            <div class=\"card shadow-sm\">\n");
      out.write("                <div class=\"card-header bg-white\">Orders by Type</div>\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <canvas id=\"orderTypeChart\"></canvas>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("            <div class=\"card shadow-sm\">\n");
      out.write("                <div class=\"card-header bg-white\">Revenue by Menu Item</div>\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <canvas id=\"revenueChart\"></canvas>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    // Colors match the cards\n");
      out.write("    const orderColors = ['#00b4d8','#90be6d','#e76f51'];\n");
      out.write("    const revenueColors = ['#00b4d8','#90be6d','#f4a261','#e76f51','#00b4d8'];\n");
      out.write("\n");
      out.write("    // Orders by Type Pie Chart\n");
      out.write("    const orderTypeCtx = document.getElementById('orderTypeChart').getContext('2d');\n");
      out.write("    new Chart(orderTypeCtx, {\n");
      out.write("        type: 'pie',\n");
      out.write("        data: {\n");
      out.write("            labels: ['Dine-In', 'Take-Away', 'Delivery'],\n");
      out.write("            datasets: [{\n");
      out.write("                data: [20, 15, 10],\n");
      out.write("                backgroundColor: orderColors\n");
      out.write("            }]\n");
      out.write("        },\n");
      out.write("        options: { plugins: { legend: { position: 'bottom' } } }\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    // Revenue by Menu Item Bar Chart\n");
      out.write("    const revenueCtx = document.getElementById('revenueChart').getContext('2d');\n");
      out.write("    new Chart(revenueCtx, {\n");
      out.write("        type: 'bar',\n");
      out.write("        data: {\n");
      out.write("            labels: ['Latte', 'Americano', 'Croissant', 'Mocha Latte', 'Macchiato'],\n");
      out.write("            datasets: [{\n");
      out.write("                label: 'Revenue ($)',\n");
      out.write("                data: [75, 50, 55, 85, 95],\n");
      out.write("                backgroundColor: revenueColors\n");
      out.write("            }]\n");
      out.write("        },\n");
      out.write("        options: {\n");
      out.write("            scales: { y: { beginAtZero: true } },\n");
      out.write("            plugins: { legend: { display: false } }\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("</body>\n");
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
