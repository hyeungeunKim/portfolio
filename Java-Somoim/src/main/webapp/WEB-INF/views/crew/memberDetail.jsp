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
    .panel-heading{ border-bottom: solid 1px #ddd;}
    a:link a:visited a:active a:hover{text-decoration: none; color: white;}
</style>
<script type="text/javascript">
	$(document).ready(function(){	
		var cno = ${cno}
		
		// 뒤로가기
		$(".backCont").click(function() {
			self.location="/crew/tab_list?cno="+cno;
		});
		
	});
	
	function crewDetail(cno) {
		self.location="/crew/tab_list?cno="+cno;
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
			${memberVo.name}
		</div>
		<div class="snsCont">
		</div>
	</header>
	
	<div id="container" class="container">
		<div class="row">
			<input type="hidden" name="cno" value="${cno}">
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
			<div class="panel ">
				<div class="panel-heading">
					<label>가입한 소모임</label>
				</div>
				<c:forEach items="${memberCrewList}" var="memberCrew">
					<div class="panel-body" onclick="crewDetail('${memberCrew.cno}')">
						<p>${memberCrew.title}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</div>
</body>

