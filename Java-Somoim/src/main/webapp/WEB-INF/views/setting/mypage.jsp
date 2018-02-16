<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct04 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
			
		<div class="container">
			<form class="formLayout" action="/setting/member_update" method="post" name="joinform">
			
				<input type="hidden" value="${login.mid}" name="mid">

				<div class="form-group">
					<label class="">이름</label>
					<input class="form-control" type="text" name="name" id="name" readonly="readonly" value="${login.name}">
				</div>
				<div class="form-group">
					<label class="">성별</label>
					<div class="checkbox">
						<label for="gender1">남성</label><input type="radio" name="gender" id="gender1" value="1" checked="checked">
						<label for="gender2">여성</label><input type="radio" name="gender" id="gender2" value="2">
					</div>
				</div>
				
				<div class="form-group">
					<label>비밀번호 변경</label>
					<input class="form-control" name="password" type="password">
				</div>
				
				<div class="form-group">
					<label>비밀번호 변경 확인</label>
					<input class="form-control" name="rePassword" type="password">
				</div>
	
				<div class="form-group">
					<label>생년월일</label>
					<div class="row">
						<div class="col-sm-12">
							 <select name="birth1">
							 	<option value="">년도</option>
						        <%for(int i=2017; i>=1900; i--){ %>
						        <option value="<%=i %>"><%=i %></option>
						        <%} %>
						     </select>년&nbsp;
						     <select name="birth2">
						     	<option value="">월</option>
						        <%for(int i=1; i<=12; i++){ %>
						        <option value="<%=i %>"><%=i %></option>
						        <%} %>
						     </select>월
						     <select name="birth3">
						     	<option value="">일</option>
						        <%for(int i=1; i<=31; i++){ %>
						        <option value="<%=i %>"><%=i %></option>
						        <%} %>
						     </select>
						 </div>
					</div>
				</div>
				
				<div class="form-group">
					<label>거주지역</label>
					<div class="input-control">
						<select name="address" id="sido1">
							<option value="">시/도</option>
						</select>
						<!-- <select name="address" id="gugun1"></select> -->
					</div>
				</div>
				
				
				<div class="form-group">
					<label>핸드폰번호</label>
					<div class="input-control">
						<select id="txtMobile1" name="phone1">
						    <option value="">선택</option>
						    <option value="010">010</option>
						    <option value="011">011</option>
						    <option value="016">016</option>
						    <option value="017">017</option>
						    <option value="019">019</option>
						</select>
						-
						<input type="tel" name="phone2" id="txtMobile2" size="4" maxlength="4"  />
						-
						<input type="tel" name="phone3" id="txtMobile3" size="4" maxlength="4"  />
					</div>
				</div>
				
				<div class="form-group">
					<label>관심사</label>
					<div class="input-group">
						<input type="checkbox" name="category" value="아웃도어/여행" id="check1" onclick="check_only(this)"><label for="check1" onclick="check_only(this)">아웃도어/여행</label> 
						<input type="checkbox" name="category" value="운동/스포츠" id="check2" onclick="check_only(this)"><label for="check2" onclick="check_only(this)">운동/스포츠</label>
						<input type="checkbox" name="category" value="인문학/책/글" id="check3" onclick="check_only(this)"><label for="check3" onclick="check_only(this)">인문학/책/글</label> 
						<input type="checkbox" name="category" value="외국/언어" id="check4" onclick="check_only(this)"><label for="check4" onclick="check_only(this)">외국/언어</label>
						<input type="checkbox" name="category" value="문화/공연" id="check5" onclick="check_only(this)"><label for="check5" onclick="check_only(this)">문화/공연</label> 
						<input type="checkbox" name="category" value="음악/악기" id="check6" onclick="check_only(this)"><label for="check6" onclick="check_only(this)">음악/악기</label> 
						<input type="checkbox" name="category" value="공예/만들기" id="check7" onclick="check_only(this)"><label for="check7" onclick="check_only(this)">공예/만들기</label> 
						<input type="checkbox" name="category" value="댄스/무용" id="check8" onclick="check_only(this)"><label for="check8" onclick="check_only(this)">댄스/무용</label> 
						<input type="checkbox" name="category" value="봉사활동" id="check9" onclick="check_only(this)"><label for="check9" onclick="check_only(this)">봉사활동</label> 
						<input type="checkbox" name="category" value="사교/인맥" id="check10" onclick="check_only(this)"><label for="check10" onclick="check_only(this)">사교/인맥</label> 
						<input type="checkbox" name="category" value="차/오토바이" id="check11" onclick="check_only(this)"><label for="check11" onclick="check_only(this)">차/오토바이</label> 
						<input type="checkbox" name="category" value="사진" id="check12" onclick="check_only(this)"><label for="check12" onclick="check_only(this)">사진</label> 
						<input type="checkbox" name="category" value="야구관람" id="check13" onclick="check_only(this)"><label for="check13" onclick="check_only(this)">야구관람</label> 
						<input type="checkbox" name="category" value="게임/오락" id="check14" onclick="check_only(this)"><label for="check14" onclick="check_only(this)">게임/오락</label> 
						<input type="checkbox" name="category" value="요리/제조" id="check15" onclick="check_only(this)"><label for="check15" onclick="check_only(this)">요리/제조</label> 
						<input type="checkbox" name="category" value="반려동물" id="check16" onclick="check_only(this)"><label for="check16" onclick="check_only(this)">반려동물</label> 
						<input type="checkbox" name="category" value="가족/결혼" id="check17" onclick="check_only(this)"><label for="check17" onclick="check_only(this)">가족/결혼</label> 
						<input type="checkbox" name="category" value="자유주제" id="check18" onclick="check_only(this)"><label for="check18" onclick="check_only(this)">자유주제</label> 
					</div>
				</div>
				
				<div class="form-group clearfix">
					
					<div class="col-xs-6 col-sm-6">
						<button class="col-sm-6 form-control btn btn-primary" id="joinBtn" type="button" onclick="javascript:writeCheck()">수정</button>
					</div>
					<div class="col-xs-6 col-sm-6">
						<button class="col-sm-6 form-control btn btn-danger" id="backBtn" type="button">뒤로가기</button>
					</div>
					
				</div>
			</form>
		</div>
	</div>
</div>
	<script type="text/javascript">
		
		
		// 폼체크
		function writeCheck() { 
			
			// 폼을 변수에 담는다
			var form = document.joinform;
			
			if( !form.password.value )  { 
				alert( "비밀번호를 입력해주세요" ); 
				form.password.focus();
		   		return ;
			} 
			
			if( !form.rePassword.value ) { 
				alert( "비밀번호 체크를 입력해주세요" ); 
				form.rePassword.focus(); 
				return ; 
			} 
			
			if ( form.password.value != form.rePassword.value ){
				alert( "비밀번호를 동일하게 입력하세요" ); 
				form.rePassword.focus();
		   		return ;
			}
			
			if( !form.birth1.value ) { 
				alert( "년도를 선택하세요." ); 
				form.birth1.focus(); 
				return ; 
			} 
			
			if( !form.birth2.value ) { 
				alert( "월을 선택하세요." ); 
				form.birth2.focus(); 
				return ; 
			} 
			
			if( !form.birth3.value ) { 
				alert( "일자를 선택하세요." ); 
				form.birth3.focus(); 
				return ; 
			}
			
			if( !form.address.value ) { 
				alert( "거주지역을 선택하세요." ); 
				form.address.focus(); 
				return ; 
			} 
			
			if( !form.phone1.value ) { 
				alert( "휴대번호 앞자리를 선택해주세요." ); 
				form.phone1.focus(); 
				return ; 
			}
			
			if( !form.phone2.value && form.phone2.value.length != 4 ) { 
				alert( "휴대번호를 4자리에 맞춰 입력하세요." ); 
				form.phone2.focus(); 
				return ; 
			}
			
			if( !form.phone3.value && form.phone3.value.length != 4 ) { 
				alert( "휴대번호를 4자리에 맞춰 입력하세요." ); 
				form.phone3.focus(); 
				return ; 
			}

			form.submit(); 
		}
		
		// 체크박스 하나만 선택
		function check_only(chk){
	        var obj = document.getElementsByName("category");
	        for(var i=0; i<obj.length; i++){
	            if(obj[i] != chk){
	                obj[i].checked = false;
	            }
	        }
	    }

		$(document).ready(function(){

			// 버튼제어
			$("#backBtn").on("click", function() {
				self.location="/setting/info";
			});
			
			// 거주지역
			var area0 = ["서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
			var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
			var area3 = ["대덕구","동구","서구","유성구","중구"];
			var area4 = ["광산구","남구","동구",     "북구","서구"];
			var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
			var area6 = ["남구","동구","북구","중구","울주군"];
			var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
			var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
			var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
			var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
			var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
			var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
			var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
			var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
			var area16 = ["서귀포시","제주시","남제주군","북제주군"];
			
			$("select[name^=address]").each(function() {
				$selsido = $(this);
				$.each(eval(area0), function() {
					$selsido.append("<option value='"+this+"'>"+this+"</option>");
				});
				$selsido.next().append("<option value=''>구/군 선택</option>");
			});
			
			/* $("select[name^=address]").change(function() {
				var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
				var $gugun = $(this).next(); // 선택영역 군구 객체
				$("option",$gugun).remove(); // 구군 초기화
				if(area == "area0")
					$gugun.append("<option value=''>구/군 선택</option>");
				else {
					$.each(eval(area), function() {
						$gugun.append("<option value='"+this+"'>"+this+"</option>");
					});
				}
			}); */

		}); 

	</script>	
</body>
</html>
