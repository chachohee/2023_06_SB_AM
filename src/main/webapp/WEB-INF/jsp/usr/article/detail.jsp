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
		</div>
		<div>
			<button class="btn-text-link" onclick="history.back();">뒤로가기</button>
			<c:if test="${loginedMemberId == article.memberId }">
				<a class="btn-text-link" href="modify?id=${article.id }">수정</a>
				<a class="btn-text-link" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>