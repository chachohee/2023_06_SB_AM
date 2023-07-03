<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Modify" />

<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doModify" method="post">
			<input type="hidden" name="id" value=${article.id } />
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
						<td><input class="input input-bordered input-primary w-full max-w-xs" type="text" name="title" value="${article.title }"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="textarea textarea-primary" name="body">${article.body }</textarea></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<input class="btn btn-outline" type="submit" value="수정" /> 
							<input class="btn btn-outline" type="reset" value="다시입력" />
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div>
			<button class="btn btn-outline" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>