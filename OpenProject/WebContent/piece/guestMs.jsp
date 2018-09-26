<%@page import="guest.model.Message"%>
<%@page import="guest.model.MessageListView"%>
<%@page import="guest.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="guestMsBox">
		<form class="writeMsg" action="../control/WriteMessage.jsp">
			<table>
				
				<tr><td>이름</td><td><input type="text" id="guestName" name="guestName"></td></tr>
				<tr><td>비밀번호</td><td><input type="password" id="password" name="password"></td></tr>
				<tr><td>내용</td><td><textarea  name="message" rows="10" style="width:100%;"></textarea></td></tr>
				<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
			</table>
		</form>
	</div>
	<hr>
	<%
		if (viewData.isEmpty()) {
	%>
	등록된 메시지가 없습니다.
	<%
		} else { /* 메시지 있는 경우 처리 시작 */
	%>
	<table border="1">
		<%
			for (Message message : viewData.getMessageList()) {
		%>
		<tr>
			<td>메시지 번호: <%=message.getId()%> <br /> 손님 이름: <%=message.getGuestName()%>
				<br /> 메시지: <%=message.getMessage()%> <br /> <a
				href="../piece/confirmDeletion.jsp?messageId=<%=message.getId()%>">
					[삭제하기]</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	%>
	<a href="../view/guestMs_page.jsp?page=<%=i%>">[<%=i%>]
	</a>
	<%
		}
	%>
	<%
		} /* 메시지 있는 경우 처리 끝 */
	%>

</body>
</html>