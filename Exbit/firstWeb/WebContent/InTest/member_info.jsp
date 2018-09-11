<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	HashMap<String,Memberinfo> member = (HashMap<String,Memberinfo>)application.getAttribute("members");
	if(member!=null){
		for(String mem : member.keySet()){ //테이블보여주기
%>
<div class="userbox">
	<div class="userPhoto">
		<img class="profile" src="../img/<%=member.get(mem).getUSERFILE()%>" />
	</div>
	<div class="userInfo">
		아이디 =
		<%=member.get(mem).getUSERID()%>
		<br /> 비밀번호 =
		<%=member.get(mem).getUSERPW()%>
		<br /> 이름 =
		<%=member.get(mem).getUSERNAME()%>
		<br /> 프로필사진 =
		<%=member.get(mem).getUSERFILE()%>
	</div>
</div>
<%
		}
	}
%>
