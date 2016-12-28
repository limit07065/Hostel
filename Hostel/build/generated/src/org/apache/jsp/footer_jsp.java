package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
