<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	String USERID = request.getParameter("USERID");
	String USERPW = request.getParameter("USERPW");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/InTest.css" type="text/css">
</head>
<body>
	<%
		if (USERID != "" && USERPW != "" && USERID.equals(USERPW)) {
			response.sendRedirect("my_page.jsp");
		} else {
	%>
	<div id="wrongIDPW">
		<h2>로그인</h2>
		<hr>
		<h3>아이디 또는 비밀번호가 틀립니다.</h3>
		<h3>
			<a href="login_page.jsp" class="btn">다시 로그인하기</a>
		</h3>
	</div>
	<%
		}
	%>
</body>
</html>