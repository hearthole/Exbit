<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<%
	String id = (String) request.getSession(false).getAttribute("USERID");
	String name = (String) request.getSession(false).getAttribute("USERNAME");
%>
<script>

	$(document).ready(function(){
		$('#logout2').click(function(){
			location.href="logout.jsp";
		});	
	});
	</script>
<%
if(id!=null||name!=null){
%>
<%=id%><br>
<%=name%> 님 환영합니다! <br>
	<a href="#" role="button" class="btn" id="logout2">로그아웃</a>
<%
	} else {
%>

<div>
	<form id="USERJOIN" action="Login.jsp" method="post">
		<table>
			<tr>
				<td><label for="USERID">아이디</label></td>
				<td><input type="text" class="input_login" id="USERID"
					name="USERID"></td>
			</tr>
			<tr>
				<td><label for="USERPW">비밀번호</label></td>
				<td><input type="password" class="input_login" id="USERPW"
					name="USERPW"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" class="btn" id="USERSUB" name="USERSUB"></td>
			</tr>
		</table>
	</form>
</div>
<%
	}
%>
