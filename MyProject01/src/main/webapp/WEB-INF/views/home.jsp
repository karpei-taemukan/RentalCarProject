<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        
    </head>
    <body>
        <!-- Navigation-->
		<%@ include file="/WEB-INF/views/includes/top_nav.jsp" %>
        
        <!-- Main-->
        <div class="main">
        	<!-- hero-area -->
        	<div class="hero-area">
				<div id="slider">
				  <a href="#" class="control_next">>></a>
				  <a href="#" class="control_prev"><</a>
				  <ul>
				    <li> <img src="${pageContext.request.contextPath }/resources/users/images/banner1.jpg"> </li>
				    <li style="background: #aaa;"> <img src="${pageContext.request.contextPath }/resources/users/images/banner2.jpg"> </li>
				    <li> <img src="${pageContext.request.contextPath }/resources/users/images/banner3.jpg"> </li>
				    <li style="background: #aaa;"> <img src="${pageContext.request.contextPath }/resources/users/images/banner4.jpg"> </li>
				  </ul>  
				</div>
	        </div>
	        <section class="search_car">
	        	<div class="rent-base">
	        		<form action="/carRentListMove" method="post">
	        			<div class="rent-search">
	        				<dl>
	        					<dt>대여기간</dt>
	        					<dd>
	        						<div class="input-box">
	        							<i class="calander" id="open_Calander"></i>
		        						<input type="text" name="realDate" id="senddate" class="real-input" placeholder="날짜 선택" style="display: none">
		        						<input type="text" name="fakeDate" id="showdate" class="fake-input" placeholder="날짜를 입력해 주세요" readonly>
	        						</div>
	        					</dd>
	        				</dl>
	        				<dl>
	        					<dt>차종</dt>
	        					<dd>
	        						<div class="select-box">
	        							<select name="ctype"  class="CarType">
	        								<option value="NONE">없음</option>
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
	        					</dd>
	        				</dl>
	        				<dl class="carOption-selection">
	        					<dt>옵션</dt>
	        					<dd>
									<input name="cdnosmoke" type="checkbox" class="rc_types" id="check0" value="금연">
									<label for="check0">금연</label> 
									<input name="cdnavigation" type="checkbox" class="rc_types" id="check1" value="네비게이션">
									<label for="check1">네비게이션</label> 
									<input name="cdblackbox" type="checkbox" class="rc_types" id="check2" value="블랙박스">
									<label for="check2">블랙박스</label>
									<input name="cdrearcam" type="checkbox" class="rc_types" id="check4" value="후방카메라">
									<label for="check4">후방카메라</label> 
									<input name="cdbluetooth" type="checkbox" class="rc_types" id="check6" value="블루투스">
									<label for="check6">블루투스</label> 
									<input name="cdcoldseat" type="checkbox" class="rc_types" id="check7" value="통풍시트">
									<label for="check7">통풍시트</label> 								
								</dd>
	        				</dl>
	        				<button onclick="function getDate()" type="submit" id="btn_prd_search" class="btn-submit">차량검색</button>
	        			</div>
	        		</form>
	        	</div>
	        </section>
        
	        <!-- Icons Grid-->
	        <div class="current_state">
				<ul>
					<li>
						<p class="current-title">판매자</p>
						<p class="quantity">66</p>
					</li>
					<li>
						<p class="current-title">보유 차량</p>
						<p class="quantity">13,052</p>
					</li>
					<li>
						<p class="current-title">보유 차종</p>
						<p class="quantity">437</p>
					</li>
				</ul>
			</div>
	        <!-- Image Showcases-->
	        <section class="review-section">
			  <h2 class="line-title">후기 <a class="more" href="/boardmove?page=1"><i class="fas fa-plus"></i></a></h2>
			  <div class="owl-carousel custom-carousel owl-theme">
			  	<!-- 반복 테스트 -->
				<c:forEach var="homeList" items="${homeList}" begin="0" end="7" step="1">
					<div class="item"
						style="background-image: url('${pageContext.request.contextPath}/resources/users/Carimage/${homeList.carimg}');">
						<div class="item-desc">
							<div class="reviewer">
								<h3 class="reviewer-name">${homeList.mid}</h3>
								<img class="img-fluid rounded-circle reviewer-img"
									src="${pageContext.request.contextPath}/resources/users/mbProfile/${homeList.mprofile}"
									alt="..." />
							</div>
							 <p>${homeList.message}</p>
						</div>
					</div>
				</c:forEach>
			  </div>
			</section>
	        <!-- Testimonials-->
	        <section class="bg-gray">
				<div class="inner-wrap">
					<h3 class="section-title">나만 몰랐던 렌터카 이용 안내 팁</h3>
					<div class="rental-car-tips">
						<a href="#">
							<i class="ico-insurance"></i>
							<dl>
								<dt>렌터카 자차보험이<br>
									궁금하신가요?</dt>
								<dd>
									<p>렌터카 자차보험 제대로 알아야<br>
										사고시 손해보지 않아요</p>
								</dd>
							</dl>
						</a>
						<a href="#">
							<i class="ico-rentinfo"></i>
							<dl>
								<dt>렌터카를<br>
									처음 이용 하세요?</dt>
								<dd>
									<p>렌터카 대여 방법 어렵지 않아요<br>
									   자세히 알려드릴게요</p>
								</dd>
							</dl>
						</a>
						<a href="#">
							<i class="ico-accident"></i>
							<dl>
								<dt>렌터카 운행중 사고시<br>
									어떻게 해야 할까요?</dt>
								<dd>
									<p>렌터카 자차보험 제대로 알아야<br>
										사고시 손해보지 않아요</p>
								</dd>
							</dl>
						</a>
					</div>
				</div>
			</section>
	        <!-- Call to Action-->
	        <div class="main_board">
		        <div class="inner_wrap">
			        <div class="notice_box">
				       <h4>공지사항<a class="more" href="/noticeMove?page=1"><i class="fas fa-plus"></i></a></h4>
				       	 <ul class="main_bod_list">
							<c:forEach var="homeBoardList" items="${homeBoardList}" begin="0" end="2"
								step="1">
								<li><a class="hsb-pointer"
									href="${pageContext.request.contextPath}/boardDetailmove?bno=${homeBoardList.bno}">[공지]
										${homeBoardList.btitle}</a> <small>${homeBoardList.bdate}</small></li>
							</c:forEach>
						</ul>
				    </div>
				    <div class="qna_box">
				      <h4>고객센터<a class="more" href="/cs1"></a></h4>
					    <div class="kakao_notice">
					    	<div class="default_info">
		                    	<h5>000-000-0000</h5>
								<p>상담시간 : 평일 09:00~18:00</p>
								<p>주말, 공휴일, 점심시간(12:00~13:00) 제외</p>
							</div>
					      	<i class="kakao_icon"></i>
			       		</div>
		           </div>
	       	   </div>
        	</div>
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
        <script src="${pageContext.request.contextPath }/resources/users/js/review_slider.js"></script>
   		<script>
   		function getDate(){
   			
   		}
   		</script>
    </body>
</html>
