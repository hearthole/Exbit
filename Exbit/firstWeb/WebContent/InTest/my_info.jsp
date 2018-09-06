<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String id = (String)request.getSession(false).getAttribute("USERID"); %>
     <%String name = (String)request.getSession(false).getAttribute("USERNAME");%>
<div>
<h1>회원정보</h1>
	<div id="memberPhoto"></div>
	<hr>
	<p>아이디(이메일)</p> <%=id %>
	<p>이름</p> <%=name %>
</div>