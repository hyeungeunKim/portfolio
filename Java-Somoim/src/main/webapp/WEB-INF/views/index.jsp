<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../resources/css/common.css?ver='modifiedTimeStamp'" type="text/css">
	<link rel="stylesheet" href="../resources/css/content.css?ver='modifiedTimeStamp'" type="text/css">
	<link rel="stylesheet" href="../resources/bs/css/bootstrap.min.css?ver='modifiedTimeStamp'" type="text/css">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script>
	<script src="../resources/js/jquery.js" type="text/javascript"></script>
	<script src="../resources/bs/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../resources/dist/js/bootstrap-select.min.js" ></script>
	
	<script src="../resources/js/upload.js" type="text/javascript"></script> 
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script> 
	<title>Somoim</title>
</head>
<body>	
	
	<!-- 공통 Layout -->
	<div id="common">
		<!-- header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- footer -->
		<jsp:include page="nav.jsp"></jsp:include>
	</div>
	
	<!-- Web Layout -->
	<div id="web">
		<jsp:include page="web/web.jsp"></jsp:include>
	</div>
	
</body>
</html>