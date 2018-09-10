<%@page import="user.Logininfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script>
	$(document).ready(function(){
		$('#logout2').click(function(){
			location.href="logout.jsp";
		});

        if(getCookie('crememId')!=""){
            $('#rememId').prop('checked',true);
            $('#USERID').val(getCookie('crememId'));
        }
        
        $('#USERSUB').click(function(){
            
            if($('#rememId').prop('checked')){
                setCookie("crememId",$('#USERID').val(),"1");
            }else{
                setCookie("crememId","","0");
            }
            $('#USERJOIN')[0].submit();
            
        });
	});
    
    function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }
    
    function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
    }
    
    function submit(){
        
    }
</script>
<%
request.setCharacterEncoding("utf-8");
Logininfo lo = (Logininfo)request.getSession(false).getAttribute("loginfo");
if(lo!=null&&lo.getUSERID()!=null){
	System.out.println(lo.toString());
%>
${loginfo.USERID}<br>
${loginfo.USERNAME} 님 환영합니다! <br>
	<a href="#" role="button" class="btn" id="logout2">로그아웃</a>
<%
	} else {
%>

<div>
	<form id="USERJOIN" action="Login.jsp" method="post">
		<table>
			<tr>
				<td><label for="USERID">아이디</label></td>
				<td><input type="text" class="input_login" id="USERID"
					name="USERID"></td>
			</tr>
			<tr>
				<td><label for="USERPW">비밀번호</label></td>
				<td><input type="password" class="input_login" id="USERPW"
					name="USERPW"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="checkbox" id="rememId" name="rememId" value="on">
					<label for="rememId">아이디저장</label>
					<input type="checkbox" id="keepLogin" name="keepLogin" value="on">
					<label for="keepLogin">로그인유지</label>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="button" class="btn" id="USERSUB" name="USERSUB" value="로그인"></td>
			</tr>
		</table>
	</form>
</div>
<%
	}
%>
