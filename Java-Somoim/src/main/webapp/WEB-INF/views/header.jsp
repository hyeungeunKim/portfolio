<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<header id="header">
	<c:if test="${login.power==1}">
		<a href="/setting/info">
			<div class="userCont">
				<span class="glyphicon glyphicon-th-list">	
				</span>
				<span>${login.mid}</span>
			</div>
		</a>
	</c:if>
	<c:if test="${login.power!=1}">
		<a href="/admin/manager">
			<div class="userCont">
				<span class="glyphicon glyphicon-th-list">	
				</span>
				<span>${login.mid}</span>
			</div>
		</a>
	</c:if>
	<a href="/search/search" class="searchCont">
		<div>
			<span class="glyphicon glyphicon-search"></span>
			<span>모임을 검색해보세요</span>
		</div>
	</a>
</header>

