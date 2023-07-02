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
						<td><input type="text" name="title" value="${article.title }"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="body">${article.body }</textarea></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<input type="submit" value="수정" /> 
							<input type="reset" value="다시입력" />
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div>
			<button class="btn-text-link" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>