<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct03 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".getCno").each(function(idx){
			var cno = $(this).attr("data-cno");	
			getsList(cno);
		});
		
		// 상세보기 - 가입list
		$(".joinCrewList").click(function() {
			var cno = $(this).attr("data-cno");	
			self.location="/crew/bread?cno="+cno;
		});
		
		// 상세보기 - 추천list
		$(".selCrewList").click(function() {
			var cno = $(this).attr("data-cno");	
			self.location="/crew/bread?cno="+cno;
		});
		
	});
	
	function getsList(cno){
		$.getJSON("/my/list_sList/"+cno, function(data) {
			console.log(data);
			var source = $("#source").html();
			var template = Handlebars.compile(source);
			$(".next_sList"+cno).html(template(data));
		});
	}
</script>
<script id="source" type="text/x-handlebars-template">
	<p>정모 : {{attend_title}} | 일시 : {{attend_date}} | 장소 : {{attend_region}} </p>
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
		<div class="panel panel-default">
			<div class="myTitle">
				<p>가입한 모임</p>
			</div>
			<c:forEach items="${attend_list}" var="join">
				<div class="panel-body joinCrewList" data-cno="${join.cno}">
					<p data-cno="${join.cno}" class="getCno"><span>${join.title}</span> <span class="pull-right memberCount"><span class="memberRight">${join.join_cnt}</span> / ${join.attend_cnt} 명</span></p>
					<div class="next_sList${join.cno}"></div>
				</div>
			</c:forEach>
		</div>
		<div class="panel panel-default">
			<div class="myTitle">
				<p>맞춤 추천 모임</p>
			</div>
			<c:forEach items="${sel_list}" var="sel">
				<div class="panel-body selCrewList" data-cno="${sel.cno}">
						<div class="next_sList${sel.cno}"></div>
						<p data-cno="${sel.cno}" class="myCno">
							<span>${sel.region}</span> |  
							<span>${sel.title}</span>
						</p>
						<p class="myMember"><span class="text-right memberCount"><span class="memberRight">${sel.join_cnt}</span> / ${sel.attend_cnt} 명</span></p>
				</div>
			</c:forEach>
		</div>
		<!--  -->
	</div>
</div>
</body>