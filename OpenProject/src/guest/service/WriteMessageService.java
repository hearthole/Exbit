package guest.service;

import java.sql.Connection;
import java.sql.SQLException;

import controller.Dao;
import controller.MessageDAO;
import guest.connection.ConnectionProvider;
import guest.model.Message;
import jdbc.JdbcUtil;

public class WriteMessageService extends Dao {
	
	private WriteMessageService() {
	}

	private static class Single {
		private static final  WriteMessageService instance = new  WriteMessageService();
	}
	
	public void write(Message msg) throws ServiceException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDAO messageDao = MessageDAO.getInstance();
			messageDao.insert(conn,msg);
		}catch(SQLException e) {
			throw new ServiceException("메세지 등록 실패: " + e.getMessage());
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public static WriteMessageService getInstance() {
		return Single.instance;
	}
	
}
