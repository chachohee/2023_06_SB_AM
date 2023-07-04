<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name } 게시판" />

<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="mb-4">
			<span>총: ${articlesCnt } 개</span>
		</div>
		<div class="table-box-type-1">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr>
							<td>${article.id }</td>
							<td>${article.regDate.substring(2, 16) }</td>
							<td><a class="hover:underline"
								href="detail?id=${article.id }">${article.title }</a></td>
							<td>${article.writerName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<c:if test="${rq.getLoginedMemberId() != 0 }">
			<c:choose>
				<c:when test="${board.id == 1 }">
					<c:if test="${rq.getAuthLevel() == 3 }">
						<div class="mt-4 flex justify-end">
							<a class="btn btn-outline" href="write">글쓰기</a>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<div class="mt-4 flex justify-end">
						<a class="btn btn-outline" href="write">글쓰기</a>
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>