<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/InTest.css" type="text/css">
</head>
<body>
	<div id="test_container">
		<div id="test_header">
			<jsp:include page="../piece/header.jsp"></jsp:include>
			<div id="test_navi">
				<jsp:include page="../piece/navi.jsp"></jsp:include>
			</div>
		</div>
		<div id="test_wrap">
			<div id="test_box1">
				<div id="test_con1">
					<jsp:include page="../form/modifyform.jsp"></jsp:include>
				</div>
			</div>
			<div id="test_box2">
				<div id="test_con2">
					<jsp:include page="../piece/con2.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div id="test_footer">
			<jsp:include page="../piece/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>