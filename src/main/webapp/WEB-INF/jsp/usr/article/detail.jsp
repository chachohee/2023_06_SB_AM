<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Detail" />

<%@ include file="../common/head.jsp"%>

<script>
	function getReactionPoint(){
		
		$.get('../reactionPoint/getReactionPoint', {
			relTypeCode : 'article',
			relId : ${article.id }
		}, function(data){
		
		console.log(data);
		console.log(data.data1.sumReactionPoint);
			
			if (data.data1.sumReactionPoint > 0){
				let goodBtn = $('#goodBtn');
				goodBtn.removeClass('btn-outline');
				goodBtn.attr('href', '../reactionPoint/doDeleteReactionPoint?relTypeCode=article&relId=${article.id }&point=1');
			} else if (data.data1.sumReactionPoint < 0){
				let badBtn = $('#badBtn');
				badBtn.removeClass('btn-outline');
				badBtn.prop('href', '../reactionPoint/doDeleteReactionPoint?relTypeCode=article&relId=${article.id }&point=-1')
			}
			
		}, 'json')
	}
	getReactionPoint();
</script>

<section class="mt-8">
	<div class="container mx-auto pb-4 border-bottom-line">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				<tr>
					<th>글 번호</th>
					<td colspan="2">${article.id }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td colspan="2"><span id="articleDetail_increaseHitCnt">${article.hitCnt }</span></td>
				</tr>
				<tr>
					<th>추천</th>
					<td><c:if test="${rq.getLoginedMemberId() != 0 }">
							<a id="goodBtn" class="btn btn-outline btn-error"
								href="../reactionPoint/doInsertReactionPoint?relTypeCode=article&relId=${article.id }&point=1">👍</a>
						</c:if> <span class="ml-3">좋아요: ${article.goodReactionPoint }</span></td>
					<td><c:if test="${rq.getLoginedMemberId() != 0 }">
							<a id="badBtn" class="btn btn-outline btn-error"
								href="../reactionPoint/doInsertReactionPoint?relTypeCode=article&relId=${article.id }&point=-1">👎</a>
						</c:if> <span class="ml-3">싫어요: ${article.badReactionPoint }</span></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td colspan="2">${article.writerName }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td colspan="2">${article.regDate }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td colspan="2">${article.updateDate }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="2">${article.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2">${article.getForPrintBody()}</td>
				</tr>
			</table>
		</div>
		<div class="mt-4">
			<a class="btn btn-outline btn-sm"
				href="list?boardId=${article.boardId }">목록</a>
			<c:if test="${loginedMemberId == article.memberId }">
				<a class="btn btn-outline btn-sm" href="modify?id=${article.id }">수정</a>
				<a class="btn btn-outline btn-sm" href="doDelete?id=${article.id }"
					onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
			</c:if>
		</div>
	</div>
</section>
<section class="my-8">
	<div class="container mx-auto px-3">
		<h1>댓글</h1>
		<c:if test="${rq.loginedMemberId != 0 }">
			<form action="../reply/doWrite" method="post">
				<input type="hidden" name="relTypeCode" value="article" /> <input
					type="hidden" name="relId" value="${article.id }" />
				<div class="mt-4 border border-white-400 rounded-lg p-4">
					<div class="mb-2">
						<span>${rq.loginedMember.nickname }</span>
					</div>
					<textarea class="textarea textarea-bordered w-full" name="body"
						placeholder="댓글을 남겨보세요."></textarea>
					<div class="mt-2 flex justify-end">
						<button class="btn btn-outline btn-sm">등록</button>
					</div>
				</div>
			</form>
		</c:if>
		<c:forEach var="reply" items="${replies }">
			<div class="my-4 py-2 pl-16 border-bottom-line">
				<div class="text-sm">
					<span>${reply.writerName }</span>
				</div>
				<div class="pl-4">
					<span>${reply.getForPrintBody() }</span>
				</div>
				<div class="text-xs text-gray-400">
					<span>${reply.regDate }</span>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>