<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<style>
.userPhoto {
	display: inline-block;
	float: left;
	margin-right: 20px;
}

.userPhoto .profile {
	height: 80px;
	width: 80px;
}

.userInfo {
	display: inline-block;
}

.userbox {
	width:100%;
	position:relative;
	display:inline-block;
	padding-top:20px;
	padding-bottom: 20px;
	border-bottom: 1px solid grey;
}
</style>
<%
	request.setCharacterEncoding("utf-8");
	HashMap<String,Memberinfo> member = new HashMap<String,Memberinfo>();

	if (application.getAttribute("memberMap") != null) {
		member = (HashMap<String,Memberinfo>)(application.getAttribute("memberMap")); //기존 멤버리스트 받아오기
	}

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
%>
