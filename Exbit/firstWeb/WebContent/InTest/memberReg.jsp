<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="User" class="user.Memberinfo" scope="page"></jsp:useBean>
<jsp:useBean id="members" class="java.util.HashMap" scope="application"></jsp:useBean>
<jsp:setProperty property="*" name="User" />
<%
	request.setCharacterEncoding("utf-8");
	members.put(User.getUSERID(),User);
	response.sendRedirect("member_page.jsp");
%>

