<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp"%>

<div class="container mx-auto">
	<form action="doLogin" method="post">
		<table style="margin: auto;" border="1">
			<tr>
				<td>아이디</td>
				<td><input class="input input-bordered input-primary w-full max-w-xs" type="text" name="loginId" placeholder="ID" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="input input-bordered input-primary w-full max-w-xs" type="password" name="loginPw"
					placeholder="Password" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input class="btn btn-outline btn-sm" type="submit" value="로그인" /> 
					<input class="btn btn-outline btn-sm" type="reset" value="다시입력" />
				</td>
			</tr>
		</table>
	</form>
	<br>
	<button class="btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
</div>

<%@ include file="../common/foot.jsp"%>