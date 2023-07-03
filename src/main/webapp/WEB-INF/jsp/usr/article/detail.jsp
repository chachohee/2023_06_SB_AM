<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Detail" />

<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				<tr>
					<th>글 번호</th>
					<td>${article.id }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.writerName }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${article.regDate }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${article.updateDate }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${article.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.body }</td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<button class="btn btn-outline" onclick="history.back();">뒤로가기</button>
			<c:if test="${loginedMemberId == article.memberId }">
				<a class="btn btn-outline" href="modify?id=${article.id }">수정</a>
				<a class="btn btn-outline" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>