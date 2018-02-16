<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    



<nav id="footer">
	<ul class="nav">
		<li class="navAct01">
			<a href="/around/member_info">
				<div class="btn_list">
					<span class="glyphicon glyphicon-home btn_ico"></span>
					<span class="btn_txt">홈</span>
				</div>
			</a>
		</li>
		<li class="navAct02">
			<a href="/crew/list">
				<div class="btn_list">
					<span class="glyphicon glyphicon-search btn_ico"></span>
					<span class="btn_txt">소모임</span>
				</div>
			</a>
		</li>
		<li class="navAct03">
			<a href="/my/mylist">
				<div class="btn_list">
					<span class="glyphicon glyphicon-comment btn_ico"></span>
					<span class="btn_txt">내모임</span>
				</div>
			</a>
		</li>
		<li class="navAct04">
			<c:if test="${login.power==1}">
				<a href="/setting/info">
					<div class="btn_list">
						<span class="glyphicon glyphicon-cog btn_ico"></span>
						<span class="btn_txt">설정</span>
					</div>
				</a>
			</c:if>
			<c:if test="${login.power!=1}">
				<a href="/admin/manager">
					<div class="btn_list">
						<span class="glyphicon glyphicon-cog btn_ico"></span>
						<span class="btn_txt">설정</span>
					</div>
				</a>
			</c:if>
		</li>
	</ul>
</nav>


