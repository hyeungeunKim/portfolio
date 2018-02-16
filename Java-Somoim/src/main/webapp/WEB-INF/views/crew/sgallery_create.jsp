<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.navAct02 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
#fileUpload{ margin-bottom: 5px;}
#list_btn{ margin-top: 5px;}
.imgsize{ max-height:100%; max-width:100%;}
.uploadedList { margin: 20px 0 30px 0; min-height:150px; background-color: #fff; padding: 20px; border-radius: 10px; border: 1px solid #ddd;}
.imgshow { width: 25%;}
.imgshow>div,.imgshow>span { display:inline-block; width: 100%;}
.imgshow div a:first-child { width: 80%; display:inline-block;}
.delbtn { padding: 2px 4px; border-radius: 5px; background-color: #fff; display: inline-block;}
.delbtn:hover { padding: 2px 4px; border-radius: 5px; background-color: #fff; display: inline-block;}
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			<div class="container">

				<form role="form" method="post">
					<input value="${cno}" name="cno" type="hidden">
				</form>

		
				<div class="row">
					<div class="picTitle">
						<h6>
							사진올리기 <small>사진을 업로드합니다.</small>
						</h6>
					</div>
				</div>

				<div class="">
					<form class="form-group">
						<label>아이디</label> <input class="form-control" type="text"
							name="name" id="name" readonly="readonly" value="${login.mid}">
					</form>
				</div>

				<form id="myForm" action="sgallery_create?cno=${cno}" method="post">
					<div class="filebox">
						<input id="fileUpload" type="file">
		
						<div class="" >
							<ul class="clearfix uploadedList"></ul>
						</div>
				
						<input class="btn btn-primary form-control submit_form" value="업로드" id="submit_btn" type="submit">
					</div>
				
				</form>
				<a href="/crew/tab_gallery?cno=${cno}">
					<button class="btn btn-danger form-control list_btn" id="list_btn">뒤로가기</button>
				</a>

		
					<script id="source" type="text/x-handlebars-template"> 
						<li class="imgshow"> 
							<span><img class="imgsize" alt="첨부파일" src="{{imgsrc}}"></span> 
						    <div> 
						    	<a href="{{getLink}}">{{fileName}}</a> 
						    	<a href="{{sg_picture}}" class="delbtn"> 
						    	<span class="glyphicon glyphicon-remove-circle"></span> </a> 
						    </div> 
						</li> 
					</script>


				<script type="text/javascript">
					$(document).ready(function() {
						var source = $("#source").html();
						var template = Handlebars.compile(source);

						$("input[type=file]").change(function(event) {
							event.preventDefault();
							var files = event.target.files;
							var file = files[0];

							var formData = new FormData();
							formData.append("file",	file);
							
							$.ajax({
								type : 'post',
								url : '/uploadAjax',
								data : formData,
								dataType : 'text',
								processData : false,
								contentType : false,
								success : function(result) {
									var data = sGallery_getFileInfo(result);
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

								str += "<input value='"+$(".delbtn").attr("href")+"' name='sg_picture' type='hidden'>";
							
							if (!$('.imgshow').length) {
								alert("사진을 선택해주세요");
								return;
							} else if ($('.imgshow').length){
								form.append(str);
								form.get(0).submit();
								alert("사진이 업로드되었습니다.");
							}
						});
						 
						 
						 $("#list_btn").on("click", function() {
							return "redirect:/crew/tab_gallery?cno="+cno;
						});
							
						$(".uploadedList").on("click", "li div .delbtn", function(event) {
							event.preventDefault();
							var delBtn = $(this);
							var delLi = $(this).parent("div").parent("li");
							
							$.ajax({
								type:"post",
								url:"/deleteFile",
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

			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>