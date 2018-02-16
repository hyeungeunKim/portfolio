<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#header { display:none;}
	#footer { display:none;}
	#container { height:100%; padding-top:95px; margin-bottom:0;}
	.sub_tab { display:table; width:100%; position: fixed; top:55px;}
	.sub_tab li { display: table-cell; width:25%; text-align:center; height:40px; line-height:39px; background-color: #ffffff; font-size:14px; font-weight:bold; color:#929292; border-bottom:1px solid #929292;}
	.sub_tab li a { display:block; color:inherit;}
	.sub_tab li a:hover { color:inherit; text-decoration: none;}
    .sub_tab li:hover { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .sub_tab li.act { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .panel{margin-bottom: auto;}
    .power{color: red;}
    .horizon{border: solid 1px rgb(255,151,220);}
    a:link a:visited a:active a:hover{text-decoration: none; color: white;}
</style>
<script type="text/javascript">
	$(document).ready(function(){	
		var cno = $("#getCno").val();
		var log = $("#log").val();
		var cMid = $("#getMid").val();
		var role = $("#getRole").val();
		var think = 0;
		
		$(".cancelBtn").hide();
		$(".sl_no").each(function(idx){
			var sl_no=$(this).attr("data-sl_no");
			$(".sl_no"+sl_no).each(function(){
				var mid=$(this).attr("data-mid");
				if(log == mid){
					
					$(".btn_join"+sl_no).hide();
					$(".btn_cancel"+sl_no).show();		
				}
			});
		});
		
		
		// 뒤로가기
		$(".backCont").click(function() {
			self.location="/crew/list";
		});
		
		$(".sList").click(function(){
			location.href="/sList/slist_create?cno="+cno;
		});
		
		// 운영자 위임
		$(".adminEntrustBtn").on("click",function(){
			var mid=$(this).attr("data-mid");
			$.ajax({
				type : "get",
				url : "/crew/update_Role?cno="+cno,
				data : {
					mid : mid
				},
				dataType : "text",
				success:function(result){
					self.location="/crew/tab_list?cno="+cno;
				}
			});
		});
		
		// 정모 참여
		$(".joinBtn").on("click", function(){
			var sl_no =$(this).attr("data-sl_no");
			var cnt = $(this).attr("data-cnt");
			var join = $(this).attr("data-join");
			var mid = $(this).attr("data-mid");
			var cno = $("#getCno").val();
			
			
			if(cnt <= join){
				alert("참석인원이 초과 하였습니다.");
				return;
			}
			$.ajax({
				type : "get",
				url : "/crew/update_s_join_cnt",
				data : {
					sl_no : sl_no,
					cno : cno,
					mid : mid
				},
				dataType : "text",
				success:function(result){
					self.location="/crew/tab_list?cno=${crewVO.cno}";
				}
			});
		});
		
		// 참석 취소
		$(".cancelBtn").on("click", function(){
			var sl_no = $(this).attr("data-sl_no");
			$.ajax({
				type : "get",
				url : "/crew/delete_slist_member",
				data : {
					sl_no : sl_no,
					mid : log
				},
				dataType :"text",
				success:function(result){
					self.location="/crew/tab_list?cno=${crewVO.cno}";
				}
			});
		});
		
		$("#join").hide();
		$(".ifmid").each(function(idx){
			var mid=$(this).val();
			if(log == mid){
				$("#join").hide();
				$("#write").show();
				think = 1;
				
			}
			if(think == 0){
				if(log != mid){
					$("#join").show();
					$("#write").hide();
				}
			}
		});
		
		$(".updel").each(function(idx){
			var sl_no=$(this).next().attr("data-sl_no");
			$(this).on("click",function(){
					self.location="/sList/slist_update?cno=${crewVO.cno}&sl_no="+sl_no;
			});
		});
		
		//운영자 해임
		$(".adminDismissBtn").on("click", function(){
			$.ajax({
				type : "get",
				url : "/crew/delete_Role",
				data :{
					cno : cno
				},
				taType : "text",
				success:function(result){
					self.location="/crew/tab_list?cno="+cno;
				}
			});
		});
		
		// 모임멤버 강퇴
		$(".memberDelBtn").on("click", function(){
			var mid = $(this).attr("data-mid");
			var name = $(this).attr("data-name");
			
			var crewMemberDelChack = confirm("'"+name+"("+mid+")' 님을 정말로 강퇴하시겠습니까?");
			
			if(crewMemberDelChack) {
				$.ajax({
					type : "get",
					url : "/crew/delete_crewMember",
					data :{
						cno : cno
						, mid : mid
					},
					taType : "text",
					success:function(result){
						self.location="/crew/tab_list?cno="+cno;
					}
				});
			}
			
		});
		
		// 소모임 탈퇴
		$(".crewMemberDel").on("click", function() {
			var mid = '${login.mid}';
			var name = '${login.name}';
			var title = '${crewVO.title}';
						
			var memberDelChack = confirm(name+" 님, '"+title+"' 소모임을 탈퇴 하시겠습니까? \n탈퇴 시 작성했던 모든정보가 삭제됩니다");
			if(memberDelChack) {
				$.ajax({
					type : "get",
					url : "/crew/delete_crewMember",
					data :{
						cno : cno
						, mid : mid
					},
					taType : "text",
					success:function(result){
						self.location="/crew/list";
					}
				});
			}
		});
		$("#join").click(function(){
			var join = $("#getJoin_cnt").val();
			var ajoin = $("#getAttend_cnt").val();
			
			if(ajoin <= join){
				alert("모임 인원이 가득 찼습니다.");
				return;
			}
			self.location="/crew/join_Crew?cno=${crewVO.cno}&mid=${login.mid}"
		});
	});
	
	function memberDetail(mid) {
		var cno = $("#getCno").val();
		var loginMid = "${login.mid}";
		if(mid != loginMid) {
			self.location="/crew/memberDetail?cno="+cno+"&mid="+mid;
		}
	}
</script>

</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<header id="header2">
		<div class="backCont">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</div>
		<div class="titleCont">
			정보탭
		</div>
		<div class="snsCont">
			<!-- <span class="glyphicon glyphicon-new-window"></span> -->
			<span class="glyphicon glyphicon-option-vertical"></span>
		</div>
	</header>
	<ul class="sub_tab">
		<li class="act"><a href="../crew/tab_list?cno=${crewVO.cno}">정보</a></li>
		<li><a href="../crew/tab_board?cno=${crewVO.cno}">게시판</a></li>
		<li><a href="../crew/tab_gallery?cno=${crewVO.cno}">사진첩</a></li>
		<li><a href="../crew/tab_chat?cno=${crewVO.cno}">채팅</a></li>
	</ul>
	
	<div id="container" class="container">
		<div class="row">
			  <div class="">
			    <a href="#" class="picture">
			      <img src="/displayFile/crew?fileName=${crewVO.picture}" alt="" width="100%;" height="auto">
			    </a>
			  </div>
		</div>
		<div class="row">
			 <div class="">
			 	<div class="listTitle">
				  <span class="listTitleCate" id="basic-addon1">${crewVO.category}</span>
				  <span class="listTitleName" id="test" >${crewVO.title}</span>
				</div>
				  <input id="getCno" value="${crewVO.cno}" type="hidden">
				  <input id="log" value="${login.mid}" type="hidden">
				  <input id="getMid" value="${crewVO.mid}" type="hidden">
				  <input id="getRole" value="${crewVO.role}" type="hidden">
				  <input id="getAttend_cnt" value="${crewVO.attend_cnt}" type="hidden">
				  <input id="getJoin_cnt" value="${crewVO.join_cnt}" type="hidden">
			</div>
		</div>
		<div class="row">
			<div class="content">
				${crewVO.content}
			</div>
		</div>
		<div class="row">
			<c:if test="${crewVO.mid == login.mid || crewVO.role == login.mid }">
				<button class="sList_create"><span class="glyphicon glyphicon-plus"></span> <span>새로운 정모 만들기</span></button>
			</c:if>
			<c:if test="${sList_list.size() != 0}">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<c:forEach items="${sList_list}" var="sList">
						<div class="panel-heading" >
							<span>${sList.attend_title} (${sList.attend_cnt}명)</span>
							<c:if test="${crewVO.mid == login.mid || crewVO.role == login.mid }">
								<button class="btn btn-info updel col-xs-offset-7">수정 삭제</button>
							</c:if>
							<c:forEach items="${member_list}" var="member">
								<c:if test="${login.mid == member.mid}">
									<button class="btn btn-danger joinBtn btn_join${sList.sl_no}" data-sl_no="${sList.sl_no}" data-cnt="${sList.attend_cnt}" data-join="${sList.s_join_cnt}" data-mid="${login.mid}">참석</button>
									<button class="btn btn-primary cancelBtn btn_cancel${sList.sl_no}" data-sl_no="${sList.sl_no}">참석취소</button>
								</c:if>
							</c:forEach>
						</div>
						<!-- List group -->
						<ul class="list-group">
							<li class="list-group-item">정모 날자: ${sList.attend_date}</li>
							<li class="list-group-item">정모 장소: ${sList.attend_region}</li>
							<li class="list-group-item">회비 : ${sList.attend_money}</li>
						</ul>
						<button class="btn btn-default form-control" type="button" data-toggle="collapse" data-target="#midshow${sList.sl_no}" aria-expanded="false" aria-controls="midshow${sList.sl_no}" data-sl_no="${sList.sl_no}">참석 인원 보기(현재 참석인원${sList.s_join_cnt}/${sList.attend_cnt})</button>
						<div class="collapse" id="midshow${sList.sl_no}">
							<div class="well">
								<ul class="list-group">
									<c:forEach items="${status}" var="status">
										<c:if test="${sList.sl_no==status.sl_no}">
											<li class="list-group-item sl_no${status.sl_no}"data-log="${login.mid}" data-mid="${status.mid}">${status.name}</li>
											<li class="sl_no" data-sl_no="${status.sl_no}" hidden="">
										</c:if>		  
									</c:forEach>
								</ul>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>
			</c:if>
		</div>
		
		<div class="row role" >
			<div class="sListMtitle">모임 멤버</div>
			<div class="list-group-item">
			<c:forEach items="${member_list}" var="member">
				<div class="aroundList">
					<div class="name"> 
					 	<span class="">
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
					 	<label class="aroundName" onclick="memberDetail('${member.mid}')">${member.name}</label> 
						<c:if test="${crewVO.role == member.mid}">
							<span class="power">운영자</span>
						</c:if>
						<c:if test="${crewVO.mid == member.mid}">
							<span class="power">모임장</span>
						</c:if>
						<c:if test="${crewVO.role == member.mid && crewVO.mid == login.mid && crewVO.mid != member.mid}">
							<button class="btn btn-warning adminDismissBtn" data-mid="${member.mid}">운영자해임</button>
						</c:if>
						<c:if test="${crewVO.role != member.mid && crewVO.mid == login.mid && crewVO.mid != member.mid}">
							<button class="btn btn-warning memberDelBtn slist_btn pull-right" data-mid="${member.mid}" data-name="${member.name}">강퇴</button>
							<button class="btn btn-success adminEntrustBtn slist_btn pull-right" data-mid="${member.mid}">운영자위임</button>
						</c:if>
						<input class="ifmid" value="${member.mid}" type="hidden">
				 	</div>
				</div>		
			</c:forEach>
			</div>
			<c:forEach items="${member_list}" var="member">
				<c:if test="${(login.mid == member.mid) && (login.mid != crewVO.mid) && (login.mid != crewVO.role)}">
					<button class="btn-block crewMemberDel">소모임 탈퇴</button>
				</c:if>
			</c:forEach>
		</div>
		
		
	</div>

	<!-- 버튼 레이아웃 -->
	<a href="#" class="fixedBtn" id="join">
		<span><span class="glyphicon glyphicon-plus"></span></span>
		<span>가입</span>
	</a>	
	<a href="/crew/sboard_create?cno=${crewVO.cno}" class="fixedBtn" id="write">
		<span><span class="glyphicon glyphicon-pencil"></span></span>
		<span>글쓰기</span>
	</a>

</div>


</body>

