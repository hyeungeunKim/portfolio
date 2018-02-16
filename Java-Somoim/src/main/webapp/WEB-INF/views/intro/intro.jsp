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
	#container { min-height:100%; height:100%; margin-top:0; margin-bottom:0; background-color:#493334; }
	#container div { display:flex; height:100%; justify-content:center; align-items:center; font-size:60px; color:#ffffff;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div>
			So,Moim
		</div>
	</div>
	<script type="text/javascript">
	$('document').ready(function() {
		window_onload();
	});
	
	function window_onload(){
	       setTimeout('go_url()',1000)  // 5초후 go_url() 함수를 호출한다.
	    }
	 
		function go_url(){
		   location.href="/intro/login"  // 페이지 이동...
		}
	</script>
</div>
	
</body>
</html>
