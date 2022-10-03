import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebFilter(urlPatterns = "*")
public class  SecutiryFilter implements Filter{

    public void init(FilterConfig arg0) throws ServletException {}

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {


        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        System.out.println(httpServletRequest.getRequestURL().toString());
        if(!httpServletRequest.getRequestURL().toString().contains("login")) {
            HttpServletResponse httpServletResponse= (HttpServletResponse) resp;
            final Object loggedIn = httpServletRequest.getSession().getAttribute("loggedIn");
            if (loggedIn == null || ((Boolean) loggedIn) == false) {
                httpServletResponse.sendRedirect("/webapp/login.jsp");
            }
        }

        chain.doFilter(req, resp);//sends request to next resource

    }
    public void destroy() {}
}