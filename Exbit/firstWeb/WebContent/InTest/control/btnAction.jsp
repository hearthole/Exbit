<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 	String logout = (String)request.getParameter("logout");
	
	if (logout!=null) {
		request.getSession(false).invalidate();
		response.sendRedirect("../view/Main.jsp");
	}

	String dkey = (String)request.getParameter("dkey");
	if (dkey!=null) {
		HashMap mem = (HashMap)application.getAttribute("members");
		mem.remove(dkey);
		response.sendRedirect("../view/member_page.jsp");
	}
%>