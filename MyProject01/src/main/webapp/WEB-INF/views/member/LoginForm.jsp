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
        <style type="text/css">
        	.kakaoImg {
    			cursor: pointer;
    			width : auto;
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
						<h1 class="display-5 fw-bold">로그인</h1>
						<p class="fs-4">이용하실 아이디를 입력해주세요</p>
					</div>
				</div>
			</div>
		</div>
		<section class="pt-4">
			<div class="container px-lg-5" style="width: 660px;">
				<!-- Page Features-->
				<div class="row gx-lg-5" style="justify-content: center;">
					<div class="col-lg-12 col-xxl-12 mb-5 col-sm-10">
						<div class="card bg-light border-0 h-100" style="border-radius: 50px; ">
							<div class="card-body text-center p-4  loginDiv" style="height: 462px;">
								<form action="${pageContext.request.contextPath }/Buyerlogin"
									onsubmit="return checkId(this);">
										<!-- 내용 사입 div -->
										<div class="loginDivs" style="border-radius: 10px 10px 0px 0px; margin-top: 70px; height: 60px;" >
											<i class="fa-regular fa-user fontlogin"></i> <input type="text"
												name="inputid" placeholder="아이디" class="inputInfo m-2"
												onfocus="focuson(this)" onblur="focusoff(this)">
										</div>
										<div class="loginDivs" style="border-radius: 0px 0px 10px 10px; height: 60px;">
											<i class="fa-solid fa-lock fontlogin"></i> <input
												type="password" name="inputpw" placeholder="비밀번호"
												class="inputInfo m-2" onfocus="focuson(this)"
												onblur="focusoff(this)">
										</div>
		
		
		
										<input type="submit" value="로그인"
											class="btn_login mt-2 btn--blue" style="margin-top: 70px !important;">
								</form>
								<div class="text-end pt-2">
									<a href="${pageContext.request.contextPath}/memberJoinForm"
										id="memberJoinbtn" class="d-inline memberJoinbtn">회원가입</a>
								</div>
								<div class="row mb-1">
	                                <a onclick="memberLogin_kakao()"> <img class="kakaoImg" src="${pageContext.request.contextPath }/resources/users/images/kakao_login_large_wide.png"></a>
	                            </div>
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
	    <script src="${pageContext.request.contextPath }/resources/users/js/review_slider.js"></script>
	    
                <!-- 카카오 로그인 -->
                <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
                    integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
                    crossorigin="anonymous"></script>


                <script type="text/javascript">
                    Kakao.init('0e240f81db5fb135b21b1c70a78d0432');
                    Kakao.isInitialized()

                    function memberLogin_kakao() {
                        console.log('카카오 로그인 호출');
                        Kakao.Auth.authorize({
                            redirectUri: 'http://121.65.47.74:5573/loginForm',
                        });
                    }
                    let authCode = '${param.code}'; //파라메더 영역(주소창) 의 code를 찾기
                    console.log("authCode : " + authCode)

                    if (authCode.length > 0) {
                        console.log("카카오_인가코드 있음");
                        console.log("인증토큰 요청");

                        $.ajax({
                            type: 'post',
                            url: 'https://kauth.kakao.com/oauth/token',
                            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                            data: {
                                'grant_type': 'authorization_code',
                                'client_id': '9ddf0efa78b5707b805a80f702bb59b0',
                                'redirect_uri': 'http://121.65.47.74:5573/loginForm', 
                                'code': authCode
                            },
                            success: function (response) {
                                console.log("인증토큰 : " + response.access_token);
                                Kakao.Auth.setAccessToken(response.access_token);

                                Kakao.API.request({
                                    url: '/v2/user/me',

                                })
                                    .then(function (response) {
                                        console.log('카카오 계정 정보');
                                        console.log('id : ' + response.id);
                                        console.log('email : ' + response.kakao_account.email);
                                        console.log('nickname : ' + response.kakao_account.profile.nickname);
                                        console.log('profile_img : ' + response.kakao_account.profile.profile_image_url);
                                        //console.log('nickname : ' + JSON.stringify(response.kakao_account));

                                        $.ajax({
                                            type: "get",
                                            url: 'memberLogin_kakao',
                                            data: {
                                                'id': response.id,
                                                'profile': response.properties.profile_image
                                            },
                                            success: function (checkMember_kakao) {
                                                if (checkMember_kakao == 'Y') {
                                                    alert('로그인 되었습니다');
                                                    location.href = '${pageContext.request.contextPath}/';
                                                } else {
                                                    let check = confirm('가입된 정보가 없습니다\n카카오 계정으로 가입 하겠습니까?')
                                                    if (check) {
														let selectJoinType = prompt("판매자 혹은 구매자인지 입력해주세요 ex)판매자");
														switch(selectJoinType){
														case "판매자" :
															memberJoin_kakao_Seller(response);
															break;
														case "구매자" :
															memberJoin_kakao_Buyer(response);
															break;
                                                        default : 
                                                            alert("잘못 입력했습니다.  다시진행해주세요");
                                                            break;
														}
                                                    }
                                                }
                                            }
                                        })
                                    })
                                    .catch(function (error) {
                                        console.log(error);
                                        console.log(error.msg)
                                    });
                            }

                        });
                    }

                    function memberLogOut_kakao() {
                        Kakao.Auth.logout()
                            .then(function (response) {
                                console.log(Kakao.Auth.getAccessToken()); // null
                            })
                            .catch(function (error) {
                                console.log('Not logged in.');
                            });
                    }

                </script>


                <script>
                    function memberJoin_kakao_Buyer(response) {
                        console.log("memberJoin_kakao() 호출")

                        $.ajax({
                            type: 'get',
                            url: 'memberJoin_kakao',
                            data: {
                                'mid':  response.id,
                                'mname': response.kakao_account.profile.nickname,
                                'memail': response.kakao_account.email,
                                'mprofile': response.kakao_account.profile.profile_image_url,
                                'mstate' : "Buyer"
                            },
                            success: function (JoinResult) {
                                alert('카카오 계정으로 회원가입되었습니다\n다시 로그인 해주세요!')
                                location.href = 'loginForm';
                            }
                        })
                    }
                    
                    function memberJoin_kakao_Seller(response) {
                        console.log("memberJoin_kakao() 호출")

                        $.ajax({
                            type: 'get',
                            url: 'memberJoin_kakao',
                            data: {
                                'mid':  response.id,
                                'mname': response.kakao_account.profile.nickname,
                                'memail': response.kakao_account.email,
                                'mprofile': response.kakao_account.profile.profile_image_url,
                                'mstate' : "Seller"
                            },
                            success: function (JoinResult) {
                                alert('카카오 계정으로 회원가입되었습니다\n다시 로그인 해주세요!')
                                location.href = 'loginForm';
                            }
                        })
                    }
        </script>

	    
		<script type="text/javascript">
			let msg = '${msg}';
			if (msg.length > 0) {
				alert(msg);
			}
	
			// 빈칸이 없는지 확인 함수
			function checkId(obj) {
	
				console.log("formCheck() 호출");
				// 아이디가 입력되지 않았으면 false
				let inputId = obj.inputid // 아이디 입력 input태그
				let inputPw = obj.inputpw // 비밀번호 입력 input태그
	
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
	
			}
	
			// 클릭시 태두리 색갈 변경함수 또는 벗어났을때 색갈 빼기
			function focuson(obj) {
				obj.parentElement.classList.add('clickDiv');
			}
	
			function focusoff(obj) {
				obj.parentElement.classList.remove('clickDiv');
			}
		</script>
	</body>
</html>
