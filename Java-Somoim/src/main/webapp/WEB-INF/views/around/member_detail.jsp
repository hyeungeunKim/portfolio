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
	#container { padding-bottom:20px;}
	.info_detail{ height: 200px; }
	#birth{ color: gray; }
	.panel-heading{ border-bottom: solid 1px #ddd;}
	.table { font-size:11px; text-align: center;}
	.table th { text-align: center;}
	#header { display: none; }
	#footer { display: none; }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".attendDate").each(function(idx){
			var date = $(this).attr("data-date");
			
			var year = date.substring(0, 4);
			var month = date.substring(4, 6);
			var day = date.substring(6, 8);
			var hour = date.substring(8, 10);
			var minute =date.substring(10, 12);
			
			var newDate = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
			$(".date"+date).html(newDate);
		});
		
		// 아코디언
		$(".accordion_banner .accordion_title").click(function() {
            if($(this).next("div").is(":visible")){
            $(this).next("div").slideUp("fast");
            } else {
                $(".accordion_banner .accordion_sub").slideUp("fast");
                $(this).next("div").slideToggle("fast");
            }
        });
		
		// 아코디언2
		$(".accordion_banner .basicTitle").click(function() {
            if($(this).next("div").is(":visible")){
           		$(this).next("div").slideUp("fast");
            } else {
                $(".accordion_banner .basicSub").slideUp("fast");
                $(this).next("div").slideToggle("fast");
            }
        });
		
		// 뒤로가기
		$(".backCont").click(function() {
			self.location="/around/member_info";
		});
		
	});
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<header id="header2">
			<div class="backCont">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</div>
			<div class="titleCont">회원찾기</div>
			<div class="snsCont">
				<span class="glyphicon glyphicon-new-window"></span> <span
					class="glyphicon glyphicon-option-vertical"></span>
			</div>
		</header>
		<div class="panel panel-info managerMail"> 
			
			<div class="panel-heading">
				<h4 class="panel-title">회원정보</h4>
				<small>주변 지역의 회원정보입니다.</small>
			</div>
			
		</div>
		<div class="infobar"></div>
		<div class="panel userInfo">
			<div class="panel-heading">
				<label class="userName"><span class="glyphicon glyphicon-user"></span>${memberVo.name}</label>
				<label class="userBirth" id="birth"><small>${memberVo.birth}</small></label>
			 	<label class="pull-right userAddress">${memberVo.address}</label>
			</div>
			<div class="panel-body">
				<div class="category">
					<span><b>관심 카테고리</b> &nbsp;:&nbsp; ${memberVo.category}</span> 
				</div>
			</div>
		</div>
		
		<div class="infobar"></div>
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">

				<c:if test="">
				</c:if>
				<a data-toggle="collapse" class="panel-heading" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					<div class="" role="tab" id="headingOne">
						<h4 class="panel-title">
							<img src="../resources/img/mobile/Games.png" alt="" width="25px">개설 소모임 리스트
						</h4>
					</div>
				</a>

				<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>지역</th>
									<th>카테고리</th>
									<th>인원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${openCrewList}" var="openCrew">
									<tr>
										<td>${openCrew.title}</td>
										<td>${openCrew.region}</td>
										<td>${openCrew.category}</td>
										<td>${openCrew.join_cnt}/${openCrew.attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<a data-toggle="collapse" class="panel-heading" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				<div class="" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<img src="../resources/img/mobile/Clock.png" alt="" width="25px">가입 소모임 리스트
					</h4>
				</div>
				</a>
				<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>지역</th>
									<th>카테고리</th>
									<th>인원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${joinCrewList}" var="joinCrew">
									<tr>
										<td>${joinCrew.title}</td>
										<td>${joinCrew.region}</td>
										<td>${joinCrew.category}</td>
										<td>${joinCrew.join_cnt}/${joinCrew.attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<a data-toggle="collapse" class="panel-heading" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				<div class="" role="tab" id="headingThree">
					<h4 class="panel-title">
						<img src="../resources/img/mobile/Heart.png" alt="" width="25px">참여 정모 리스트
					</h4>
				</div>
				</a>
				<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
		 							<th>소모임 제목</th>
		 							<th>소모임 인원</th>
		 							<th>정모 제목</th>
		 							<th>정모 장소</th>
		 							<th>정모 일시</th>
		 							<th>금액</th>
		 							<th>정모 인원</th>
		 						</tr>
							</thead>
							<tbody>
								<c:forEach items="${joinSlist}" var="joinSlist">
									<tr>
										<td>${joinSlist.title}</td>
										<td>${joinSlist.join_cnt}/${joinSlist.crew_attend_cnt}</td>
										<td>${joinSlist.attend_title}</td>
										<td>${joinSlist.attend_region}</td>
										<td data-date="${joinSlist.attend_date}" class="attendDate">
											<span class="date${joinSlist.attend_date}"></span> </td>
										<td>${joinSlist.attend_money}</td>
										<td>${joinSlist.s_join_cnt}/${joinSlist.slist_attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
			
	</div>
</div>
</body>
</html>