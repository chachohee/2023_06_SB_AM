<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html data-theme="synthwave">
<head>
<meta charset="UTF-8">
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@3.1.7/dist/full.css"
	rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<title>${pageTitle }</title>
</head>
<body>
	<div class="h-20 flex container mx-auto text-4xl">
		<a class="px-3 flex items-center" href="/"><span>로고</span></a>
		<div class="flex-grow"></div>
		<div class="flex dropdown dropdown-end">
			<label class="swap swap-flip text-4xl"> <!-- this hidden checkbox controls the state -->
				<input type="checkbox" />
				<div class="swap-on">★</div>
				<div class="swap-off">☆</div>
			</label>
			<ul tabindex="0"
				class="flex mt-3 z-[1] p-2 shadow menu menu-sm dropdown-content bg-base-100 rounded-box w-52">
				<li class="hover:underline"><a
					class="h-full px-3 flex items-center" href="/">HOME</a></li>
				<li class="hover:underline"><a
					class="h-full px-3 flex items-center"
					href="/usr/article/list?boardId=1">NOTICE</a></li>
				<li class="hover:underline"><a
					class="h-full px-3 flex items-center"
					href="/usr/article/list?boardId=2">FREE</a></li>
				<c:choose>
					<c:when test="${rq.getLoginedMemberId() == 0}">
						<li class="hover:underline"><a
							class="h-full px-3 flex items-center" href="/usr/member/login">LOGIN</a></li>
					</c:when>
					<c:when test="${rq.getLoginedMemberId() != 0 }">
						<li class="hover:underline"><a
							class="h-full px-3 flex items-center"
							href="/usr/member/doLogout?id=${rq.getLoginedMemberId() }">LOGOUT</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
			<h1>${pageTitle }</h1>
		</div>
	</section>