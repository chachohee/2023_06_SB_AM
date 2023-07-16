<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Modify" />

<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doModify" method="post">
			<input type="hidden" name="id" value=${rq.loginedMember.id } />
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tr>
						<th>가입일</th>
						<td>${rq.loginedMember.regDate }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${rq.loginedMember.id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${rq.loginedMember.name }</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" type="text" name="nickname" placeholder="닉네임을 입력해주세요" value="${rq.loginedMember.nickname }" /></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" type="text" name="cellphoneNum" placeholder="전화번호를 입력해주세요" value="${rq.loginedMember.cellphoneNum }" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" type="text" name="email" placeholder="이메일을 입력해주세요" value="${rq.loginedMember.email }" /></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<a class="btn btn-outline" href="passwordModify">비밀번호 변경</a>
							<input class="btn btn-outline" type="submit" value="수정" /> 
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