<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			
			<form role="form" method="post">
				<input value="${vo.cno}" name="cno" id="cno" >
				<input value="${vo.sb_no}" name="sb_no" id="sb_no" >
				<input value="${vo.sb_picture}" name="sb_picture"  >
			</form>
			
			
			<div class="container">
				<div class="row">
					<div class="page-header">
						<h1>
							게시글 수정하기 <small>글을 수정합니다.</small>
						</h1>
					</div>
				</div>

				<div class="row">
					<form id="myForm" action="">
						<div class="form-group">
							<label>아이디</label>
							<input class="form-control" name="mid" id="mid" value="${login.mid}" readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="sb_title" id="sb_title" value="${vo.sb_title}">
						</div>
						
						<div class="form-group">
							<label>내용</label>
							<textarea rows="10" cols="3" class="form-control" name="sb_content" id="sb_content">${vo.sb_content}</textarea>
						</div>

						<div class="row">
							<label for="uploadedList">첨부파일</label>
							<ul class="clearfix uploadedList"></ul>
						</div>

						<div class="row">
							<div class="filebox">
								<input id="fileUpload" type="file" id="file">
								<input class="btn btn-primary form-control submit_form"	id="submit_btn" type="submit">
								<a href="crew/tab_board?cno="${vo.cno}>
								<button class="btn btn-danger form-control list_btn" id="list_btn">게시판으로 이동</button></a>
							</div>
						</div>
					</form>


					<script id="source" type="text/x-handlebars-template"> 
						<li class="col-xs-3"> 
							<span><img alt="첨부파일" src="{{imgsrc}}"></span> 
						<div> 
							<a href="{{getLink}}">{{fileName}}</a> 
							<a href="{{sb_picture}}" class="btn btn-default btn-xs pull-right delbtn"> 
							<span class="glyphicon glyphicon-remove-circle"></span> </a> 
						</div> 
						</li> 
					</script>

				

				<script type="text/javascript">
					$(document).ready(function() {
						
						var sb_no = $("#sb_no").val();
						var cno = $("#cno").val();
						
						var source = $("#source").html();
						var template = Handlebars.compile(source);
						getPicture(sb_no);
						
						function getPicture(sb_no) {
							var result = $("input[name=sb_picture]").val();
							var data = sBoard_getFileInfo(result);
							var ht = template(data);
						
							$(".uploadedList").html(ht);
							
						}
						
						$("input[type=file]").change(function(event) {
							event.preventDefault();
							var files = event.target.files;
							var file = files[0];

							var formData = new FormData();
							formData.append("file",	file);
							
							$.ajax({
								type : 'post',
								url : '/uploadAjax/sboard',
								data : formData,
								dataType : 'text',
								processData : false,
								contentType : false,
								success : function(result) {
									var data = sBoard_getFileInfo(result);
									var ht = template(data);
									$(".uploadedList").html(ht);
								}
							});
						});

						 $("#submit_btn").on("click", function(event) {
							event.preventDefault();
							
							var files = event.target.files; 
							var formData = new FormData();
							formData.append("file",	files);

							var form = $("#myForm");
							var str = "";

								str += "<input value='"+$(".delbtn").attr("href")+"' name='sb_picture' type='hidden'>";
								
								console.log(str);
							
							form.append(str);
						 	form.attr("method", "post");
							form.attr("action", "/crew/sboard_update?cno="+cno+"&sb_no="+sb_no);
							form.get(0).submit(); 
							
						});
						 
							
						$(".uploadedList").on("click", "li div .delbtn", function(event) {
							event.preventDefault();
							var delBtn = $(this);
							var delLi = $(this).parent("div").parent("li");
							
							$.ajax({
								type:"post",
								url:"/deleteFile/sboard",
								data:{
									fileName : delBtn.attr("href")
								},
								dataType: "text",
								success: function(result) {
									if(result == "DELETE_SUCCESS"){
										delLi.remove();
										alert("취소되었습니다.");	
										$("input[type=file]").val("");
									}
								}
							});
						});
						
						
					
						
				});
				</script>
				
				</div> <!-- class : row -->
			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>