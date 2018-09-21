<%@page import="controller.MemDAO" %>
<%@page import="user.Memberinfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="User" class="user.Memberinfo" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="User" />
<%
	
	MemDAO mem = MemDAO.getInstance();
	request.setCharacterEncoding("utf-8");
	String up = request.getParameter("mkey");
	if(up!=null){
	mem.updateUser(User);	
	}else{
	mem.insertUser(User);
	}
	response.sendRedirect("../view/member_page.jsp");
%>

