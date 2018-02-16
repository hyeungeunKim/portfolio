<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.thumbnail { 	width: 200px;height: 200px;}

.thumbnail img {
	width: 100%;
	height: 100%;
}

.thumbnail_list {
	margin-top: 20px;
}

#header {
	display: none;
}

#footer {
	display: none;
}

#container {
	height: 100%;
	margin-top: 95px;
	margin-bottom: 0;
	padding-top:0;
}

.sub_tab {
	display: table;
	width: 100%;
	position: fixed;
	top: 55px;
}

.sub_tab li {
	display: table-cell;
	width: 25%;
	text-align: center;
	height: 40px;
	line-height: 39px;
	background-color: #ffffff;
	font-size: 14px;
	font-weight: bold;
	color: #929292;
	border-bottom: 1px solid #929292;
}

.sub_tab li a {
	display: block;
	color: inherit;
}

.sub_tab li a:hover {
	color: inherit;
	text-decoration: none;
}

.sub_tab li:hover {
	height: 40px;
	line-height: 38px;
	color: #493334;
	border-bottom: 2px solid #493334;
}

.sub_tab li.act {
	height: 40px;
	line-height: 38px;
	color: #493334;
	border-bottom: 2px solid #493334;
}
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<header id="header2">
			<div class="backCont">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</div>
			<div class="titleCont">게시판탭</div>
			<div class="snsCont">
				<span class="glyphicon glyphicon-new-window"></span> <span
					class="glyphicon glyphicon-option-vertical"></span>
			</div>
		</header>
		<ul class="sub_tab">
			<li><a href="../crew/tab_list?cno=${cno}">정보</a></li>
			<li class="act"><a href="../crew/tab_board?cno=${cno}">게시판</a></li>
			<li><a href="../crew/tab_gallery?cno=${cno}">사진첩</a></li>
			<li><a href="../crew/tab_chat?cno=${cno}">채팅</a></li>
		</ul>

	<div id="container">
		<div class="container">
		
			<div class="row">
				
					<div class="list-group">
					
					<c:forEach items="${list}" var="sboard_vo">
						<form role="form" method="post">
							<input value="${sboard_vo.sb_no}" name="sb_no" class="sb_no" type="hidden">
							<input value="${sboard_vo.cno}" name="cno" class="cno" type="hidden">
							<input value="${login.mid}" name="mid" class="mid" type="hidden" >	
						</form>
						
						<a href="#" class="list-group-item" data-sb_no="${sboard_vo.sb_no}" data-cno="${sboard_vo.cno}">
							<div class="sboardListTop">
								<div class="boardThumb">
									<span>
								 		<script type="text/javascript">
									 		function random_image() {
												var myimages = new Array();
												myimages[0] = "../resources/img/mobile/user01.png";
												myimages[1] = "../resources/img/mobile/user02.png";
												myimages[2] = "../resources/img/mobile/user03.png";
												myimages[3] = "../resources/img/mobile/user04.png";
												myimages[4] = "../resources/img/mobile/user05.png";
												myimages[5] = "../resources/img/mobile/user06.png";
												myimages[6] = "../resources/img/mobile/user07.png";
												myimages[7] = "../resources/img/mobile/user08.png";
												myimages[8] = "../resources/img/mobile/user09.png";
												myimages[9] = "../resources/img/mobile/user10.png";
												myimages[10] = "../resources/img/mobile/user11.png";
												myimages[11] = "../resources/img/mobile/user12.png";
												var ry = Math.floor( Math.random() * (myimages.length-1) );
												document.write('<img src="' + myimages[ry] + '" border=0>');
											}
									 		random_image();
								 		</script>
								 	</span>
								 	<span>
								 		<p class="sboardMid">${sboard_vo.mid}</p>
										<p class="sboardDate">${sboard_vo.sb_writeday}</p>
									</span>
								</div>
							</div>
							<div class="sboardListBottom">
								<p class="sboardTitle">${sboard_vo.sb_title}</p>
								<p class="sboardCont">${sboard_vo.sb_content}</p>
							</div>
						</a>	
						</c:forEach>
					</div>
			</div>
	
		<!-- 버튼 레이아웃 -->
		<a href="/crew/sboard_create?cno=${cno}" class="fixedBtn"> <span><span
				class="glyphicon glyphicon-pencil"></span></span> <span>글쓰기</span>
		</a>

		<script type="text/javascript">
			$(document).ready(function() {
				$(".list-group-item").on("click", function(event) {
					event.preventDefault();
					var loginMid = $(".mid").val();
					
					var sb_no = $(this).attr("data-sb_no");
					var cno = $(this).attr("data-cno");
					
					alert("sb_no::: "+sb_no); 	
					alert("cno::: "+cno); 
					checkMid();
					
				});
			});
			
			 function checkMid(){
					var loginMid = $(".mid").val();
					
					$.ajax({
						type : "post",
						url: "/crew/checkMid/",
						data : {  
							mid : loginMid
						},
						success : function(data) {
						 if(data == null){ // 회원정보가 소모임에 없는 경우
							 var cno = $(".cno").val();
							 alert("소모임에 가입을 해주세요");
							 self.location="/crew/sboard_detail?cno="+cno;
							 
						 }  else if(data != null){
							 var cno = $(".cno").val();
							 var sb_no = $(".sb_no").val();
							 self.location="/crew/sboard_detail?cno="+cno+"&sb_no="+sb_no;	
						 }
						  console.log(check);
						}
					});
				} 
			
			// 뒤로가기
			$(".backCont").click(function() {
				self.location="/crew/list";
			});
		
		</script>
				
			</div>
		</div>
	</div>	<!-- mobile -->
</body>