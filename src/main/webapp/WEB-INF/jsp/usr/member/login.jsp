<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp"%>

<form>
	<div>
		아이디: <input type="text" name="loginId" placeholder="ID" />
	</div>
	<div>
		비밀번호: <input type="password" name="loginPw" placeholder="Password" />
	</div>
	<button>로그인</button>
	<input type="reset" value="재입력" />
</form>
