<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-1.10.0.js"></script>
    <% String id = (String)request.getSession(false).getAttribute("USERID"); %>
     <%String name = (String)request.getSession(false).getAttribute("USERNAME");%>
     
     <% 
	if(id==""||name==null){
		%> 
		<script>
		alert('로그인이 필요합니다');
		location.href="login_page.jsp";
		</script>
		<%
	}
	%>
	<script>
	$(document).ready(function(){
		$('#logout').click(function(){
			location.href="logout.jsp";
		});	
	});
	</script>
<div>
<h1>회원정보</h1>
	<div id="memberPhoto"></div>
	<hr>
	<p>아이디(이메일)</p> <%=id %>
	<p>이름</p> <%=name %>
	<br><br>
	<a href="#" role="button" class="btn" id="logout">로그아웃</a>
</div>