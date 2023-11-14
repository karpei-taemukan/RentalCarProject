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
        <link href="${pageContext.request.contextPath }/resources/users/css/reigisterandlogin.css" rel="stylesheet" />
        
        <script src="https://kit.fontawesome.com/5db7097b9a.js" crossorigin="anonymous"></script>
        
        <style>
		#myinfoImage {
			width: 110px;
			height: 110px;
			margin-left: 10px;
			border: solid 1px black;
			border-radius: 5px;
		}
		
		.loginInfo {
			display: flex;
			border-radius: 10px;
			border: solid 1px;
			border: solid #dadada 1px;
		}
		
		.loginInfoValue {
			display: flex;
			align-items: center;
			width: 100%;
			outline: 0;
			border: none;
			background-color: transparent;
		}
		
		.reservceDate_Div {
			border: solid 1px black;
			border-radius: 10px;
	   		margin: 0px 0px 10px;	
	   		height: 70px;
		}
		
		.reservceDate_Div div .btn {
			border: 1px solid black; 
			margin-top: 12px; 
			padding: 8px 15px;
		}
		
		.reservceDate_Div div .btn:hover {
			color: white;
   			background: rgb(59, 201, 219);
   			border: 1px solid rgb(59, 201, 219);
		}

		.reserve_img {
			margin: 10px 0;
		}
		</style>
        
    </head>
    <body>
        <!-- Navigation-->
		<%@ include file="/WEB-INF/views/includes/top_nav.jsp" %>
        
        <!-- Main-->
        <div class="main">
        	<!-- hero-area -->
			<div class="sub_ban" style="background-repeat: no-repeat; background-position: center 80%; background-size: cover;"></div>
		</div>
		
		<!-- 컨텐츠 시작 -->
		<div class="py-5" style="padding-bottom: 0 !important;">
			<div class="container px-lg-5" style="width: 564px; border: 3px solid black; padding: 0 !important; border-radius: 40px;">
				<div class="p-4 p-lg-5 bg-light rounded-3 text-center" style="border-radius: 40px !important;">
					<div class="m-4 m-lg-5">
	
						<!--  배너 -->
						<h1 class="display-5 fw-bold">나의 정보</h1>
						<p class="fs-4">${loginbuyer.mbid }님의 정보 입니다.</p>
					</div>
				</div>
			</div>
		</div>
		<section class="pt-4">
		<div class="container px-lg-5" style="width: 660px;">
			<!-- Page Features-->
			<div class="row gx-lg-5">
				<div class="col-lg-12 col-xxl-12 mb-5">
					<div class="card bg-light border-0 h-100 loginDiv">
						<div class="card-body text-center p-4  loginDiv">
							<!-- 내용 사입 div -->
							<div style="display: flex;">
								<div style="width: 76%">
									<div class="loginInfo mb-2">
										<i class="fa-regular fa-user fontlogin"></i>
										<div class="loginInfoValue m-2">
											<c:if test="${sessionScope.loginBId != null}">
												<span>${loginbuyer.mbid }</span>
											</c:if>
											<c:if test="${sessionScope.loginSId != null}">
												<span>${loginseller.msid }</span>
											</c:if>
										</div>
									</div>

									<div class="loginInfo mb-2">
										<i class="fa-solid fa-address-card fontlogin"></i>
										<div class="loginInfoValue m-2">
											<c:if test="${sessionScope.loginBId != null}">
												<span>${loginbuyer.mbname }</span>
											</c:if>
											<c:if test="${sessionScope.loginSId != null}">
												<span>${loginseller.msname }</span>
											</c:if>
										</div>
									</div>
								</div>


								<div style="width: 105px">
									<c:choose>
										<c:when
											test="${loginbuyer.mbprofile == null && loginseller.msprofile == null}">
											<img alt=""
												src="https://heurm-tutorial.vlpt.us/images/default_thumbnail.png"
												id="myinfoImage">
										</c:when>

										<c:when
											test="${sessionScope.loginBId != null && sessionScope.loginState != 'KA'}">
											<img alt=""
												src="${pageContext.request.contextPath }/resources/users/mbProfile/${loginbuyer.mbprofile }"
												id="myinfoImage">
										</c:when>
										<c:when
											test="${sessionScope.loginBId != null && sessionScope.loginState == 'KA'}">
											<img alt="" src="${sessionScope.loginProfile}"
												id="myinfoImage">
										</c:when>
										<c:when
											test="${sessionScope.loginSId != null && sessionScope.loginState != 'KA'}">
											<img alt=""
												src="${pageContext.request.contextPath }/resources/users/msProfile/${loginseller.msprofile }"
												id="myinfoImage">
										</c:when>
										<c:when
											test="${sessionScope.loginSId != null && sessionScope.loginState == 'KA'}">
											<img alt="" src="${sessionScope.loginProfile}"
												id="myinfoImage">
										</c:when>
									</c:choose>
								</div>
							</div>

							<div class="loginInfo mb-2">
								<i class="fa-regular fa-envelope fontlogin"></i>
								<div class="loginInfoValue m-2">
									<c:if test="${sessionScope.loginBId != null}">
										<span>${loginbuyer.mbemail }</span>
									</c:if>
									<c:if test="${sessionScope.loginSId != null}">
										<span>${loginseller.msemail }</span>
									</c:if>
								</div>
							</div>
							
							<div class="mb-2">
								<div class="m-2">
									<h2 style="margin-bottom: 0px">예약 정보</h2>

									<c:set value="" var="checkCccode" />
									<c:forEach var="reInfo" items="${reserveInfo}">
										<c:if test="${sessionScope.loginBId == reInfo.mbid }">
										<div class="reservceDate_Div row">
											<div class="col-3 reserve_img">
												<img class="w-100"
													src="${pageContext.request.contextPath }/resources/users/Carimage/${reInfo.carImg}">
											</div>
											<div class="col-6" style="margin-top: 20px;">${reInfo.reservedate }</div>
											<div class="col-3">
												<a class='btn'
													href="${pageContext.request.contextPath }/delete_reserve?ccode=${reInfo.ccode}">예약취소</a>
											</div>
										</div>
										</c:if>	



									</c:forEach>

								</div>
							</div>


							<div class="text-end pt-2"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
		</section>
		<!-- 컨텐츠 끝 -->
		
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
        <script type="text/javascript">
	        $(window).scroll(function() {
	            var position = $(window).scrollTop();
	            if(position >= 100) {
	                $('.header').addClass('coloring');
	            } else {
	                $('.header').removeClass('coloring');
	                
	            } 
	        });
        </script>
        <script src="${pageContext.request.contextPath }/resources/users/js/slider.js"></script>
        <script src="${pageContext.request.contextPath }/resources/users/js/search_section_date.js"></script>
        <script type="text/javascript">
        	function data_check(data){
        		console.log(data);
        	}
        </script>
        <script src="${pageContext.request.contextPath }/resources/users/js/review_slider.js"></script>
    </body>
</html>
