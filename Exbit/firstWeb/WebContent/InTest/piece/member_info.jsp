<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script>
	$(document).ready(function(){
		
	});
	
	function deleteM(key) {
		location.href="../control/btnAction.jsp?dkey="+key;
	}
</script>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:choose>
	<c:when test="${members!=null}">
		<c:forEach var="i" items="${members}">
			<div class="userbox">
				<div class="userPhoto">
					<img class="profile" src="../img/${i.value.USERFILE}" />
				</div>
				<div class="userInfo">
					<p>아이디 = ${i.value.USERID}</p>
					<p>비밀번호 = ${i.value.USERPW}</p>
					<p>이름 = ${i.value.USERNAME}</p>
					<p>프로필사진 = ${i.value.USERFILE}</p>
				</div>
				<div class="userModi">
					<a href="../view/modify_page.jsp?mkey=${i.key}" role="button"
						class="btn modibtn" id="modifybtn">수정</a> <br> <a href="#"
						role="button" class="btn modibtn" id="deletebtn"
						onclick="deleteM('${i.key}')">삭제</a>
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<h1>회원목록이 없습니다.</h1>
	</c:otherwise>
</c:choose>