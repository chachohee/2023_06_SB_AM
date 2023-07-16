<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Password Check" />
<%@ include file="../common/head.jsp"%>

<div class="container mx-auto">
	<form action="doPasswordModify" method="post">
		<table style="margin: auto;" border="1">
			<tr>
				<th>새 비밀번호</th>
				<td><input class="input input-bordered input-primary w-full max-w-xs" type="password" name="loginPw"
					placeholder="New Password" /></td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td><input class="input input-bordered input-primary w-full max-w-xs" type="password" name="loginPwChk"
					placeholder="New Password Check" /></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>
					<input class="btn btn-outline" type="submit" value="비밀번호 변경" /> 
				</td>
			</tr>
		</table>
	</form>
	<br>
	<div class="mt-4">
		<button class="btn btn-outline" onclick="history.back();">뒤로가기</button>
	</div>
</div>

<%@ include file="../common/foot.jsp"%>