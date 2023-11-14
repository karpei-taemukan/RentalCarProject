<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Prompt:ital,wght@1,500&display=swap');
</style>
</head>
<body>
	<nav class="header">
		<div class="menu">
			<h1>
				<a class="navbar-brand" href="/" style="font-family: 'Prompt', sans-serif;">RENT<font>Car</font> </a>
			</h1>
			<nav class="main_nav">
				<ul>
					<c:choose>
						<c:when
							test="${sessionScope.loginBId != null || sessionScope.loginSId != null }">

							<c:if test="${sessionScope.loginBId != null}">
								<ul class="addtional_itemList">
									<li><a id="item" href="${pageContext.request.contextPath }/carRentListMove_All">차량검색</a></li>
									<li><a id="item" href="${pageContext.request.contextPath}/noticeMove?page=1">공지사항</a></li>
									<li><a id="item" href="${pageContext.request.contextPath}/boardmove?page=1">게시판</a></li>
								</ul>
								<li>
									<c:choose>
										<c:when test="${sessionScope.loginState == 'KA'}">
											<a id="sign" href="${pageContext.request.contextPath}/memberInfo?loginInfo=${sessionScope.loginBId}">${sessionScope.loginName}</a>
										</c:when>
										<c:otherwise>
											<a id="sign" href="${pageContext.request.contextPath}/memberInfo?loginInfo=${sessionScope.loginBId}">${sessionScope.loginBId}</a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:if>

							<c:if test="${sessionScope.loginSId != null}">
								<ul class="addtional_itemList">
									<li><a id="item" href="${pageContext.request.contextPath }/registCar">차량등록</a></li>
									<li><a id="item" href="${pageContext.request.contextPath}/noticeMove?page=1">공지사항</a></li>
									<li><a id="item" href="${pageContext.request.contextPath}/boardmove?page=1">게시판</a></li>
								</ul>
								<li><a id="sign" href="${pageContext.request.contextPath}/memberInfo?loginInfo=${sessionScope.loginSId}">${sessionScope.loginSId}</a></li>
							</c:if>
							<li><a id="sign" href="${pageContext.request.contextPath}/betaTest">BETA</a></li>
							<li><a id="sign" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a id="sign" href="${pageContext.request.contextPath}/betaTest">BETA</a></li>
							<li><a id="sign" href="${pageContext.request.contextPath}/loginForm">로그인</a></li>
							<li><a id="sign" href="${pageContext.request.contextPath}/memberJoinForm">회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</nav>
</body>
</html>