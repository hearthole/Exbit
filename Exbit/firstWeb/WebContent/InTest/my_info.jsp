<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
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
	width: 100%;
	position: relative;
	display: inline-block;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid grey;
}
</style>
<script>
	$(document).ready(function(){
		$('#logout').click(function(){
			location.href="logout.jsp";
		});	
	});
	</script>
	
<% 	request.setCharacterEncoding("utf-8");
		String UID = (String)request.getSession(false).getAttribute("USERID"); 
		HashMap<String, Memberinfo> member = new HashMap<String, Memberinfo>();

		if (application.getAttribute("memberMap") != null) {
			member = (HashMap<String, Memberinfo>) (application.getAttribute("memberMap")); //기존 멤버리스트 받아오기
		}
		%>
	<% 
	if(UID==""||UID==null){
		%>
		<script>
		alert('로그인이 필요합니다');
		location.href="login_page.jsp";
		</script>
	<%
	}else{
	%>
	<div class="userbox">
		<div class="userPhoto">
			<img class="profile" src="../img/<%=member.get(UID).getUSERFILE()%>" />
		</div>
		<div class="userInfo">
			아이디 =
			<%=member.get(UID).getUSERID()%>
			<br /> 비밀번호 =
			<%=member.get(UID).getUSERPW()%>
			<br /> 이름 =
			<%=member.get(UID).getUSERNAME()%>
			<br /> 프로필사진 =
			<%=member.get(UID).getUSERFILE()%>
		</div>
	</div>
	<%
	}
	%>

