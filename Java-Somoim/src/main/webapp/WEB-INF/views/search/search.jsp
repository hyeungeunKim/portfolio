<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.navAct02 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var keyword=$("#keyword").val();
		
		$("#searchBtn").on("click", function() {
			keyword=$("#keyword").val();
			self.location="/search/searchCrew?searchType=title&keyword="+keyword;
		});
		
		// 카테고리 리스트 가리기
		$("#category_list").hide();
		$("#keyword").keyup(function() {
			if ( keyword == $("#keyword").val()) {
				$("#category_list").slideUp("slow");
			}	
		});
		
		// 카테고리 리스트보이기
		$("#keyword").onkeydown = function() {
			myFunction()
		};
		
	});
	
	function myFunction() {
		$("#category_list").slideDown("slow");
	}
	
	function searchCategory(categoryKey) {
		event.preventDefault();
		self.location="/search/searchCrew?searchType=category&keyword="+categoryKey;
	}
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
		<div class="input-group">
			<input class="form-control" id="keyword" name="keyword" placeholder="모임명을 입력하세요" onkeydown="myFunction()">
			<span class="input-group-addon" id="searchBtn">
				<span>검색</span>
				<span class="glyphicon glyphicon-search"></span>
			</span>
		</div>
		
		<div class="panel panel-default" id="category_list">
			<div class="panel-heading">
				<h3 class="panel-title">카테고리를 선택하세요</h3>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('아웃도어/여행')">아웃도어/여행</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('운동/스포츠')">운동/스포츠</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('인문학/책/글')">인문학/책/글</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('외국/언어')">외국/언어</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('문화/공연')">문화/공연</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('음악/악기')">음악/악기</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('공예/만들기')">공예/만들기</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('댄스/무용')">댄스/무용</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('봉사활동')">봉사활동</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('사교/인맥')">사교/인맥</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('차/오토바이')">차/오토바이</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('사진')">사진</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('야구관람')">야구관람</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('게임/오락')">게임/오락</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('요리/제조')">요리/제조</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('반려동물')">반려동물</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('가족/결혼')">가족/결혼</span></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><span onclick="searchCategory('자유주제')">자유주제</span></h4>
			</div>
			
		</div>
		<!--  -->
	</div>
</div>
</body>