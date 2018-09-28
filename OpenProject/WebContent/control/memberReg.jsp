<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="controller.MemDAO" %>
<%@page import="user.Memberinfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="User" class="user.Memberinfo" scope="page"></jsp:useBean>
<%
	
	MemDAO mem = MemDAO.getInstance();
	request.setCharacterEncoding("utf-8");
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if(isMultipart){
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items = upload.parseRequest(request);
		
		Iterator<FileItem> itr = items.iterator();
		
		while(itr.hasNext()){
			FileItem item = itr.next();
			if(item.isFormField()){
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				switch(name){
				case "USERID":
					User.setUSERID(value);
					break;
				case "USERPW":
					User.setUSERPW(value);
					break;
				case "USERNAME":
					User.setUSERNAME(value);
					break;
				}
			} else {
				if(item.getFieldName().equals("USERFILE")&&item.getName()!=""&&item.getSize()>0){
				String newFileName = "";
				String fileName = item.getName();
				newFileName = System.currentTimeMillis()+"_"+fileName;
				String uploadUri = "/file";
				String dir = request.getSession().getServletContext().getRealPath(uploadUri);
				File file = new File(dir,newFileName);
				
				item.write(file);
				String di = request.getContextPath()+"/file/"+newFileName;
				User.setUSERFILE(di);
				}
			}
		}
	}

	
	if(request.getParameter("mkey")!=null){
	mem.updateUser(User);	
	}else{
	mem.insertUser(User);
	}
	response.sendRedirect("../view/member_page.jsp");
%>

