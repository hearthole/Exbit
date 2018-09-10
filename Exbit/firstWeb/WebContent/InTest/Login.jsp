<%@page import="user.Logininfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="loginfo" class="user.Logininfo" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String UID = request.getParameter("USERID");
	String UPW = request.getParameter("USERPW");
	HashMap<String,Memberinfo> member = (HashMap<String,Memberinfo>)application.getAttribute("members");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/InTest.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
</head>
<body>
	<% 
		if(member!=null){
			for(String mem : member.keySet()){
				if (mem.equals(UID)&&member.get(mem).getUSERPW().equals(UPW)) {
					loginfo.setUSERID(member.get(mem).getUSERID());
					loginfo.setUSERNAME(member.get(mem).getUSERNAME());
					loginfo.setUSERFILE(member.get(mem).getUSERFILE());
					response.sendRedirect("my_page.jsp");
				}
			}
		}
	%>
</body>
	<div id="wrongIDPW">
		<h2>로그인</h2>
		<hr>
		<h3>아이디 또는 비밀번호가 틀립니다.</h3>
		<h3>
			<a href="login_page.jsp" class="btn">다시 로그인하기</a>
		</h3>
	</div>
</html>