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
						<td>작성자</td>
						<td>${member.nickname }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input class="input input-bordered input-primary w-full max-w-xs" type="text" name="title" placeholder="제목을 입력해주세요."/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="textarea textarea-primary" name="body" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<input class="btn btn-outline" type="submit" value="글 작성" /> 
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