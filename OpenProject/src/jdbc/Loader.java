package jdbc;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/Loader")
public class Loader extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		
		try {
			String drivers = config.getInitParameter("jdbcdriver");
			StringTokenizer tokenizer = new StringTokenizer(drivers,",");
			
			while(tokenizer.hasMoreTokens()) {
				String driver = tokenizer.nextToken();
				//데이터베이스 드라이버 로드
				Class.forName(driver);
				System.out.println(driver+": 데이터베이스 드라이버 로드 성공!");
			}
			} catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
		
	}

}
