<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.MessageDAO" %>
<%@ page import="guest.service.WriteMessageService" %>
<% 
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="guest.model.Message"></jsp:useBean>
<jsp:setProperty name="message" property="*"/>

<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
<!DOCTYPE html>
<html>
<head> <title>방명록 메시지 남김</title> </head>
<body>
방명록에 메시지를 남겼습니다.
<br/>
<a href="../view/guestMs_page.jsp">[목록 보기]</a>
</body>
</html>