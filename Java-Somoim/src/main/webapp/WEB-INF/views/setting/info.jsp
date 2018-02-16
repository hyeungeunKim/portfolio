<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct04 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
	#container { padding-bottom:20px;}
	.info_detail{ height: 200px; }
	#birth{ color: gray; }
	.panel-heading{ border-bottom: solid 1px #ddd;}
	.table { font-size:11px; text-align: center;}
	.table th { text-align: center;}
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
		
		// 회원 탈퇴
		$("#memberDelete").on("click", function() {
			var mid = '${login.mid}';
			var name = '${login.name}';
			
			var memberDelChack = confirm(name+" 님 정말로 탈퇴 하시겠습니까? \n회원탈퇴시 모든정보가 삭제됩니다");
			if(memberDelChack) {
				$.ajax({
					type: "delete"
					, url: "/setting/memberDelete/"+mid
					, dataType: "text"
					, success: function(result) {
						alert("탈퇴가 완료되었습니다");
						self.location="/intro/login";
					}
				});
			}
		});
		
		// 로그아웃
		$("#logout").on("click", function() {
			self.location="/setting/logout";
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
		
		// 마이페이지이동
		$(".mypageGo").click(function () {
			self.location="/setting/mypage";
		});
		
	});
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="panel panel-info managerMail"> 
			<a href="mailto:name@email.com" class="panel-info">
				<div class="panel-heading">
					<h4 class="panel-title">운영자 e-mail</h4>
					<small> 소모임 삭제를 원하면 메일주세요.</small>
					<span class="glyphicon glyphicon-envelope"></span>
				</div>
			</a>
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
					<button class="pull-right mypageGo">설정</button>
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
		
		<div class="infobar"></div>
		<div class="panel-group" id="accordionEtc" >	
			<div class="panel panel-default accordion_banner">
				<div class="panel-heading basicTitle">
					<p>기본정보</p>
				</div>
				<div class="panel-body basicSub collapse">
				
					<div class="">
						<h4 class="panel-heading panel-title accordion_title">공지사항</h4>
						<div id="etc_notice" class="panel-collapse collapse accordion_sub">
							<div class="panel-body">공지사항 내용 입니다</div>
						</div>
					</div>
					
					<div class="">
						<h4 class="panel-heading panel-title accordion_title">도움말</h4>
						<div id="etc_info" class="panel-collapse collapse accordion_sub">
							<div class="panel-body">도움말 내용입니다</div>
						</div>
					</div>
					
					<div class="">
						<h4 class="panel-heading panel-title accordion_title">버전정보</h4>
						<div id="etc_version" class="panel-collapse collapse accordion_sub">
							<div class="panel-body">버전정보 : 1.0.0</div>
						</div>
					</div>
					
				</div>
				
				<div class="panel-heading basicTitle">
					<p>알림설정</p>
				</div>
				<div class="panel-body basicSub collapse">
					
					<div class="">
						<h4 class="panel-heading panel-title accordion_title">채팅 알림 설정</h4>
						<div id="etc_chat" class="panel-collapse collapse accordion_sub">
							<div class="panel-body">채팅 알림 설정 내용 입니다</div>
						</div>
					</div>
					
					<div class="">
						<h4 class="panel-heading panel-title accordion_title">게시글 알림 설정</h4>
						<div id="etc_board" class="panel-collapse collapse accordion_sub">
							<div class="panel-body">게시글 알림 설정 내용 입니다</div>
						</div>
					</div>
					
					<div class="">
						<h4 class="panel-heading panel-title accordion_title">태그 메시지 알림 설정</h4>
						<div id="etc_tag" class="panel-collapse collapse accordion_sub">
							<div class="panel-body">태그 메시지 알림 설정 내용 입니다</div>
						</div>
					</div>

				</div>
				
			</div>
		</div>
		
		<div class="form-group">
			<div class="btn btn-block" id="logout">로그아웃</div>
			<div class="btn btn-block" id="memberDelete">회원탈퇴</div>
		</div>
		
		
		
			
	</div>
</div>
</body>
</html>