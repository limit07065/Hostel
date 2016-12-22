package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class application_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("    <title>Hostel Management System</title>\r\n");
      out.write("\r\n");
      out.write("    <!-- Bootstrap Core CSS -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Custom CSS -->\r\n");
      out.write("    <link href=\"css/logo-nav.css\" rel=\"stylesheet\">\r\n");
      out.write("    <script src=\"js/font-awesome.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\r\n");
      out.write("    <!--[if lt IE 9]>\r\n");
      out.write("        <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\r\n");
      out.write("        <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <!-- Navigation -->\r\n");
      out.write("    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <!-- Brand and toggle get grouped for better mobile display -->\r\n");
      out.write("            <div class=\"navbar-header\">\r\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                </button>\r\n");
      out.write("                <a class=\"navbar-brand\" href=\"#\">\r\n");
      out.write("                    <img src=\"http://placehold.it/150x50&text=Logo\" alt=\"\">\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("                <ul class=\"nav navbar-nav pull-right\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"#\">Room Type </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"#\">Application History</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"#\">Login</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.navbar-collapse -->\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- /.container -->\r\n");
      out.write("    </nav>\r\n");
      out.write("    \r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <h2>Next-Year Application</h2>\r\n");
      out.write("    <form id=\"form\" class=\"form-group\">\r\n");
      out.write("        <label for=\"roomtype\" >Room Type</label>\r\n");
      out.write("\r\n");
      out.write("        <select id=\"roomtype\" name=\"roomtype\" class=\"inline-control\">\r\n");
      out.write("        </select>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <label for=\"block\"  >Block </label>\r\n");
      out.write("        <select id=\"block\" name=\"block\" class=\"inline-control\">\r\n");
      out.write("        </select>\r\n");
      out.write("\r\n");
      out.write("        <label for=\"room\" >Room Number</label>\r\n");
      out.write("        <select id=\"room\" name=\"room\" class=\"inline-control\">\r\n");
      out.write("        </select>\r\n");
      out.write("\r\n");
      out.write("        <input type=\"submit\" class=\"inline-control  btn btn-success\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </form>\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"page-header\">\r\n");
      out.write("            <div class=\"btn-toolbar pull-right\">\r\n");
      out.write("                <span style=\"cursor:pointer;\" class=\"glyphicon glyphicon-plus\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <h2>Current Application</h2>\r\n");
      out.write("        </div>\r\n");
      out.write("            <table class=\"table table-responsive table-hover\" style=\"display:none;\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>Session</th>\r\n");
      out.write("                    <th>Block</th>\r\n");
      out.write("                    <th>Room No.</th>\r\n");
      out.write("                    <th>Room Type</th>\r\n");
      out.write("                    <th>Price/Day</th>\r\n");
      out.write("                    <th>Total</th>\r\n");
      out.write("                    <th>Status</th>\r\n");
      out.write("                    <th>Action</th>\r\n");
      out.write("                </tr> \r\n");
      out.write("            </table>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"page-header\">\r\n");
      out.write("            <div class=\"btn-toolbar pull-right\">\r\n");
      out.write("                <span style=\"cursor:pointer;\" class=\"glyphicon glyphicon-plus\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <h2> Room History </h2>\r\n");
      out.write("        </div>\r\n");
      out.write("            <table class=\"table table-responsive table-hover\" style=\"display:none;\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>Session</th>\r\n");
      out.write("                    <th>Block</th>\r\n");
      out.write("                    <th>Room No.</th>\r\n");
      out.write("                    <th>Room Type</th>\r\n");
      out.write("                    <th>Price/Day</th>\r\n");
      out.write("                    <th>Total</th>\r\n");
      out.write("                </tr> \r\n");
      out.write("            </table>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"footer\" class=\"container\">    \r\n");
      out.write("    <div class=\"col-md-4\">\r\n");
      out.write("        <h3>Developers</h3>\r\n");
      out.write("        <p>\r\n");
      out.write("            Hoo Boon Keong <br>\r\n");
      out.write("            Lim Tze Soon <br>\r\n");
      out.write("            Loh Wen He <br>\r\n");
      out.write("            Pang Cheng Hao <br>\r\n");
      out.write("            Raymond Tan Wei Yi \r\n");
      out.write("        </p>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-md-4\">\r\n");
      out.write("        <h3> All rights reserved.</h3>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- jQuery -->\r\n");
      out.write("<script src=\"js/jquery.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- Bootstrap Core JavaScript -->\r\n");
      out.write("<script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(function() {\r\n");
      out.write("        $(\"span.glyphicon\").click(function(){\r\n");
      out.write("            if (this.className === \"glyphicon glyphicon-plus\"){\r\n");
      out.write("                $(this).parents(\".container\").children(\"table\").slideDown(\"slow\");\r\n");
      out.write("                $(this).removeClass('glyphicon-plus').addClass('glyphicon-minus');\r\n");
      out.write("            }\r\n");
      out.write("            else{\r\n");
      out.write("                $(this).parents(\".container\").children(\"table\").slideUp(\"slow\");\r\n");
      out.write("                $(this).removeClass('glyphicon-minus').addClass('glyphicon-plus');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
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
