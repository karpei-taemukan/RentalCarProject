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
	    .idError{
	        border: solid 1px red;
	    } 
	    .select_type{
			margin: auto;
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
						<h1 class="display-5 fw-bold">회원가입</h1>
						<p class="fs-4">정보를 알맞게 입력해주세요</p>
					</div>
				</div>
			</div>
		</div>
		<section class="pt-4">
			<div class="container px-lg-5" style="width: 660px;">
				<!-- Page Features-->
				<div class="row gx-lg-5" style="justify-content: center;">
					<div class="col-lg-12 col-xxl-12 mb-5 col-sm-10">
						<div class="card bg-light border-0 h-100" style="border-radius: 50px;">
							<form action="${pageContext.request.contextPath }/memberJoin"
								method="post" onsubmit="return formCheck(this);"
								enctype="multipart/form-data">
								<div class="card-body text-center p-4  loginDiv" style="height: 540px; border-radius: 50px;">
									<!-- 내용 사입 div -->
									<div style="display: flex; /* margin-bottom: 20px; */ margin-top: 33px;">
										<div>
											<div class="loginDivs" style="margin-bottom: 10px; height: 60px;">
												<i class="fa-regular fa-user fontlogin"></i> <input
													type="text" name="mbid" placeholder="아이디"
													class="inputInfo m-2">
												<button type="button" class="joinBtn" onclick="checkId(this)">중복
													확인</button>
											</div>
	
											<div class="loginDivs" style="margin-bottom: 10px; height: 60px;">
												<i class="fa-solid fa-lock fontlogin"></i> <input
													type="password" name="mbpw" placeholder="비밀번호"
													class="inputInfo m-2">
											</div>
										</div>
	
	
										<div style="width: 100px">
											<img
												src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbj4oa7%2FbtqLJWFLMgd%2Fwu4GV8PKbXdICuyW0me0zk%2Fimg.jpg"
												id="preview"> <label className="inputFileCustom"
												for="inputFile" id="memberuploadBtn"> 업로드 </label> <input
												type="file" name="mbfile" id="inputFile"
												style="display: none" onchange="readURL(this);">
										</div>
									</div>
	
									<div class="loginDivs" style="margin-bottom: 10px; height: 60px;">
										<i class="fa-solid fa-address-card fontlogin"></i> <input
											type="text" name="mbname" placeholder="성함"
											class="inputInfo m-2">
									</div>
	
									<div class="loginDivs" style="margin-bottom: 10px; height: 60px;">
										<i class="fa-regular fa-envelope fontlogin"></i> <input
											type="text" name="joinEmail_id" placeholder="이메일"
											class="inputInfo m-2">
	
										<p style="margin: auto; display: block;">@</p>
	
										<input type="text" id="edomain" name="joinEmail_host"
											placeholder="선택해주세요" class="inputInfo m-2"> <select
											id="edomain_select" class="joinBtn"
											onchange="selectDomain(this)">
											<option value="">직접입력</option>
											<option value="naver.com">네이버</option>
											<option value="google.com">구글</option>
											<option value="daum.net">다음</option>
										</select>
	
									</div>
									
									<div class="loginDivs" style="margin-bottom: 65px; height: 60px; height: 50px; justify-content: center;">
                                        <div class="select_type">
	                                        <input type="radio" id="seller" value="seller" name="type" checked="checked">
	                                        <span>판매자</span>
                                        </div>
                                        <div class="select_type">
	                                        <input type="radio" id="buyer" value="buyer" name="type">
	                                        <label for="buyer">구매자</label>
                                        </div>
                                    </div>
	
									<input type="submit" value="가입완료"
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
		<script type="text/javascript">
            // 빈칸 확인용 함수
            function formCheck(obj) {

                 console.log("formCheck() 호출");
                 // 아이디가 입력되지 않았으면 false
                 let inputId = obj.mbid  // 아이디 입력 input태그
                 let inputPw = obj.mbpw  // 비밀번호 입력 input태그
                 let inputName = obj.mbname  // 성함 입력 input태그
                 let inputEmail = obj.joinEmail_id  // 이메일 입력 input태그
                 let inputEDomain = obj.edomain  // 이메일 도메인 입력 input태그

     
			if (inputId.value.length == 0) {
					alert('아이디를 입력해주세요');
					inputId.focus()
					return false;
				}
	
				// 비밀번호가 입력되지 않았으면 false
				if (inputPw.value.length == 0) {
					alert('비밀번호를 입력해주세요');
					inputPw.focus()
					return false;
				}
	
				if (inputName.value.length == 0) {
					alert('성함를 입력해주세요');
					inputName.focus()
					return false;
				}
	
				if (inputEmail.value.length == 0) {
					alert('이메일을 입력해주세요');
					inputEmail.focus()
					return false;
				}
	
				if (inputEDomain.value.length == 0) {
					alert('이메일를 선택해주세요');
					inputEDomain.focus()
					return false;
				}
	
			}
	
			// 태두리 색갈 입력 및 제거 함수
			let inputInfo = document.querySelectorAll(".inputInfo");
	
			for (let i = 0; i < inputInfo.length; i++) {
				inputInfo[i].addEventListener("focus", function(e) {
					inputInfo[i].parentElement.classList.add('clickDiv');
				});
	
				inputInfo[i].addEventListener("blur", function(e) {
					e.target.parentElement.classList.remove('clickDiv');
				});
	
			}
	
			function selectDomain(src) {
				document.querySelector("#edomain").value = src.value;
	
			}
	
			// 사진 미리 넣은 미리 보기 함수
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						document.getElementById('preview').src = e.target.result;
					};
					reader.readAsDataURL(input.files[0]);
				} else {
					document.getElementById('preview').src = "";
				}
			}
	
			// 중복 확인 버튼
			function checkId(obj) {
				let idCheckValue = obj.previousElementSibling.value;
				console.log(idCheckValue);
				$.ajax({
					url : 'memberCheck',
					data : {
						"checkURL" : idCheckValue
					},
					success : function(result) {
	
						if (result == 'N') {
							alert("아이디가 중복되었습니다.")
							obj.parentElement.classList.add('idError');
						} else if (result == 'Y') {
							alert("사용가능한 아이디 입니다.")
							obj.parentElement.classList.remove('idError');
						}
					}
				})
			}
		</script>
	</body>
</html>
