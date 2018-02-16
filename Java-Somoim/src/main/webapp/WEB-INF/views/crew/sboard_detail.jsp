<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.navAct02 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
.show_img{	text-align: center; }
#show_re_content{ background-color: transparent; border: 0px; border-radius: 0px;}
.sboard_title:after { content:""; display: block; clear: both;}
.sboard_title span { vertical-align: middle;}
.sboard_left { float: left}
.sboard_right { float: right}
.detailTtile { font-size:18px; font-weight:bold; margin-bottom:5px;}
.detailName { font-size:14px; font-weight:bold;}
.detailDate { font-size:14px;}
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			
			<form role="form" method="post">
				<input value="${sBoardVO.cno}" name="cno" id="cno"  type="hidden">
				<input value="${sBoardVO.sb_no}" name="sb_no"  type="hidden" >
				<input value="${sBoardVO.sb_picture}" name="sb_picture"  id="sb_picture" type="hidden">
			</form>
			
			<div class="container">

				<div class="row">
					<div class="picTitle">
						<h6>
							게시글 상세보기
						</h6>
					</div>
				</div>

				<div class="">
					<div class="panel panel-warning">
						<div class="panel-heading sboard_title">
							
							<span class="detailTtile sboard_left"> ${sBoardVO.sb_title}</span>		
							<span class="sboard_right">
								<p class="detailName">${name}</p>
								<p class="detailDate">${sBoardVO.sb_writeday}</p>
							</span>
						</div> <!-- panel-heading -->
						<div class="panel-body">
											
							<div class="show_content"> ${sBoardVO.sb_content}</div>

								<c:set value="base" var="base">	</c:set>
								<c:if test="${sBoardVO.sb_picture != base}">
									<div class="show_img">
										<img src="/displayFile/sboard?fileName=${sBoardVO.sb_picture}" alt="사진있음">
									</div>
								</c:if>
					
							
						</div> <!-- panel-body -->
					</div> <!-- panel panel-warning -->
			
						<div class="form-group">
							<button type="submit" class="btn btn-primary" id="reply_form">
								<span class="glyphicon glyphicon-pencil"></span> 댓글
							</button>


						<c:if test="${login.mid == sBoardVO.mid}"> 
							<button type="submit" class="btn btn-warning" id="update_form">
								<span class="glyphicon glyphicon-edit"></span> 수정
							</button>
						
							
							<button type="submit" class="btn btn-danger" id="delete_form">
								<span class="glyphicon glyphicon-trash"></span> 삭제
							</button>
						</c:if>
						
							<button class="btn btn-info" id="tab_board_form">
								<span class="glyphicon glyphicon-align-justify"></span> 목록
							</button>
						</div> <!-- form-group -->
				</div> <!-- class="row" -->
				
					
				<!-- 댓글 작성 -->		
				<div class="row collapse" id="myCollapsible" >
					<div class="form-group">
						<label for="name">작성자 이름</label>
						<input id="name" class="form-control" value="${login.mid}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="re_content">내용</label>
						<input id="re_content" class="form-control">
					</div>
					<div class="form-group">
						<button id="replyInsertBtn" class="btn btn-default">등록</button>
						<button id="replyResetBtn"  class="btn btn-danger">초기화</button>
					</div>
				</div>
				
				
						
				<div id="replies" class="row jump">
					
				</div>
				
				<div class="row">
					<div data-backdrop="static" class="modal fade" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
								 	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								 		<span aria-hidden="true">&times;</span>
								 	</button>
								 	<div>
									 	re_no: <span id="modal_re_no"> </span>	
								 	</div>
								</div>
								<div class="modal-body">
									<p>내용을 수정하세요</p>
									<input class="form-control" id="modal_re_content">
								</div>
								<div class="modal-fotter" align="right">
									<button id="modal_update" type="button" class="btn btn-default" data-dismiss="modal">수정</button>
									<button id="modal_delete" type="button" class="btn btn-warning" data-dismiss="modal">삭제</button>
									<button id="modal_close" type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
					
					
			<script id="source" type="text/x-handlebars-template">
				{{#each.}}
					<div class="panel panel-info">
						<div class="panel-heading">
							<span>re_no: {{re_no}}, 작성자: <span class="glyphicon glyphicon-user"></span>{{mid}}</span>
							 <span class="pull-right"><span class="glyphicon glyphicon-time"></span> {{re_writeday}}</span>
						</div>
			
						<div class="panel-body input-group">
							<p data-re_no="{{re_no}}" id="show_re_content" class="input-group-addon">{{re_content}}</p>
						
						{{#checkMid mid}}
							<button class="btn btn-default btn-sm btn-group-addon pull-right callModal">
								<span class="glyphicon glyphicon-check"></span> 수정/삭제
								<span class="glyphicon glyphicon-trash"></span> </button>
						{{/checkMid}}				
							</div>
					</div>
				{{/each}}
			</script>
					
				

				<script type="text/javascript">
					$(document).ready(function() {
						
						var $form = $("form[role='form']");
						var sb_no = ${sBoardVO.sb_no};
						var cno = $("#cno").val();
						
						AllReplyLlst(cno, sb_no);
						
						
						Handlebars.registerHelper('checkMid', function(mid, options) {
							var loginMid = "${login.mid}";
							if(loginMid == mid){
								return options.fn(this);		
							} else {
								return options.inverse(this);
							}
						}); 
						
						$("#tab_board_form").on("click", function() {
							location.href = "/crew/tab_board?cno="+cno;
							
						});
						
						$("#delete_form").on("click", function() {
							var result = confirm("정말 삭제하시겠습니까?");
							if (!result) {	return false;	}
								$form.attr("method", "post");
								$form.attr("action", "/crew/sboard_delete"); //위에 들어가 있으므로 안해도 됨
								$form.submit();
						});
						
						$("#update_form").click(function() {
							$form.attr("action", "/crew/sboard_update");
							$form.attr("method", "get");
							$form.submit();
						});

						$("#reply_form").click(function() {
							$("#myCollapsible").collapse("toggle");
						});
						
					
						$("#replyInsertBtn").on("click", function() {
							var re_content = $("#re_content").val();
							
							$.ajax({
								type : "post",
								url : "/replies/sboard",
								data : {
									sb_no :sb_no,
									re_content : re_content
								},
								dataType : "text",
								success : function(result) {
									alert("댓글 입력 성공");
									$("#re_content").val("");
									$("#myCollapsible").collapse("toggle");
									AllReplyLlst(cno, sb_no);
								}
							});
						});
						
						
						$("#replies").on("click", ".callModal", function() {
							var re_no = $(this).prev("p").attr("data-re_no");
							var re_content = $(this).prev("p").text();
							
							$("#modal_re_no").text(re_no);
							$("#modal_re_content").val(re_content);
							
							$("#myModal").modal("show");
						});
						
						$("#modal_update").on("click", function() {
							var re_no = $("#modal_re_no").text();
							var re_content = $("#modal_re_content").val();
							
							$.ajax({
								type:"put",
								url: "/replies/"+re_no,
								headers: {
									"Content-Type":"application/json",
									"X-HTTP-Method-Override":"PUT"
								},
								dataType: "text",
								data: JSON.stringify({
									re_content:re_content
								}),
								success: function(result) {
									if(result=="UPDATE_SUCCESS"){
										alert("댓글 수정 성공");
										$("#myModal").modal("hide");
										AllReplyLlst(cno, sb_no);
									}
								}
							});
						});

						$("#modal_delete").on("click", function() {
							var re_no = $("#modal_re_no").html();
						
							$.ajax({
								type:"delete",
								url: "/replies/"+re_no,
								headers:{
									"Content-Type":"application/json",
									"X-HTTP-Method-Override":"DELETE"
								},
								dataType: "text",
								success: function(result) {
									if(result=="DELETE_SUCCESS"){
										alert("댓글 삭제 성공");
										$("#myModal").modal("hide");
										AllReplyLlst(cno, sb_no);
									}
								}
							});
						});
						
						
						function AllReplyLlst(cno, sb_no) {
							$.getJSON("/replies/sboard/"+cno+"/"+ sb_no, function(data) {
								var source = $("#source").html();
								var template = Handlebars.compile(source);
								var gab = data;
								$("#replies").html(template(gab));
							});
						}
					});
					
				</script>

			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>