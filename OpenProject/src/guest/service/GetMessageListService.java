package guest.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import controller.Dao;
import controller.MessageDAO;
import guest.connection.ConnectionProvider;
import guest.model.Message;
import guest.model.MessageListView;
import jdbc.JdbcUtil;

public class GetMessageListService extends Dao {
	private GetMessageListService() {
	}

	private static class Single {
		private static final GetMessageListService instance = new GetMessageListService();
	}

	public static GetMessageListService getInstance() {
		return Single.instance;
	}

	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	public MessageListView getMessageList(int pageNumber) throws ServiceException {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDAO messageDao = MessageDAO.getInstance();
			// 전체 메시지 구하기
			int messageTotalCount = messageDao.selectCount(conn);
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if (messageTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				messageList = messageDao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList, messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE,
					firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("메시지 목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
