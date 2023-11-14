<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 숫자 콤마 태그  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        
        <style type="text/css">
        	#kakao {
				height: 45px;
				display: block;
				margin: auto 0;
				border-radius: 10px;
				border: 1px solid black;
				margin-bottom: 10px;
			}
			
			#toss {
				height: 45px;
				border-radius: 10px;
				border: 1px solid black;
			}
			
			#payco {
				margin-top : 10px;
				height: 45px;
				border-radius: 10px;
				border: 1px solid black;
			}
			
			#kakao, #toss, #payco {
				cursor: pointer;
			    margin-left: 85px;
			    width: 60%;
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
			<div class="sub_container">
				<div class="left_bigbox">
					<h4>예약 정보</h4>
					<span>${carinfo.cname }</span>
					<small class="car_y">
						${carinfo.ctype }
					
						|
						
						${carinfo.cyear }
					</small>
					<div class="infor">
						<div class="left_info">
							<div class="leftcar_img">
								<img class="carDetail_Img"
								src="${pageContext.request.contextPath }/resources/users/Carimage/${carinfo.carimg}"
								style="display: block;">
							</div>
						</div>
						<div class="right_info">
							<ul>
								<li>
									<span>면  허</span>
									<c:if test="${caroption.cdlicense != 'NONE' }">
										<small>${caroption.cdlicense}</small>
									</c:if>
								</li>
								<li>
									<span>기  어</span>
									<c:if test="${caroption.cdcartype != 'NONE' }">
										<small>기어 : ${caroption.cdcartype }</small>
									</c:if>
								</li>
								<li>
									<span>연령자격</span>
									<c:if test="${caroption.cdlicense != 'NONE' }">
										<small>${caroption.cdage}살 이상</small>
									</c:if>
								</li>
								<li>
									<span>운전경력</span>
									<c:if test="${caroption.cdlicense != 'NONE' }">
										<small>${caroption.cdcareer}년 이상</small>
									</c:if>
								</li>
							</ul>
						</div>
					</div>
					<div class="car_line"></div>
					<div class="car_option">
						<span>차량 옵션</span>
						<ul>
							<li>
								<c:if test="${caroption.cdnosmoke != 'NONE' }">
									<div>금연</div>
								</c:if>
							</li>
							<li>
								<c:if test="${caroption.cdbluetooth != 'NONE' }">
									<div>블루투스</div>
								</c:if>
							</li>
							<li>
								<c:if test="${caroption.cdnavigation != 'NONE' }">
									<div>네비게이션</div>
								</c:if>
							</li>
							<li>
								<c:if test="${caroption.cdblackbox != 'NONE' }">
									<div>블랙박스</div>
								</c:if>
							</li>
							<li>
								<c:if test="${caroption.cdcoldseat != 'NONE' }">
									<div>통풍 시트</div>
								</c:if>
							</li>
							<li>
								<c:if test="${caroption.cdrearcam != 'NONE' }">
									<div>후방카메라</div>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
				<div class="right_bigbox">
					<h3>결제정보</h3>
					<div class="car_small_box">
						<div> 대여일 <b id="reserveDate_span1"></b>  | 09:00</div>
						<div> 반납일 <b id="reserveDate_span2"></b>  | 09:00</div>
					</div>
					<div class="total_box">
						<p>하루 요금</p>
						<span> <fmt:formatNumber type="number" maxFractionDigits="3" value="${carinfo.camount}" /> <b>/일</b> </span>
					</div>
					<h3>예약하기</h3>
					<div>
						<img src="${pageContext.request.contextPath }/resources/users/images/kakaopay.png" id="kakao"> 
						<img src="${pageContext.request.contextPath }/resources/users/images/toss.png" id="toss">
						<img src="${pageContext.request.contextPath }/resources/users/images/payco.png" id="payco">
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
        <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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

			let reserveDate_span1 = document.querySelector("#reserveDate_span1");
			let reserveDate_span2 = document.querySelector("#reserveDate_span2");
			let loginBuyerEmail = null;
			let loginBuyerId = null;
			let cname = null;
			let ccode = null;
			let dayPrice = null;
			let day = null;
			
			let reserveDate = [];
			
			$(document).ready(function(){
				
				$.ajax({
					type:"get",
					url: "getLogin_Info",
					async: false,
					dataType:"text",
					success: (result) => {
						console.log("아이디 : " + result)
						loginBuyerId = result;
					},
					error: (request, status, error) => {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
				
					$.ajax({
					type:"get",
					url: "getEmail_Info",
					async: false,
					dataType:"text",
					success: (result) => {
						console.log("이메일 : " + result)
						loginBuyerEmail = result;
					},
					error: (request, status, error) => {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
				
				$.ajax({
					type: "get",
					url: "carReserve_info",
					async: false,
					dataType: "json",
					success: (result) => {
					console.log("carReserve_info: "+ JSON.stringify(result))
					
					for(let i=0; i<result.length; i++){
						console.log(result[i].cname)
						cname = result[i].cname;
					}
					
					error: (request, status, error) => {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					}
				})
				$.ajax({
					type: "get",
					url: "carReserve_detail_info",
					async: false,
					dataType: "json",
					success:function(result){
					console.log("carReserve_detail_info: "+JSON.stringify(result))
					
					
					for(let i=0; i < result.length; i++){
						console.log("result: "+result[i])
						day=result.length;
						ccode = result[i].ccode;
						dayPrice = result[i].dayPrice;
						reserveDate.push(result[i].scdate.substr(0,10));
						
					}
					
					let startDate = result[0].scdate.substr(0,10);
					let endDate = result[day-1].scdate.substr(0,10);
					
					reserveDate_span1.innerText = startDate;
					reserveDate_span2.innerText = endDate;
					
					console.log(reserveDate);
					},
					error:function(request, status, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					})
			})
			</script>
			
			
			<script>
//const IMP = window.IMP;
IMP.init("imp53823761");

const kakaoButton = document.querySelector("#kakao");


const onClickKakaoPay = async ()=> {
	console.log("pay clicked")
	
	IMP.request_pay({   // 결제 요청에 대한 모든 옵션이 포함된 객체를 받는다 
	    pg: "kakaopay",
	    pay_method: "card",
	    merchant_uid: "${randomCode}",
	    amount: dayPrice*day,
	    name: cname,
	},
			function (rsp) { 
            if (rsp.success) {
                console.log(rsp);	
                $.ajax({
                	type:"post",
                	url: "insert_Reserve_Info",
                	traditional:true,
                	async: false,
                	data:{
                		"loginBuyerId":loginBuyerId,
                		"ccode": ccode,
                		"reserveDate":reserveDate
                	},
                	success: (result)=>{
                		console.log(result)
                		location.href = "${pageContext.request.contextPath}/memberInfo?loginInfo=${sessionScope.loginBId}"
                	}
                })
                
            } else {
                console.log(rsp);
				alert("결제를 실패했습니다");
            }
		}
		
	);
}
	


kakaoButton.addEventListener("click", onClickKakaoPay)
</script>

<script>
//const IMP = window.IMP;
IMP.init("imp53823761");

const tossButton = document.querySelector("#toss");


const onClickTossPay = async ()=> {
	console.log("Toss pay clicked")
	
	IMP.request_pay({   // 결제 요청에 대한 모든 옵션이 포함된 객체를 받는다 
		  pg: "tosspay",
		  pay_method: "card",
		  merchant_uid: "${randomCode}", // 상점에서 생성한 고유 주문번호
		  name: cname, // 필수 파라미터 입니다.
		  amount: dayPrice*day,
		  buyer_email: loginBuyerEmail,
		  buyer_name: loginBuyerId,
	},
	function (rsp) { 
        if (rsp.success) {
            console.log(rsp);
            $.ajax({
            	type:"post",
            	url: "insert_Reserve_Info",
            	traditional:true,
            	async: false,
            	data:{
            		"loginBuyerId":loginBuyerId,
            		"ccode": ccode,
            		"reserveDate":reserveDate
            	},
            	success: (result)=>{
            		console.log(result)
            		location.href = "${pageContext.request.contextPath}/memberInfo?loginInfo=${sessionScope.loginBId}"
            	}
            })
            
        } else {
            console.log(rsp);
			alert("결제를 실패했습니다");
        }
	});
}
	


tossButton.addEventListener("click", onClickTossPay)
</script>

<script>
IMP.init("imp53823761");
const paycoButton = document.querySelector("#payco");


const onClickPaycoPay = async ()=> {
	console.log("Payco pay clicked")
	
    IMP.request_pay({
        pg : 'payco',
        merchant_uid: "${randomCode}"+"PARTNERTEST", // ccode + "PARTNERTEST"
        name : cname,
        amount: dayPrice*day,
        buyer_email: loginBuyerEmail,
		buyer_name: loginBuyerId,
    }, function (rsp) { // callback
    	   if (rsp.success) {
               console.log(rsp);
               $.ajax({
               	type:"post",
               	url: "insert_Reserve_Info",
               	traditional:true,
               	async: false,
               	data:{
               		"loginBuyerId":loginBuyerId,
               		"ccode": ccode,
               		"reserveDate":reserveDate
               	},
               	success: (result)=>{
               		console.log(result)
               		location.href = "${pageContext.request.contextPath}/memberInfo?loginInfo=${sessionScope.loginBId}"
               	}
               })
               
           } else {
               console.log(rsp);
   			alert("결제를 실패했습니다");
           }
    });           
}
	


paycoButton.addEventListener("click", onClickPaycoPay)
</script>
			
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
						d.push(	e)
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
    </body>
</html>
