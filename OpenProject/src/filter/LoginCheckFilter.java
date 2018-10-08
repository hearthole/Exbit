package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import user.Logininfo;

@WebFilter("/LoginCheckFilter")
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {
    }
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		boolean login = false;
		if(session!=null) {
			Logininfo info = (Logininfo) session.getAttribute("loginfo");
			if(info!=null&&info.getUSERID()!=null) {
				System.out.println(info.getUSERID());
				login=true;
			}
		}
		if(login) {
			chain.doFilter(request, response);
		}else {
			request.setAttribute("msg", "'로그인해주세요!'");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/login_page.jsp");
			dispatcher.forward(request, response);
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}


