<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name } 게시판" />

<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="mb-4 flex justify-between">
			<div>
				<span>총: ${articlesCnt } 개</span>
			</div>
			<div>
				<form>
					<input type="hidden" name="boardId" value="${board.id }" />
					<select data-value="${searchKeywordType }" class="select select-primary max-w-xs" name="searchKeywordType">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목 + 내용</option>
					</select>
					&nbsp;
					<input class="input input-bordered input-primary max-w-xs" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요." maxlength="20" value="${searchKeyword }" />
					&nbsp;
					<button class="btn btn-outline">검색</button>
				</form>
			</div>
		</div>
		
		<div class="table-box-type-1">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>추천</th>
						<th>작성일</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr>
							<td>${article.id }</td>
							<td>${article.sumReactionPoint }</td>
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
					<c:if test="${rq.loginedMember.authLevel == 3 }">
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
		<!-- 페이징 -->
		<div class="mt-4 flex justify-center">
			<div class="join">
				<c:set var="pageMenuLen" value="5" />
				<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
				<c:set var="endPage" value="${page + pageMenuLen <= pagesCnt ? page + pageMenuLen : pagesCnt }" />
				
				<c:set var="pageBaseUri" value="?boardId=${board.id }&searchKeywordType=${searchKeywordType }&searchKeyword=${searchKeyword }"/>
				
				<c:if test="${page == 1 }">
					<a class="join-item btn btn-disabled">«</a>
					<a class="join-item btn btn-disabled">&lt;</a>
				</c:if>
				
				<c:if test="${page > 1 }">
					<a class="join-item btn" href="${pageBaseUri }&page=1">«</a>
					<a class="join-item btn" href="${pageBaseUri }&page=${page - 1 }">&lt;</a>
				</c:if>
				
				<c:forEach begin="${startPage }" end="${endPage }" var="i">
					<a class="join-item btn ${page == i ? 'btn-active' : '' }" href="${pageBaseUri }&page=${i }">${i }</a>
				</c:forEach>
				
				<c:if test="${page < pagesCnt }">
					<a class="join-item btn" href="${pageBaseUri }&page=${page + 1 }">&gt;</a>
					<a class="join-item btn" href="${pageBaseUri }&page=${pagesCnt }">»</a>
				</c:if>
				
				<c:if test="${page == pagesCnt }">
				<a class="join-item btn btn-disabled">&gt;</a>
					<a class="join-item btn btn-disabled">»</a>
				</c:if>
			</div>
		</div>
		<!-- end 페이징 -->
	</div>
</section>

<%@ include file="../common/foot.jsp"%>