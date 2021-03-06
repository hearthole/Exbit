<%@page import="java.util.List"%>
<%@page import="user.Memberinfo"%>
<%@page import="controller.MemDAO"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemDAO mb = MemDAO.getInstance();
	request.setCharacterEncoding("utf-8");
	List<Memberinfo> memb = (List<Memberinfo>)mb.selectAllUsers();
	request.setAttribute("members", memb);
%>

<c:if test="${members!=null}">
<members>
<c:forEach var="i" items="${members}" varStatus="status">
<member>
	<USERID>
	${i.USERID}
	</USERID>
	<USERPW>
	${i.USERPW}
	</USERPW>
	<USERNAME>
	${i.USERNAME}
	</USERNAME>
	<USERFILE>
	${i.USERFILE}
	</USERFILE>
	<REGDATE>
	${i.REGDATE}
	</REGDATE>
</member>
</c:forEach>
</members>
</c:if>

