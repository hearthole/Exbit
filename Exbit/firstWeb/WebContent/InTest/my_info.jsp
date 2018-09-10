<%@page import="user.Logininfo"%>
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
	Logininfo lo = (Logininfo)request.getSession(false).getAttribute("loginfo");
	if(lo==null||lo.getUSERID()==null){
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
			<img class="profile" src="../img/${loginfo.USERFILE}" />
		</div>
		<div class="userInfo">
			아이디 =
			${loginfo.USERID}
			<br /> 이름 =
			${loginfo.USERNAME}
			<br /> 프로필사진 =
			${loginfo.USERFILE}
		</div>
	</div>
	<%
	}
	%>

