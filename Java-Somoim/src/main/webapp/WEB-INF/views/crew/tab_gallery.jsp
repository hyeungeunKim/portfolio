<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
	padding-top: 95px;
	margin-bottom: 0;
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
					<input value="${login.mid}" name="mid" class="mid" type="hidden" >	
		<header id="header2">
			<div class="backCont">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</div>
			<div class="titleCont">사진첩탭</div>
			<div class="snsCont">
				<span class="glyphicon glyphicon-new-window"></span> <span
					class="glyphicon glyphicon-option-vertical"></span>
			</div>
		</header>
		<ul class="sub_tab">
			<li><a href="../crew/tab_list?cno=${cno}">정보</a></li>
			<li><a href="../crew/tab_board?cno=${cno}">게시판</a></li>
			<li class="act"><a href="../crew/tab_gallery?cno=${cno}">사진첩</a></li>
			<li><a href="../crew/tab_chat?cno=${cno}">채팅</a></li>
		</ul>

		<div id="container">
			<!-- 여기서부터 시작 -->
			<div class="container">
		
	
				<div class="row sgallery_list">
				<c:forEach items="${list}"	var="sgallery_vo">
					<div class="col-xs-6 col-sm-4">
						<form role="form" class="thumbnail" method="post">
						<a href="#" class="thumb"  data-sg_no="${sgallery_vo.sg_no}" data-cno="${sgallery_vo.cno}">
							<img alt="sgallery"	src="/displayFile?fileName=${sgallery_vo.sg_picture}">
							<input value="${sgallery_vo.sg_no}" name="sg_no" class="sg_no" type="hidden">
							<input value="${sgallery_vo.cno}" name="cno"  class="cno" type="hidden" >	
							
						</a>
						</form>
					</div>
				</c:forEach>
				</div>


				<!-- 버튼 레이아웃 -->
				<a href="sgallery_create?cno=${cno}" class="fixedBtn"> <span><span
						class="glyphicon glyphicon-pencil"></span></span> <span>글쓰기</span>
				</a>


				<script type="text/javascript">
					$(document).ready(function() {
						
					$(".sgallery_list").on("click","div .thumb", function(event) {
						event.preventDefault();
						var loginMid = $(".mid").val();
						
						var sg_no = $(this).attr("data-sg_no");
						var cno = $(this).attr("data-cno");
						alert("sg_no::: "+sg_no); 	
						alert("cno::: "+cno); 
						
						checkMid();
						
					});
					
					// 소모임 회원 여부 확인
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
								 self.location="/crew/sgallery_detail?cno="+cno;	
							 }  else if(data != null){
								var cno = $(".cno").val();
								var sg_no = $(".sg_no").val();
								self.location="/crew/sgallery_detail?cno="+cno+"&sg_no="+sg_no;	
							 }
							}
						});
					}
					
					// 뒤로가기
					$(".backCont").click(function() {
						self.location="/crew/list";
					});
				});
				</script>

			</div>
			<!-- class="container" -->
		</div>
		<!-- id="container" -->
	</div>
	<!-- mobile -->
</body>