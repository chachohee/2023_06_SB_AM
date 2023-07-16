<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Write" />

<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doWrite" method="post">
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tr>
						<th>게시판</th>
						<td>
							<c:if test="${rq.loginedMember.authLevel == 3 }">
								<label>
									<input type="radio" name="boardId" value="1" />
									&nbsp;공지사항
								</label>
							</c:if>
							&nbsp;&nbsp;&nbsp;
							<label>
								<input type="radio" name="boardId" value="2" checked/>
								&nbsp;자유
							</label>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${member.nickname }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input class="input input-bordered input-primary w-full" type="text" name="title" placeholder="제목을 입력해주세요."/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="textarea textarea-primary w-full" name="body" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<input class="btn btn-outline" type="submit" value="등록" /> 
							<input class="btn btn-outline" type="reset" value="다시입력" />
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div class="mt-4">
			<button class="btn btn-outline" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>