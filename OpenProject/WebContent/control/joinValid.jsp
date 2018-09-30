<%@page import="controller.MemDAO"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/InTest.css" type="text/css">
<%
	Memberinfo mem = new Memberinfo();
	String keyid = (String)request.getParameter("keyid");
	MemDAO dao = MemDAO.getInstance();
	mem = dao.selectUser(keyid);
	if(mem!=null){
		if(mem.getUSERID()!=null){
		request.setAttribute("s", "아이디가 중복됩니다.");
		%><script>$('#idform').addClass("invalidform");</script><%
		} else if(keyid==""){
			request.setAttribute("s", "아이디를 입력해주세요.");
			%><script>$('#idform').addClass("invalidform");</script><%
		} else {
			request.setAttribute("s", "사용가능한 아이디입니다.");		
			%><script>$('#idform').addClass("validform");</script><%
		}
	}
%>
<p id="idform">${s}</p>