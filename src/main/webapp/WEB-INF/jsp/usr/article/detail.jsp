<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Detail Page" />
<%@ include file="../common/head.jsp"%>

<table border="1">
	<tr>
		<td>글 번호</td>
		<td>${article.id }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${article.writerName }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${article.regDate }</td>
	</tr>
	<tr>
		<td>수정일</td>
		<td>${article.updateDate }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${article.title }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${article.body }</td>
	</tr>
</table>

<%@ include file="../common/foot.jsp"%>