<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>RentalProject</title>
        <!-- Favicon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Owl Carousel CSS -->
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link href="${pageContext.request.contextPath }/resources/users/css/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/users/css/slider.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/users/css/main_slider.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/users/css/search_section.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/users/css/review_slider.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/users/css/mp_small_board.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/users/css/style2.css" rel="stylesheet" />
        
    </head>
    <body>
        <!-- Navigation-->
		<%@ include file="/WEB-INF/views/includes/top_nav.jsp" %>
        
        <!-- Main-->
        <div class="sub_main">
        	<!-- hero-area -->
			<div class="sub_ban" style="background-repeat: no-repeat; background-position: center 80%; background-size: cover;"></div>
			
			<!-- 컨텐츠 시작 -->
			<div class="sub_container">
				<div class="board_wrap">
					<h3>고객센터</h3>
					<div class="section_list">
						<ul class="tabs">
							<li class="tab1">
								<a href="/noticeMove?page=1">공지사항</a>
							</li>
							<li class="tab2 on">
								<a href="/boardmove?page=1">후기 게시판</a>
							</li>
						</ul>
						<div class="cs_content">
							<h4>후기 게시판</h4>
							<div class="list_board">
								<div class="board card" style="border: none;">
									<table style="margin-top: 10px; margin-bottom: 10px;">
	
										<thead class="boardTableHead">
											<tr>
												<th class="bo_Bno" style="padding: 15px 30px;">글번호</th>
												<th class="bo_Btitle" style="padding: 15px 30px;">제목</th>
												<th class="bo_Bwriter" style="padding: 15px 30px;">작성자</th>
												<th class="bo_hits" style="padding: 15px 30px;">조회수</th>
											</tr>
										</thead>
	
										<!-- c태그 사용 -->
										<tbody class="boardTableBody">
											<c:forEach var="blist" items="${boardlist }"
												begin="${(param.page-1)*10}" end="${(param.page-1)*10+9}"
												step="1" varStatus="status">
												<tr>
													<td class="bo_Bno" id="${status.count}">
														${status.count+(param.page-1)*10}</td>
													<td class="bo_Btitle" style="padding: 10px 30px; font-size: 25px;"><a
														href="${pageContext.request.contextPath}/boardDetailmove?bno=${blist.bno}">${blist.btitle}</a>
													</td>
													<td class="bo_Bwriter" style="padding: 10px 30px; font-size: 20px;">${blist.bwriter}</td>
													<td class="bo_hits" style="padding: 10px 30px; font-size: 20px;">${blist.bhits}</td>
												</tr>
											</c:forEach>
										</tbody>
	
									</table>
									<!-- c태그 이용 -->
									<div class="pagelist" style="margin: auto;">
										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<c:if test="${nowPageList > 1}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/boardmove?page=${(nowPageList-2)*10+1}"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													</a></li>
												</c:if>
												<c:forEach var="pageCount" begin="${(nowPageList-1)*10+1 }"
													end="${boardListCount }" step="1">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/boardmove?page=${pageCount}">${pageCount
																}</a></li>
												</c:forEach>
												<c:if test="${nowPageList*10 < boardListCount}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/boardmove?page=${nowPageList*10+1}"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
								<c:choose>
									<c:when test="${sessionScope.loginBId != null }">
										<div class="boardWriteBtn">
											<a href="${pageContext.request.contextPath}/boardWriteMove"
												class="writeBtn btn btn-success">글 작성</a>
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		<!-- 컨텐츠 끝 -->
		</div>
		
        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                        <ul class="list-inline mb-2">
                            <li class="list-inline-item"><a href="#!">About</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Contact</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2023. All Rights Reserved.</p>
                    </div>
                    <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item me-4">
                                <a href="#!"><i class="bi-facebook fs-3"></i></a>
                            </li>
                            <li class="list-inline-item me-4">
                                <a href="#!"><i class="bi-twitter fs-3"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!"><i class="bi-instagram fs-3"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!-- Owl Carousel JS -->
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath }/resources/users/js/slider.js"></script>
        <script src="${pageContext.request.contextPath }/resources/users/js/search_section_date.js"></script>
        <script src="${pageContext.request.contextPath }/resources/users/js/review_slider.js"></script>
    </body>
</html>
