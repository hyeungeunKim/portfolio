<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	html, body, #mobile { height:100%; }
	#header { display:none}
	#footer { display:none}
	#container { min-height:100%; height:100%; margin-top:0; margin-bottom:0;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".backBtn").click(function(){
			history.back();
		});
		$(".homeBtn").click(function(){
			self.location="/around/member_info"
		});
		
	});
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="container">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 loginBox">
				
				<form class="form-horizontal login_form" action="/user/loginPost" method="post">
				
					<div class="form-group">
						<div class="col-xs-12 text-center">
							<img src="../resources/img/mobile/warring_ico.png" alt="" width="60px;" height="auto">
						</div>
					</div>
	
					<div class="form-group text-center">
						<div class="col-xs-12">죄송합니다. 페이지에 문제가 있거나 페이지가 만료되었습니다.</div>
					</div>
	
					<div class="form-group">
						<div class="col-xs-12">
						<button class="btn bnt-danger pull-right" id="homeBtn" type="submit">홈으로</button>
						<button class="btn btn-default pull-right" id="backBtn" type="submit">이전 화면</button>
						</div>
					</div>
				
				</form>
			</div>
		</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		// 로그인창 레이아웃
		var width=$("div.container").innerWidth();
		var height=window.innerHeight;
		var h = $(".row").innerHeight();
		$(".row").css("margin-top", height/2-h/2);
		
		// 폼 버튼제어
		var $form = $(".login_form");
		$("#joinBtn").click(function() {
			$form.attr("action", "/intro/join");
			$form.attr("method", "get");
			$form.submit();
		});
		$("#loginBtn").on("click", function() {
			$form.attr("method", "get");
			$form.attr("action", "/intro/login");
			$form.submit();
		});
		

	</script>
</div>
	
</body>
</html>
