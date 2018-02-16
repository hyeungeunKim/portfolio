<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct01 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
			<ul class="list-group">
				
				<li class="list-group-item info_detail">
				
					<div class="name"> 
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
					 	<label class="aroundName">${memberVo.mid}</label> 
					 	<label class="aroundBirth" id="birth">
					 		<small>${memberVo.birth}</small>
					 	</label>
					 	<label class="aroundAddress">${memberVo.address}</label>
				 	</div>
					<div class="category">
					 	<div>
							<span><img src="../resources/img/mobile/Camera.png" border=0></span>
							<span><img src="../resources/img/mobile/Headphones.png" border=0></span>
							<span><img src="../resources/img/mobile/Microphone.png" border=0></span>
							<span><img src="../resources/img/mobile/iPod.png" border=0></span> 
					 	</div>
					</div>
				
				</li>
				
					
				<li class="aroundTitle">내 주변 회원찾기</li>
				<li class="list-group-item">
					<c:forEach items="${list}" var="memberList">
						<a href="/around/member_detail?mid=${memberList.mid}" class="aroundList">
							<div class="name"> 
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
							 	<label class="aroundName">${memberList.mid}</label> 
							 	<label class="aroundBirth" id="birth">
							 		<small>${memberList.birth}</small>
							 	</label>
							 	<label class="aroundAddress">${memberList.address}</label>
						 	</div>
						 </a>
					 </c:forEach>
				</li>
			</ul>
		</div>
	</div>
</body>

