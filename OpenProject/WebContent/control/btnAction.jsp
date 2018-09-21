<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@page import="controller.MemDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 	String logout = (String)request.getParameter("logout");
	
	MemDAO mb = MemDAO.getInstance();

	if (logout!=null) {
		request.getSession(false).invalidate();
		response.sendRedirect("../view/Main.jsp");
	}

	String dkey = (String)request.getParameter("dkey");
	if (dkey!=null) {
		mb.deleteUser(dkey);
		response.sendRedirect("../view/member_page.jsp");
	}
%>