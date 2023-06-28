<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp"%>

<form action="login" method="post">
	<div class="container mx-auto">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="loginId" placeholder="ID" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="loginPw" placeholder="Password" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" value="로그인" /> 
					<input type="reset"value="재입력" />
				</td>
			</tr>
	</table>
	</div>
</form>
