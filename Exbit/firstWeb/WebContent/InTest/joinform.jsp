<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<form id="USERJOIN" action="memberReg.jsp" method="post">
		<table>
			<tr>
				<td><label for="USERID">아이디</label></td>
				<td><input type="text" class="input_login" id="USERID" name="USERID"></td>
			</tr>
			<tr>
				<td><label for="USERPW">비밀번호</label></td>
				<td><input type="password" class="input_login" id="USERPW" name="USERPW"></td>
			</tr>
			<tr>
				<td><label for="USERNAME">이름</label></td>
				<td><input type="text" class="input_login" id="USERNAME" name="USERNAME"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" id="USERFILE" name="USERFILE"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" 
				 class="btn" id="USERSUB" name="USERSUB" value="회원가입"></td>
			</tr>
		</table>
	</form>
</div>
