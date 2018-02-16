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
		$(".birthDate").each(function(idx){
			var date = $(this).attr("data-date");
			
			var year = date.substring(0, 4);
			var month = date.substring(4, 6);
			var day = date.substring(6, 8);
			
			var newDate = year + "/" + month + "/" + day ;
			$(".date"+date).html(newDate);
		});
		
		// 소모임 삭제
		$(".allCrew").on("click", ".crewDeleteBtn", function(){
			var cno = $(this).attr("data-cno");
			// alert(cno);
			
			var crewDelChack = confirm("정말로 삭제하시겠습니까?");
			if(crewDelChack) {
				$.ajax({
					type: "delete"
					, url: "/admin/crewDelete/"+cno
					, headers: {
						"Content-Type": "application/json"
						, "X-HTTP-Method-Override": "DELETE"
					}
					, dataType: "text"
					, success: function(result) {
						if(result=="DELETE_SUCCESS") {
							alert("소모임 삭제 완료");
							getCrewList();
						}
					}
				});
			}
			
		});
		
		// 회원 탈퇴
		$(".allMember").on("click", ".memberDeleteBtn", function(){
			var mid = $(this).attr("data-mid");
			// alert(mid);
			
			var memberDelChack = confirm("정말로 "+mid+" 회원을 삭제하시겠습니까?");
			if(memberDelChack) {
				$.ajax({
					type: "delete"
					, url: "/admin/memberDelete/"+mid
					, headers: {
						"Content-Type": "application/json"
						, "X-HTTP-Method-Override": "DELETE"
					}
					, dataType: "text"
					, success: function(result) {
						if(result=="DELETE_SUCCESS") {
							alert("회원 삭제 완료");
							getMerberList();
						}
					}
				}); 
			}
			
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
		
		// 로그아웃
		$("#logout").on("click", function() {
			self.location="/setting/logout";
		});
		
	});
	
	function getCrewList() {
		$.getJSON("/admin/getCrewList", function(data) {			
			var source = $("#sourceCrew").html();
			var template = Handlebars.compile(source);
			$(".allCrew").html(template(data)); 
		});
	}
	
	function getMerberList() {
		$.getJSON("/admin/getMerberList", function(data) {			
			var source = $("#sourceMember").html();
			var template = Handlebars.compile(source);
			$(".allMember").html(template(data)); 
		});
	}
</script>
<script id="sourceCrew" type="text/x-handlebars-template">
{{#each.}}
	<tr>
		<td>{{cno}}</td>
		<td>{{title}}</td>
		<td>{{mid}}</td>
		<td>{{region}}</td>
		<td>{{category}}</td>
		<td>{{join_cnt}}/{{attend_cnt}}</td>
		<c:if test="${login.power==2}">
			<td><button class="btn active crewDeleteBtn" data-cno="{{cno}}">삭제</button></td> 
		</c:if>
	</tr>
{{/each}}
</script>
<script id="sourceMember" type="text/x-handlebars-template">
{{#each.}}
	<tr>
		<td>{{mid}}</td>
		<td>{{name}}</td>
		<td>{{gender}}</td>
		<td>{{birth}}</td>
		<td>{{address}}</td>
		<td><button class="btn active memberDeleteBtn" data-mid="{{mid}}">삭제</button></td> 
	</tr>
{{/each}}
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="panel panel-info managerMail"> 
			<div class="panel-info">
				<div class="panel-heading">
					<h4 class="panel-title">ADMIN</h4>
					<small>운영자 / 관리자 페이지입니다.</small>
					
				</div>
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
					<button class="pull-right">설정</button>
				</div>
			</div>
		</div>
		
		
		<!-- 관리자 : 전체회원수 / 소모임수 / 소모임별 회원수 / 회원삭제 / 소모임삭제 -->
		<!-- 경영자 : 전체회원수 / 소모임수 / 소모임별 회원수 / 총 방문자수 -->
		<div class="infobar"></div>
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">

				<c:if test="">
				</c:if>
				<div data-toggle="collapse" class="panel-heading" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					<div class="" role="tab" id="headingOne">
						<h4 class="panel-title">
							<img src="../resources/img/mobile/Games.png" alt="" width="25px">전체 회원수
							<span class="pull-right"> ${memberCnt} 명</span>
						</h4>
					</div>
				</div>
				
				<div data-toggle="collapse" class="panel-heading" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				<div class="" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<img src="../resources/img/mobile/Clock.png" alt="" width="25px">소모임 수
						<span class="pull-right"> ${crewCnt} 개</span>
					</h4>
				</div>
				</div>
				
				<a data-toggle="collapse" class="panel-heading" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				<div class="" role="tab" id="headingThree">
					<h4 class="panel-title">
						<img src="../resources/img/mobile/Heart.png" alt="" width="25px">소모임 별 회원 수
					</h4>
				</div>
				</a>
				<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>No.</th>
									<th>소모임 제목</th>
									<th>모임장</th>
									<th>지역</th>
									<th>카테고리</th>
									<th>소모임 인원</th>
									<!-- 운영자만 보이게 -->
									<c:if test="${login.power==2}">
										<th>소모임 삭제</th> 
									</c:if>
								</tr>
							</thead>
							<tbody class="allCrew">
								<c:forEach items="${crewList}" var="crewVo">
									<tr>
										<td>${crewVo.cno}</td>
										<td>${crewVo.title}</td>
										<td>${crewVo.mid}</td>
										<td>${crewVo.region}</td>
										<td>${crewVo.category}</td>
										<td>${crewVo.join_cnt}/${crewVo.attend_cnt}</td>
										<c:if test="${login.power==2}">
											<td><button class="btn active crewDeleteBtn" data-cno="${crewVo.cno}">삭제</button></td> 
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 운영자만 보이게 -->
				<c:if test="${login.power==2}">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
								회원 정보 <small>(관리자/경영자의 정보는 보이지 않습니다.)</small> </a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>이름</th>
										<th>성별</th>
										<th>생년월일</th>
										<th>주소</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody class="allMember">
									<c:forEach items="${memberList}" var="memberVo">
										<tr>
											<td>${memberVo.mid}</td>
											<td>${memberVo.name}</td>
											<td>${memberVo.gender}</td>
											<td data-date="${memberVo.birth}" class="birthDate">
												<span class="date${memberVo.birth}"></span> </td>
											<td>${memberVo.address}</td>
											<td><button class="btn active memberDeleteBtn" data-mid="${memberVo.mid}">삭제</button></td> 
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>		
				
				<!-- 경영자만 보이게 -->
				<c:if test="${login.power==3}">
					<div class="panel-heading" role="tab" id="headingFive">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
								총 방문자 수<span class="pull-right"> ${visitorCnt} 명</span> </a>
						</h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>일자</th>
										<th>방문자수</th>	
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${visitorList}" var="visitorVO">
										<tr>
											<td>${visitorVO.visit_day}</td>
											<td>${visitorVO.count} 명</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>		
				
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
		</div>
			
	</div>
</div>
</body>
</html>