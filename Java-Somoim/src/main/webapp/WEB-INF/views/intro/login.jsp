<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	html, body, #mobile { height:100%; }
	#header { display:none}
	#footer { display:none}
	#container { min-height:100%; height:100%; padding-top:0; margin-bottom:0;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="container">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 loginBox">
				
				<form class="form-horizontal login_form" method="post">
				
					<div class="form-group">
						<label class="col-xs-2 control-label" for="id">ID</label>
						<div class="col-xs-10 id_form">
							<input class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요">
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-xs-2 control-label" for="upw">PW</label> 
						<div class="col-xs-10 upw_form">
							<input class="form-control" name="password" id="password" type="password" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
	
					<div class="form-group">
						<div class="col-xs-12">
						<button class="btn bnt-danger pull-right" id="joinBtn" type="button">회원가입</button>
						<button class="btn btn-default pull-right" id="loginBtn" type="submit">로그인</button>
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
			self.location="/intro/join";
		});
		$("#loginBtn").on("click", function() {
			$form.attr("method", "POST");
			$form.attr("action", "/intro/login_post");
			$form.submit();
		});
		

	</script>
</div>
	
</body>
</html>
