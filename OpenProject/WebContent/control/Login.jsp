<%@page import="user.Logininfo"%>
<%@page import="java.util.List"%>
<%@page import="user.Memberinfo"%>
<%@page import="controller.MemDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="loginfo" class="user.Logininfo" scope="session"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	MemDAO mb = MemDAO.getInstance();
	Memberinfo memb = mb.selectUser(request.getParameter("USERID")); 
	pageContext.setAttribute("mem", memb);
%>
	
	<c:choose>
		<c:when test="${mem!=null}">
				<c:if test="${mem.USERID==param.USERID and mem.USERPW==param.USERPW}">
				<c:set value="${mem.USERID}" target="${loginfo}" property="USERID"/>
				<c:set value="${mem.USERNAME}" target="${loginfo}" property="USERNAME"/>
				<c:set value="${mem.USERFILE}" target="${loginfo}" property="USERFILE"/>
				<c:set value="${mem.REGDATE}" target="${loginfo}" property="REGDATE"/>
				<script>location.href="../view/my_page.jsp";</script>
				</c:if>
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

	
