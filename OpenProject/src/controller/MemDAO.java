package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import user.Memberinfo;

public class MemDAO extends Dao {
	
	private MemDAO() {
	}

	private static class Single {
		private static final MemDAO instance = new MemDAO();
	}

	public List<Memberinfo> selectAllUsers() {
		ResultSet rs = null;
		try {
			String sql = "select * from MEMBER"; // sql 쿼리
			Statement stmt = conn.createStatement();
			List<Memberinfo> li = new ArrayList<Memberinfo>(); // 임시리스트 생성
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Memberinfo sel = new Memberinfo(); // 임시 User객체 생성
				sel.setUSERID(rs.getString(2));
				sel.setUSERPW(rs.getString(3));
				sel.setUSERNAME(rs.getString(4));
				sel.setUSERFILE(rs.getString(5));
				sel.setREGDATE(rs.getString(6));
				li.add(sel); // li 리스트에 담는다
			}
			System.out.println("레코드를 선택했습니다."); // 성공시 메시지 출력
			return li;
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("레코드 선택에 실패했습니다.");
			return null;
		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} // result 객체 해제
		}

	}// end selectAllusers()

	public Memberinfo selectUser(String userId) {
		ResultSet rs = null;
		Memberinfo sel = new Memberinfo();
		try {
			String sql = "select * from MEMBER where USERID='"+userId+"'"; // sql 쿼리
			Statement stmt = conn.createStatement(); // stament 생성
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				sel.setUSERID(rs.getString(2));
				sel.setUSERPW(rs.getString(3));
				sel.setUSERNAME(rs.getString(4));
				sel.setUSERFILE(rs.getString(5));
				sel.setREGDATE(rs.getString(6));
			}
			System.out.println("레코드를 선택했습니다."+userId); // 성공시 메시지 출력
			return sel;
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("레코드 선택에 실패했습니다.");
			return null;
		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				} // result 객체 해제
		}
	}// end selectUser()

	public int deleteUser(String userId) {
		PreparedStatement pstmt = null;
		try {
			int dcnt = 0;
			String sql = "delete from MEMBER where USERID=?"; // sql 쿼리
			pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt.setString(1, userId); // pstmt의 첫번째값을 userId로 설정
			dcnt = pstmt.executeUpdate(); // 쿼리를 실행한다.
			System.out.println("레코드를 삭제했습니다." + dcnt + "줄"); // 성공시 메시지 출력
			return dcnt; // 성공한쿼리수 리턴
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("레코드 삭제에 실패했습니다.");
			return -1;
		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement 객체 해제
		}
	}// end deleteUser

	public int updateUser(Memberinfo up) {
		PreparedStatement pstmt = null;
		try {
			int ucnt = 0;
			String sql = "update MEMBER set USERID=?,USERPW=?,USERNAME=?,USERFILE=?,REGDATE=sysdate where USERID=?"; // sql쿼리
			pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt.setString(1, up.getUSERID()); // 해당 아이디의 행을 변경하는것이다.
			pstmt.setString(2, up.getUSERPW()); // pstmt의 각 요소마다 up객체의 값 대입
			pstmt.setString(3, up.getUSERNAME());
			pstmt.setString(4, up.getUSERFILE());
			pstmt.setString(5, up.getUSERID());
			ucnt = pstmt.executeUpdate(); // 쿼리를 실행한다.
			System.out.println("레코드를 변경했습니다." + ucnt + "줄"); // 성공시 메시지 출력
			return ucnt; // 성공한 쿼리수 리턴
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("레코드 변경에 실패했습니다.");
			return -1;
		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement 객체 해제
		}

	}// end updateUser

	public int insertUser(Memberinfo u) {
		PreparedStatement pstmt = null;
		try {
			int icnt = 0;
			String sql = "insert into MEMBER values(idx.NEXTVAL,?,?,?,?,sysdate)"; // sql 쿼리
			pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt.setString(1, u.getUSERID()); // 각 pstmt에 값 대입
			pstmt.setString(2, u.getUSERPW());
			pstmt.setString(3, u.getUSERNAME());
			pstmt.setString(4, u.getUSERFILE());
			icnt = pstmt.executeUpdate(); // 쿼리를 실행한다.
			System.out.println("member 테이블에 새로운 레코드를 추가했습니다."); // 성공시 메시지 출력
			return icnt;
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("member 테이블에 새로운 레코드 추가에 실패했습니다.");
			return -1;
		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement 객체 해제
		}

	}

	public static MemDAO getInstance() {
		return Single.instance;
	}
}