<%@page import="java.util.ArrayList"%>
<%@page import="user.Memberinfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%System.out.println("시작="+application.getAttribute("memberlist")); %>
<jsp:useBean id="User" class="user.Memberinfo" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="User" />
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<Memberinfo> member = new ArrayList<Memberinfo>();
	
	if(application.getAttribute("memberlist")!=null){
	member = (ArrayList<Memberinfo>)(application.getAttribute("memberlist")); //기존 멤버리스트 받아오기
	}
	
	member.add(User); //만들어진 객체 멤버리스트에 추가
	
	for(Memberinfo mem : member){ //테이블보여주기
	%>
		아이디 = <%=mem.getUSERID()%>
		<br> 비밀번호 = <%=mem.getUSERPW()%>
		<br> 이름 = <%=mem.getUSERNAME()%>
		<br> 프로필이미지 = <%=mem.getUSERFILE()%><hr>
	<%
    }
	application.setAttribute("memberlist", member);	//멤버리스트 새값으로변경
	response.sendRedirect("member_page.jsp");
	%>

