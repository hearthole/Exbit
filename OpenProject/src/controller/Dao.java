package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {
	Connection conn;
	public Dao() {
		if (conn == null) {
			try {
				// 드라이버로딩
				String jdbcUrl = "jdbc:apache:commons:dbcp:open2";
				conn = DriverManager.getConnection(jdbcUrl);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public Dao(Connection conn) {
		
	}// end dao(conn)

	public void rollback() {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException e) {

			}
		}
	}

	public void close(AutoCloseable... acs) {
		try {
			for (AutoCloseable ac : acs) {
				if (ac != null)
					ac.close();
			}
		} catch (Exception e) {
		}

	}
}

