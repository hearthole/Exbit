<%@page import="user.Logininfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="user.Memberinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="loginfo" class="user.Logininfo" scope="session"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	pageContext.setAttribute("UID", request.getParameter("USERID"));
	pageContext.setAttribute("UPW", request.getParameter("USERPW"));
%>
	
	<c:choose>
		<c:when test="${members!=null}">
			<c:forEach var="mem" items="${members}">
				<c:if test="${mem.value.USERID==UID and mem.value.USERPW==UPW}">
				<c:set value="${mem.value.USERID}" target="${loginfo}" property="USERID"/>
				<c:set value="${mem.value.USERNAME}" target="${loginfo}" property="USERNAME"/>
				<c:set value="${mem.value.USERFILE}" target="${loginfo}" property="USERFILE"/>
				<script>location.href="../view/my_page.jsp";</script>
				</c:if>
			</c:forEach>
				<c:set value="아이디와 비밀번호를 확인해 주세요." target="${loginfo}" property="logmsg"/>
				<c:set value="${UID}" target="${loginfo}" property="logid"/>
				<c:redirect url="../view/login_page.jsp"/>
		</c:when>
		<c:otherwise>
			<c:set value="아이디와 비밀번호를 확인해 주세요." target="${loginfo}" property="logmsg"/>
			<c:set value="${UID}" target="${loginfo}" property="logid"/>
			<c:redirect url="../view/login_page.jsp"/>
		</c:otherwise>
	</c:choose>

	
