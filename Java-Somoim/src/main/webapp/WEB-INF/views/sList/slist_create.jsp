<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<script type="text/javascript">
	$(document).ready(function(){
		// 정모 생성
		$("#btn_create").on("click",function(event){
			event.preventDefault();
			var attend_date1 = $("#attend_date1 option:selected").val();
			var attend_date2 = $("#attend_date2 option:selected").val();
			if(attend_date2<10) {
				attend_date2='0'+attend_date2;
			}
			var attend_date3 = $("#attend_date3 option:selected").val();
			if(attend_date3<10) {
				attend_date3='0'+attend_date3;
			}
			var attend_date4 = $("#attend_date4 option:selected").val();
			if(attend_date4<10) {
				attend_date4='0'+attend_date4;
			}
			var attend_date5 = $("#attend_date5 option:selected").val();
			if(attend_date5<10) {
				attend_date5='0'+attend_date5;
			}
			var attend_date = attend_date1 + attend_date2 + attend_date3 + attend_date4 + attend_date5;
			//alert(attend_date);
			$("#attend_date").val(attend_date);
			
			writeCheck();
			//$("#myForm").submit();
		});
		
		// 취소
		$("#btn_list").click(function() {
			var cno=${cno};
			location.href="/crew/tab_list?cno="+cno;
		});
		
	});
	var check = 0;
	
	// 폼체크
	function writeCheck() { 
		
		// 폼을 변수에 담는다
		var form = document.slistform;
		
		if(!form.attend_title.value)  { 
			alert("소모임 제목을 입력해주세요"); 
			form.attend_title.focus();
	   		return ;
		} 
		
		if(!form.attend_region.value)  { 
			alert("소모임 장소를 입력해주세요"); 
			form.attend_region.focus();
	   		return ;
		} 
		
		if(!form.attend_money.value)  { 
			alert("정모회비를 입력해주세요"); 
			form.attend_money.focus();
	   		return ;
		} 
		
		if(!form.attend_cnt.value) { 
			alert("정모 정원을 선택해주세요"); 
			form.attend_cnt.focus(); 
			return ; 
		} 
		
		if(!form.attend_date1.value) { 
			alert("년도를 선택하세요."); 
			form.attend_date1.focus(); 
			return ; 
		} 
		
		if(!form.attend_date2.value) { 
			alert("월을 선택하세요."); 
			form.attend_date2.focus(); 
			return ; 
		} 
		
		if(!form.attend_date3.value) { 
			alert("일자를 선택하세요."); 
			form.attend_date3.focus(); 
			return ; 
		}
		
		if(!form.attend_date4.value) { 
			alert("시간을 선택하세요."); 
			form.attend_date4.focus(); 
			return ; 
		}
		if(!form.attend_date5.value) { 
			alert("분을 선택하세요."); 
			form.attend_date5.focus(); 
			return ; 
		}

		form.submit(); 
	}
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
			<div class="container">
				<div class="row">
				<form action="" method="post" class="formLayout" id="myForm" name="slistform">
					<input type="hidden" name="cno" value="${cno}">
					<input type="hidden" id="attend_date" name="attend_date" value="">
					
					<div class="form-group">
						<label for="attend_title">정모명</label>
						<input name="attend_title" id="attend_title" class="form-control" placeholder="정모의 이름을 정해주세요">
					</div>	

					<div class="form-group">
						<label for="attend_date">정모 일시 <small>*정모 일시는 나중에 수정 할 수 없습니다.</small></label>
						<div class="row">
							<div class="col-sm-12">
								<select name="attend_date1" id="attend_date1">
									<option value="">년도</option>
									<%for(int i=2017; i<=2020; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
								</select>년&nbsp;
								<select name="attend_date2" id="attend_date2">
									<option value="">월</option>
									<%for(int i=1; i<=12; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
								</select>월 &nbsp;
								<select name="attend_date3" id="attend_date3">
									<option value="">일</option>
									<%for(int i=1; i<=31; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
								</select>일 &nbsp;&nbsp;
								
								<select name="attend_date4" id="attend_date4">
									<option value="">시</option>
									<%for(int i=1; i<=24; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
								</select>시 &nbsp;
								<select name="attend_date5" id="attend_date5">
									<option value="">분</option>
									<%for(int i=0; i<60; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
								</select>분
								
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="attend_region">정모 장소</label>
						<input name="attend_region" id="attend_region" class="form-control" placeholder="정모장소를 정해주세요">
					</div>

					<div class="form-group">
						<label for="attend_money">회비</label>
						<input type="number" name="attend_money" id="attend_money" class="form-control" placeholder="15000">
					</div>
					
					<div class="form-group">
						<label for="attend_cnt">정원</label>
						<div class="input-group">
							<select name="attend_cnt" id="attend_cnt">
								<option value="">최대인원</option>
								<%for(int i=3; i<=20; i++){ %>
								<option value="<%=i %>"><%=i %></option>
								<%} %>
							</select>
						</div>
						
					</div>
					
					<div class="form-group text-right">
						<button class="btn btn-primary" type="submit" id="btn_create">
							<span class="glyphicon glyphicon-check"></span> 정모 만들기
						</button>
						<button class="btn btn-info" type="button" id="btn_list">
							<span class="glyphicon glyphicon-list"></span> 취소
						</button>
					</div>
				</form>
				</div>
			</div>
		<!--  -->
	</div>
</div>

</body>