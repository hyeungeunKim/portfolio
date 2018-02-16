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
		var cno=${slistVo.cno};
		var sl_no=${slistVo.sl_no};
		
		var date = "${slistVo.attend_date}";
		
		var year = date.substring(0, 4);
		var month = date.substring(4, 6);
		var day = date.substring(6, 8);
		var hour = date.substring(8, 10);
		var minute =date.substring(10, 12);
		
		var newDate = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
		$("#attend_date_sub").val(newDate);
		
		// 정모 수정
		$("#btn_update").on("click",function(event){
			event.preventDefault();
			writeCheck();
		});
		
		// 정모 삭제
		$("#btn_delete").on("click",function(event){
			event.preventDefault();
			var slistDelChack = confirm("해당 정모를 삭제하시겠습니까?");
			if(slistDelChack) {
				$("#myForm").attr("action", "/sList/slist_delete?cno="+cno+"&sl_no="+sl_no);
				$("#myForm").attr("method", "post");
				$("#myForm").submit();
			}
		});
		
		// 취소
		$("#btn_list").click(function() {
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

		form.submit(); 
	}
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div class="container" id="container">
		<!-- 여기서부터 시작 -->
			<div class="row">
				<form action="" method="post" class="formLayout" id="myForm" name="slistform">
					<input type="hidden" name="cno" value="${slistVo.cno}">
					
					<div class="form-group">
						<label for="attend_title">(제목)정모 이름</label>
						<input name="attend_title" id="attend_title" class="form-control" value="${slistVo.attend_title}">
					</div>	

					<div class="form-group">
						<label for="attend_date">정모 일시</label>
						<input type="hidden" name="attend_date" id="attend_date" class="form-control" value="${slistVo.attend_date}">
						<input name="attend_date_sub" id="attend_date_sub" class="form-control" value="" readonly>
					</div>
					
					<div class="form-group">
						<label for="attend_region">정모 장소</label>
						<input name="attend_region" id="attend_region" class="form-control" value="${slistVo.attend_region}">
					</div>

					<div class="form-group">
						<label for="attend_money">회비</label>
						<input type="number" name="attend_money" id="attend_money" class="form-control" value="${slistVo.attend_money}">
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
						<button class="btn btn-primary" type="submit" id="btn_update">
							<span class="glyphicon glyphicon-check"></span> 수정하기
						</button>
						<button class="btn btn-primary" type="submit" id="btn_delete">
							<span class="glyphicon glyphicon-trash"></span> 삭제하기
						</button>
						<button class="btn btn-info" type="button" id="btn_list">
							<span class="glyphicon glyphicon-list"></span> 취소
						</button>
					</div>
				</form>
				
			</div>
		<!--  -->
	</div>
</div>

</body>