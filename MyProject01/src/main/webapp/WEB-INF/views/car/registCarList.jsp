<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 숫자 콤마 태그  -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- 비교연산 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>RentalProject</title>
<!-- Favicon-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Owl Carousel CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link
	href="${pageContext.request.contextPath }/resources/users/css/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/users/css/slider.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/users/css/main_slider.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/users/css/search_section.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/users/css/review_slider.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/users/css/mp_small_board.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/users/css/style2.css"
	rel="stylesheet" />
<style>
.carListDiv {
	border: solid 1px black;
	text-align: center;
	border-radius: 15px;
}

.carImg {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	margin: 5px;
	object-fit: contain;
}

.col_Main {
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<!-- Navigation-->
	<%@ include file="/WEB-INF/views/includes/top_nav.jsp"%>

	<!-- Main-->
	<div class="sub_main">
		<!-- hero-area -->
		<div class="sub_ban"
			style="background-repeat: no-repeat; background-position: center 80%; background-size: cover;"></div>

		<!-- 컨텐츠 시작 -->
		<div class="sub_container">
			<div class="show_list">
				<h4>검색한 차량 목록 &nbsp;&nbsp;</h4>
				<ul>
					<li>
						<div class="show-input-box no_line">
							<i class="show-calander"></i> <input
								type="text" id="senddate" class="show-real-input"
								placeholder="날짜 선택" style="display: none"> <input
								type="text" id="showdate" class="show-fake-input"
								placeholder="날짜 선택 없음" value="${param.fakeDate }" readonly>
						</div>
					</li>
					<li>
						<div class="just_flex">
							<div class="show-input-box2 no_line">
								<input class="show-fake-input2" value="09:00 대여" readonly>
							</div>
							<div class="show-input-box2 no_line">
								<input class="show-fake-input2" value="09:00 반납" readonly>
							</div>
						</div>
					</li>
					<li>
						<div class="show-select-box">
							<select name="ctype" class="show-CarType" disabled>
							
								<option value="0" <c:if test="${param.ctype == 'NONE' }">selected="selected"</c:if>>없음 </option>
								<option value="1" <c:if test="${param.ctype == '경차' }">selected="selected"</c:if>>경차</option>
								<option value="2" <c:if test="${param.ctype == '중소형' }">selected="selected"</c:if>>중소형</option>
								<option value="3" <c:if test="${param.ctype == '중형' }">selected="selected"</c:if>>중형</option>
								<option value="4" <c:if test="${param.ctype == '고급' }">selected="selected"</c:if>>고급</option>
								<option value="5" <c:if test="${param.ctype == 'SUV' }">selected="selected"</c:if>>SUV</option>
								<option value="6" <c:if test="${param.ctype == '승합' }">selected="selected"</c:if>>승합</option>
								<option value="7" <c:if test="${param.ctype == '수입' }">selected="selected"</c:if>>수입</option>
								<option value="8" <c:if test="${param.ctype == '전기' }">selected="selected"</c:if>>전기</option>
								
							</select>
						</div>
					</li>
				</ul>
			</div>
			<div class="left-box">
				<p>차량옵션</p>
				<input type="checkbox" class="rc_types" id="check0" value="RCT1" disabled <c:if test="${param.cdnosmoke == '금연' }">checked</c:if>>
				<label for="check0" disabled>금연</label>
				<input type="checkbox" class="rc_types" id="check1" value="RCT2" disabled <c:if test="${param.cdnavigation == '네비게이션' }">checked</c:if>>
				<label for="check1" disabled>네비게이션</label>
				<input type="checkbox" class="rc_types" id="check2" value="RCT3" disabled <c:if test="${param.cdblackbox == '블랙박스' }">checked</c:if>>
				<label for="check2" disabled>블랙박스</label>
				<input type="checkbox" class="rc_types" id="check4" value="RCT5" disabled <c:if test="${param.cdrearcam == '후방카메라' }">checked</c:if>>
				<label for="check4" disabled>후방카메라</label>
				<input type="checkbox" class="rc_types" id="check6" value="RCT7" disabled <c:if test="${param.cdbluetooth == '블루투스' }">checked</c:if>>
				<label for="check6" disabled>블루투스</label>
				<input type="checkbox" class="rc_types" id="check7" value="RCT8" disabled <c:if test="${param.cdcoldseat == '통풍시트' }">checked</c:if>>
				<label for="check7" disabled>통풍시트</label>
			</div>
			<div class="right-box">
			
				<c:set value="" var="printCarCode" />
				
				<c:forEach var="carInfo" items="${carList}">
					<c:set value="${carInfo.ccode}" var="checkCccode" />
					<c:if test="${not fn:contains(reserveCheckList, checkCccode)}">
					
							<c:if test="${printCarCode != carInfo.ccode}">
							<c:set value="${carInfo.ccode }" var="printCarCode" />
							<div class="rentcar_box just_flex">
								<div class="rentcar_box_left">
									<c:if test="${carInfo.carimg == null }">
										<img class="carImg"
											src="https://cdn-icons-png.flaticon.com/512/5639/5639841.png"
											alt="">
									</c:if>
									<c:if test="${carInfo.carimg != null }">
										<img class="carImg"
											src="${pageContext.request.contextPath }/resources/users/Carimage/${carInfo.carimg}"
											alt="">
									</c:if>
								</div>
								<div class="rentcar_box_center just_rightline">
									<p>${carInfo.cname } </p>
									<div class="cyear">${carInfo.cyear }년식</div>
									<div class="ctype">${carInfo.ctype }</div>
								</div>
								<div class="rentcar_box_right">
									<div class="camount">
									1일요금 
									<p class="cprice"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${carInfo.camount}" /> </p>
									원
									</div>
									<c:if test="${sessionScope.loginBId != null}">
									<button type="button" class="reservation"> 
										<a href="${pageContext.request.contextPath }/registCarDetail?ccode=${carInfo.ccode}"> 예약하기 </a>
									</button>
									</c:if>				
								</div>
								<br>
							</div>
							</c:if>
							
							
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->

	</div>
	<!-- Footer-->
	<footer class="footer bg-light">
		<div class="container">
	
		<div id="date">%{date}</div>
	
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
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2023. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-end my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item me-4"><a href="#!"><i
								class="bi-facebook fs-3"></i></a></li>
						<li class="list-inline-item me-4"><a href="#!"><i
								class="bi-twitter fs-3"></i></a></li>
						<li class="list-inline-item"><a href="#!"><i
								class="bi-instagram fs-3"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- Owl Carousel JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<!-- Core theme JS-->
	
	<script type="text/javascript">
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			if (position >= 100) {
				$('.header').addClass('coloring');
			} else {
				$('.header').removeClass('coloring');

			}
		});
	</script>
	<script
		src="${pageContext.request.contextPath }/resources/users/js/slider.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/users/js/search_section_date.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/users/js/review_slider.js"></script>

	<script>
			let calendarDate = [];
			
			let real_input = document.getElementById("senddate");
			let fake_Input = document.getElementById("showdate");
			
		
			
			let open_calander = document.getElementById("open_Calander");
			
			let d = [];
			
			function CalendarClick(obj){
				//console.log(obj);
				
				$.ajax({
					type: "get",
					url: "calendar_scdate",
					async: false,
					success:function(result){
					//console.log(result[0])
					for(let i=0; i<result.length; i++){
					console.log(result[i].scdate.split(" ")[0])
						calendarDate[i]='"'+result[i].scdate.split(" ")[0]+'"';
					reserveDate=[...calendarDate]
					}
					
					console.log("calendarDate: "+calendarDate)
					console.log("reserveDate: "+reserveDate)
					
					calendarDate.forEach(e => {
						d.push(e)
					})
				
					
					
					let flatpickrInstance = flatpickr(open_calander, {
			    mode: 'multiple',
			    dateFormat: 'Y-m-d',
			    onChange: function(selectedDates, dateStr, instance) {
			      console.log("Selected dates: ", selectedDates.map(date => date.toISOString().split('T')[0]));
			      if(selectedDates.length > 0){
			          let minDate = selectedDates.reduce((a, b) => a < b ? a : b);
			          let maxDate = selectedDates.reduce((a, b) => a > b ? a : b);
			         // fake_Input.value = formatDate(minDate) + " ~ " + formatDate(maxDate);
			         // real_input.value = dateStr;
			      } else {
			    	  fake_Input.value = "";
			    	  real_input.value = "";
			      }
			    },
				enable: [...d],
			    disable: [
			      function(date) {
			        return (date.getDay() === 0 || date.getDay() === 6);
			      }
			    ]
			});
			
			function formatDate(date) {
			    let year = date.getFullYear();
			    let month = (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1);
			    let day = (date.getDate() < 10 ? '0' : '') + date.getDate();
			    return year + '-' + month + '-' + day;
			  }
					
					
						
					},
					error:function(request, status, error){
			
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
					}
					})
				
			}
			
			
	</script>
	
	
	<script>
	let date = document.getElementById("date");
	let a = [date.innerText];
	console.log(a.length);
	</script>
</body>
</html>
