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
        <style>
			.replyName {
				margin-left: 11px;
				margin-top: 10px;
				font-weight: bold;
				font-size: 17px;
				margin-right: 60px;
				margin-bottom: 12px;
			}
			
			.boardBtnDiv {
				display: flex;
				justify-content: end;
				margin-bottom: 10px;
			}
			
			.boardModiftyBtn, .boardDeleteBtn {
				margin-left: 5px
			}
			
			.replyDeleteDiv {
				text-align: end;
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
				<div class="board_wrap">
					<h3>게시판 상세페이지</h3>
					<div class="bttm-box">
						<ul id="board_view">
							<li class="title_area">
								<h6>${boardDetail.btitle }</h6>
							</li>
							<li class="sub_area" style="display: flex; justify-content: flex-end;">
								<span>작성자 ${boardDetail.bwriter}</span>
								<span>조회수 ${boardDetail.bhits}</span>
							</li>
							<li class="edit_area">
								<div class="script_zone">${boardDetail.bcontents}</div>
							</li>
						</ul>
						<div id="view-btn">
							<c:if test="${boardDetail.bwriter == sessionScope.loginBId ||(sessionScope.loginState == 'KA' && boardDetail.bwriter == sessionScope.loginName)}">
								<div class="boardBtnDiv">
									<div class="boardModiftyBtn">
										<a
											href="${pageContext.request.contextPath}/boardUpdateForm?bno=${boardDetail.bno }&bwriter=${boardDetail.bwriter}"
											class="writeBtn btn btn-warning">글 수정</a>
									</div>
									<div class="boardDeleteBtn">
										<a
											href="${pageContext.request.contextPath}/boardDelete?bno=${boardDetail.bno }&bwriter=${boardDetail.bwriter}"
											class="writeBtn btn btn-danger">글 삭제</a>
									</div>

								</div>
							</c:if>
						</div>
						<div id="reply_insert">
							<c:if test="${sessionScope.loginSId != null || sessionScope.loginBId != null }">
								<form action="${pageContext.request.contextPath}/replyInsert"
									onsubmit="return checkId(this)">
									<div class="divCover" style="margin-top: 20px;">
										<div style="display: flex;">
											<div class="replyWriteTitle">댓글</div>
											<button type="submit" class="btn replyWriteBtn" style="width: 100px; height: 45px; padding: 0; position: relative; top: -7px;">
											 	댓글 등록
											 </button>
										</div>
										<div class="boardWriteArea">
											<textarea id="replyTextArea" placeholder="댓글을 작성해주세요 최대(50자)"
												maxlength="50" name="recomment"></textarea>
										</div>
									</div>
									<input name="rebno" value="${boardDetail.bno}" hidden>
								</form>
							</c:if>
						</div>
						<div class="divCover" style="margin-top: 20px;">
							<h2 style="color: #2a2a2a; margin-bottom: 8px; border-bottom: 2px solid #2a2a2a;">전체 댓글</h2>
						</div>
						<div>
							<c:forEach var="reply" items="${replyList }">
								<div class="replyListArea">
									<div
										style="display: flex; width: 100%; border-bottom: 1px solid #ddd;">
										<div style="width: 70%; margin-right: auto; display: flex;">
											<div class="replyName">${reply.remid}</div>
											<div class="replyContents" style="margin-top:10px;">${reply.recomment }</div>
										</div>
	
										<div style="display: flex;">
											<div class="replyWriteDate" style="margin-right: 15px; margin-top: 10px;">${reply.redate }</div>
											<c:if
												test="${reply.remid == sessionScope.loginBId || reply.remid == sessionScope.loginSId || sessionScope.loginState == 'AD'}">
												<div class="replyDeleteDiv" style="margin-top: 10px;">
													<a
														href="${pageContext.request.contextPath}/replyDelete?renum=${reply.renum}&bno=${reply.rebno}"
														style="color: #888">댓글 삭제</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- C:태그 끝 -->
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
        <script type="text/javascript">
			// 댓글 입력 확인
			function formCheck(obj) {
	
				console.log("formCheck() 호출");
				// 아이디가 입력되지 않았으면 false
				let inputReply = obj.reply // 댓글 입력 input태그
	
				if (inputReply.value.length == 0) {
					alert('댓글을 입력해주세요');
					inputReply.focus()
					return false;
				}
	
			}
	
			// 택스트 에리어 길이 자동 조절
			function resize(obj) {
				obj.style.height = '1px';
				obj.style.height = (12 + obj.scrollHeight) + 'px';
				if (obj.style.height.substr(0, obj.style.height.length - 2) >= 100) {
					obj.style.height = '100px';
				}
			}
	
			let msg = '${msg}';
			if (msg.length > 0) {
				alert(msg);
			}
		</script>
    </body>
</html>
