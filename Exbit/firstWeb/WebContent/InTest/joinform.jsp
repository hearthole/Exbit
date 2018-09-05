<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div>
		<form id="USERJOIN">
			<table>
				<tr>
					<td><label for="USERID">아이디</label></td>
					<td><input type="text" class="input_login" id="USERID"></td>
				</tr>
				<tr>
					<td><label for="USERPW">비밀번호</label></td>
					<td><input type="password" class="input_login" id="USERPW"></td>
				</tr>
				<tr>
					<td><label for="USERNAME">이름</label></td>
					<td><input type="text" class="input_login" id="USERNAME"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="file" id="USERFILE"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><a role="button" href="#" class="btn" id="USERSUB">가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>