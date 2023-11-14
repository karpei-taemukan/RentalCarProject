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
        <link href="${pageContext.request.contextPath }/resources/users/css/myStyle.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/5db7097b9a.js" crossorigin="anonymous"></script>
        
        <style>
			#carImg {
				width: 100%;
				border: solid 1px black;
				border-radius: 5px;
				height: auto;
			}
			
			label {
				width: 100px;
			}
			
			.optionTitle {
				text-align: left;
			}
			
			.optionArea {
				padding-left: 17px;
				width: 65%;
				margin: auto;
				text-align: left;
			}
			
			i {
				background: "green";
				z-index: 1;
			}
			
			.rent-search .input-box  {
				width: 50%;
			    margin: 0 10px;
				position: relative;
			    padding: 15px 15px;
			    -webkit-border-radius: 40px;
			    -moz-border-radius: 40px;
			    border-radius: 10px;
			    border: 1px solid #6F96E9;
			    background: #fff;
			    vertical-align: top;
			}
			
			.rent-search .input-box .calander {
				position: absolute;
			    top: 13px;
			   	left: 230px;
			    cursor: pointer;
			    display: flex;
			    width: 27px;
			    height: 27px;
			    background: #fff url(/resources/users/images/calendar_month.png) no-repeat 89% 45%;
			    justify-content: flex-end;
			}
		</style>
        
    </head>
    <body>
        <!-- Navigation-->
		<%@ include file="/WEB-INF/views/includes/top_nav.jsp" %>
        
        <!-- Main-->
        <div class="sub_main">
        	<!-- hero-area -->
			<div class="sub_ban" style="background-repeat: no-repeat; background-position: center 80%; background-size: cover;"></div>
			
			<!-- 컨텐츠 시작 -->
				<div class="pt-4">
					<div class="container" style="width: 660px; border: 3px solid black; padding: 0 !important; border-radius: 40px;">
						<div class="p-4 p-lg-5 bg-light rounded-3 text-center" style="border-radius: 40px !important;">
							<div class="m-4 m-lg-5">
			
								<!--  배너 -->
								<h1 class="display-5 fw-bold">차량등록</h1>
								<p class="fs-4">정보를 알맞게 입력해주세요</p>
							</div>
						</div>
					</div>
				</div>
				<section class="pt-4">
					<div class="container" style="width: 660px;">
						<!-- Page Features-->
						<div class="row gx-lg-5">
							<div class="col-lg-12 col-xxl-12 mb-5">
								<div class="card bg-light border-0 h-100 loginDiv">
									<form action="${pageContext.request.contextPath }/carUpdate"
										method="post" onsubmit="return formCheck(this);"
										enctype="multipart/form-data">
										<div class="card-body text-center p-4  loginDiv">
											<!-- 내용 사입 div -->
			
											<div class="loginDivs mb-2" style="border-radius: 10px">
												<i class="fa-solid fa-car fontlogin"></i> <input type="text"
													name="cname" placeholder="차량이름" class="inputInfo m-2">
											</div>
			
											<div class="loginDivs mb-2" style="border-radius: 10px;">
												<i class="fa-regular fa-calendar-days fontlogin "></i> <select
													id="hello" class="inputInfo m-2" name="cyear">
													<option value="" style="text-align: center;">--- 연식을
														선택해주세요 ---</option>
													<c:forEach var="i" begin="1980" end="2024">
														<option value="${i}">${i}</option>
													</c:forEach>
												</select>
											</div>
			
											<div class="loginDivs mb-2" style="border-radius: 10px;">
												<i class="fa-solid fa-gas-pump fontlogin"></i> <select
													class="inputInfo m-2" name="ctype">
													<option value="" style="text-align: center;">--- 차종을
														선택해주세요 ---</option>
			        								<option value="경차">경차</option>
			        								<option value="중소형">중소형</option>
			        								<option value="중형">중형</option>
			        								<option value="고급">고급</option>
			        								<option value="SUV">SUV</option>
			        								<option value="승합">승합</option>
			        								<option value="수입">수입</option>
			        								<option value="전기">전기</option>
												</select>
			
											</div>
			
											<div class="loginDivs mb-2" style="border-radius: 10px;">
												<i class="fa-solid fa-calendar-days fontlogin"></i> <select
													class="inputInfo m-2" name="cdcareer">
													<option value="" style="text-align: center;">--- 운전경력
														제한 선택해주세요 ---</option>
													<c:forEach var="i" begin="1" end="9">
														<option value="${i}">${i}년</option>
													</c:forEach>
												</select>
											</div>
			
											<div class="loginDivs mb-2" style="border-radius: 10px;">
												<i class="fa-solid fa-id-card fontlogin"></i> <select
													class="inputInfo m-2" name="cdlicense">
													<option value="" style="text-align: center;">--- 면허
														종류를 선택해주세요 ---</option>
													<option value="1종">1종</option>
													<option value="2종">2종</option>
												</select>
											</div>
			
											<div class="loginDivs mb-2" style="border-radius: 10px;">
												<i class="fa-solid fa-ban fontlogin"></i> <select id="hello"
													class="inputInfo m-2" name="cdage">
													<option value="" style="text-align: center;">- 운전자
														나이제한을 선택해주세요 ex)24세 미만 안됨 -</option>
													<c:forEach var="i" begin="20" end="30">
														<option value="${i}">만${i}세</option>
													</c:forEach>
												</select>
											</div>
			
											<div class="loginDivs mb-2"
												style="border-radius: 10px; display: block;">
			
												<div class="optionTitle">
													<i class="fa-solid fa-gear fontlogin"></i> <span>옵션 선택</span>
												</div>
			
												<div class="optionArea">
													<div class="optionAreaRow">
														<label><input type="checkbox" name="cdblackbox" value="블랙박스">블랙박스</label> 
														<label><input type="checkbox" name="cdnavigation" value="네비게이션">네비게이션</label>
														<label><input type="checkbox" name="cdrearcam" value="후방카메라">후방카메라</label>
														
													</div>
													<div class="optionAreaRow">
														<label><input type="checkbox" name="cdbluetooth" value="블루투스">블루투스</label> 
														<label><input type="checkbox" name="cdhotseat" value="통풍시트">통풍시트</label>
														<label><input type="checkbox" name="cdnosmoke" value="금연">금연</label>
													</div>
			
													<div class="optionArea">
														<input type="checkbox" class="optionSelect" name="cdcartype"
															value="수동" onchange="checkboxGroup(this)">수동 <input
															type="checkbox" class="optionSelect" name="cdcartype"
															value="자동" onchange="checkboxGroup(this)" checked="checked">자동
													</div>
												</div>
											</div>
			
											<div class="rent-search loginDivs"
												style="display: flex; margin: 10px 0; padding: 5px;">
												<div style="margin: auto;">대여기간</div>
												<div class="input-box">
													<i class="calander" id="open_Calander"> <img
														src="${pageContext.request.contextPath }/resources/users/images/calendar_month.png">
													</i> <input type="text" name="scdate" id="senddate"
														class="real-input" placeholder="날짜 선택" style="display: none">
													<input type="text" id="showdate" class="fake-input"
														placeholder="날짜를 고르시오" readonly>
												</div>
			
												<input type="number" name="dayPrice" placeholder="1일당 랜트 가격"
													min="30000" class="loginDivs"
													style="width: 30%; text-align: center;" />
											</div>
											
											<div>
												<img
													src="https://img.freepik.com/premium-vector/car-icon-vehicle-icon-car-vector-icon_564974-1452.jpg?w=826"
													id="carImg"> <label className="inputFileCustom"
													for="inputFile" id="carUploadBtn"> 업로드 </label> <input
													type="file" name="cfile" id="inputFile" style="display: none"
													onchange="readURL(this);"
													accept="image/gif, image/jpg, image/jpeg, image/png" />
											</div>
			
											<input type="submit" value="등록 완료"
												class="btn_login mt-2 btn--blue">
											<div class="text-end pt-2"></div>
											
										</div>
									</form>
								</div>
							</div>
			
						</div>
					</div>
				</section>
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
    <script>
    // 사진 미리보기 등록
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('carImg').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('carImg').src = "";
        }
    }
    </script>
    <script>
	let msg = '${msg}';
	if (msg.length > 0) {
		alert(msg);
	}
    </script>
</html>
