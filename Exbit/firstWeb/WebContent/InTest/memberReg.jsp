<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	String USERID = request.getParameter("USERID");
	String USERPW = request.getParameter("USERPW");
	String USERNAME = request.getParameter("USERNAME");
%>
<div>
	아이디 =
	<%=USERID%>
	<br> 비밀번호 =
	<%=USERPW%>
	<br> 이름 =
	<%=USERNAME%>
	<br>
</div>