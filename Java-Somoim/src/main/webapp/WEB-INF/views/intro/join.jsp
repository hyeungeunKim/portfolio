<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#header { display:none;}
	#footer { display:none;}
	#container { margin-bottom:0; padding-top:0;}
	.idcheck1 { display: none; color:blue;}
	.idcheck2 { display: none; color:red;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
			
		<div class="container">
			<form class="formLayout" action="/intro/join_post" method="post" name="joinform">
				<div class="terms form-group">
				
					<label>소모임 이용약관</label>
					<textarea rows="10" cols="100" class="textarea">
소모임 개인정보 취급방침 

(주)프렌즈큐브(이하 "회사")는 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.

본 개인 정보 보호 정책은 귀하의 정보에 관한 수집, 사용 및 정보 공개에 대한 회사의 정책과 절차를 설명합니다.

귀하는 본 서비스를 사용함으로서 정보의 수집, 전송, 조작, 저장, 공개 및 본 개인 정보 보호 정책에 명시된 귀하의 정보를 제공하는 것에 대해 동의하게 됩니다. 귀하의 거주 국가나 정보의 출처에 관계 없이, 귀하의 정보는 서비스가 운영되는 다른 모든 국가에서 사용될 수 있습니다. 

1. 수집하는 개인정보의 항목 및 수집방법

가. 수집하는 개인정보의 항목

첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.

이용자의 전화번호, 이용자의 전화기 주소록내에 저장된 제3자의 전화번호, 기기고유번호 (디바이스 아이디 또는 IMEI)

둘째, 서비스 이용과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.

소모임 서비스 이용자 이름, 사진, 생년월일, 지역, 성별, 아이디, 관심사, 소개문구, 가입한 모임, 홈페이주소, 페이스북주소, 트위터주소, 이메일주소, 트래픽 데이터, 쿠키, 방문 일시, 운영체제 정보, 서비스 이용 기록, 불량 이용 기록

나. 개인정보 수집방법

회사는 다음과 같은 방법으로 개인정보를 수집합니다.

- 소모임 프로그램을 실행 또는 사용함으로써 자동으로 수집

- 서비스 가입이나 사용 중 이용자의 자발적 제공을 통한 수집 

2.개인정보의 수집 및 이용 목적

가. 소모임 서비스 기본 기능의 제공

- 소모임은 무선네트워크 환경에서도 빠른 서비스를 제공하기 위해 회원의 공개된 정보를 자동으로 스마트폰에 캐싱하고 변경사항 또한 동기화합니다. 이를 원치 않으시면 소모임 서비스를 이용하시면 안됩니다.

- 회원이 변경 또는 삭제한 정보는 소모임 서버에 반영됩니다. 다만, 제 3자의 스마트폰 또는 모바일 디바이스에 캐싱된 정보는 변경 또는 삭제되지 않을 수 있습니다.

- 소모임은 이용자의 전화번호 및이용자의 전화기 내의 전화번호부에 저장되어 있는 제3자의 전화번호를 수집,이용하여 자동친구 등록같은 소모임의 서비스를 제공합니다. 또한 소모임 이용자의 가입시에 기기고유번호 (디바이스 아이디 또는 IMEI)를 수집하고 저장하여 이용자의 전화번호와 조합하여 개인식별을 위한 소모임 계정으로 사용하게 됩니다.

- 소모임은 다른 사람들을 쉽게 찾고 교류할 수 있도록 설계되었습니다. 이 때문에 회원님의 모든 프로필 정보는 누구에게나 공개되고 검색, 추천될 수 있습니다. 공개하는 것이 불편한 하거나 노출에 위험이 있는 내용은 프로필에 등록하지 않으셔야 합니다.

- 소모임은 사용자들 간에 서로 추천을 주고 받기 위해 디바이스에 캐싱된 다른 회원의 공개된 정보를 검색하여 서버로 전송할 수 있습니다.

나. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

유료 서비스 및 컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심

다. 회원관리

회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 불량회원(소모임 운영수칙을 위반하여 계약해지된 영구이용정지 회원)의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 법령이나 이용약관을 위반하여 발생하는 분쟁 조정을 위한 기록보존, 불만처리 등, 고지사항 전달

라. 신규 서비스 개발 및 마케팅·광고 활용

신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 회원의 서비스 이용에 대한 통계와 분석 

3. 개인정보의 보호 및 제공

- 회사는 이용자가 별도로 동의하지 않는 경우를 제외하고는 이용자의 개인정보를 위에서 언급한 목적 범위를 초과하여 이용하거나 제3자에게 제공 또는 공유하지 않습니다. 다만, 아래의 경우는 예외로 합니다.

가. 서비스에 제3자의 서비스가 연결되어 제공될 경우 회사는 서비스 이용을 위해 필요한 범위 내의 제공에 대하여 이용자의 동의를 얻은 경우

나. 법령의 규정에 의거 하거

나. 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 

4. 개인정보의 취급위탁

- 온라인 결제서비스 제공을 위해 전자금융업자가 공급하는 전산솔루션과의 연동 및 관리에 필요한 전산시스템 제공 : (주)시옷 

5. 개인정보의 보유 및 이용기간

이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

가. 회사 내부 방침에 의한 정보보유 사유

- 부정이용기록

보존 이유 : 부정 이용 방지

보존 기간 : 1년

나. 관련법령에 의한 정보보유 사유

상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.

- 계약 또는 청약철회 등에 관한 기록

보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률

보존 기간 : 5년

- 대금결제 및 재화 등의 공급에 관한 기록

보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률

보존 기간 : 5년

- 소비자의 불만 또는 분쟁처리에 관한 기록

보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률

보존 기간 : 3년

- 본인확인에 관한 기록

보존 이유 : 정보통신망 이용촉진 및 정보보호 등에 관한 법률

보존 기간 : 6개월

- 방문에 관한 기록

보존 이유 : 통신비밀보호법

보존 기간 : 3개월 

6. 개인정보 파기절차 및 방법

이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다.

가. 파기절차

- 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.

- 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.

나. 파기방법

- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.

- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 

7. 이용자의 권리 보호

- 이용자(만 14세 미만의 아동인 경우 법정대리인는 언제든지 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.

- 이용자(만 14세 미만의 아동인 경우 법정대리인)의 개인정보 조회, 수정을 위해서는 서비스내 "내 프로필" 변경을, 가입해지를 위해서는 서비스내 "탈퇴하기"를 클릭하여 직접 탈퇴가 가능합니다.

- 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.

- 회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "5. 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다. 

8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항

- 회사는 계정정보를 생성하기 위해 이용자가 소모임 프로그램을 실행시 기기식별번호 (디바이스 아이디 또는 IMEI)를 자동으로 수집하게 됩니다. 또한 친구자동등록의 기본기능을 제공하기 위하여 이용자의 전화기 내의 전화번호부에 저장되어 있는 제3자의 전화번호를 자동으로 수집하게 됩니다.

- 이용자가 기기식별번호를 자동으로 수집하는 것을 거부하는 경우 서비스를 이용할 수 없습니다. 

9. 고지의 의무

회사는 법률이나 서비스의 변경사항을 반영하기 위한 목적 등으로 개인정보 취급 방침을 수정할 수 있습니다. 개인정보취급방침의 내용 추가, 삭제 및 수정이 있을 시에는 시행일자 최소 7일전부터 회사의 웹사이트 http://friendscube.com 및 소모임 서비스내 "공지사항" 을 통해 고지할 것입니다. 

10. 개인정보관리책임자 및 담당자의 연락처

귀하께서는 회사의 서비스를 이용하시면서 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사의 고객센터 이메일 : help@friendscube.com로 문의해주시면 신고사항에 대해 충분한 답변을 드리기 위해 최선을 다하겠습니다. 
- 개인정보 관리책임자

이름 : 김영민

직위 : 대표이사

소속 : 프렌즈큐브

연락처 : 고객센터 

11. 개인정보취급방침의 개정과 그 공지

- 현 개인정보취급방침이 추가 및 삭제, 수정이 있을 시에는 시행 7일 전에 서비스 내 공지 또는 웹사이트를 통해 사전 공지하며, 사전 공지가 곤란한 경우 지체 없이 공지할 수 있습니다. 이 정책은 아래 시행일자부터 시행됩니다.

- 시행일: 2017년 03월 13일 

					</textarea>
				
					<input type="checkbox" name="terms_ok" id="terms_ok"> 
					<label for="terms_ok">위 이용약관에 동의합니다 </label>
				</div>
				<br>
				
				
				<div class="form-group">
					<label class="">이름</label>
					<input class="form-control" type="text" name="name" id="name" placeholder="본인이름">
				</div>
				<div class="form-group">
					<label class="">성별</label>
					<div class="checkbox">
						<label for="gender1">남성</label><input type="radio" name="gender" id="gender1" value="1" checked="checked">
						<label for="gender2">여성</label><input type="radio" name="gender" id="gender2" value="2">
					</div>
				</div>
				
				<div class="form-group">
					<label>아이디</label>
					<div class="input-group">
						<input class="form-control" name="mid" id="mid">
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary checkID">아이디 중복확인</button>
						</span>
					</div>
					<div class="idcheck1 idcheck">사용가능한 아이디 입니다.</div>
					<div class="idcheck2 idcheck">다른아이디를 사용해주세요.</div>
				</div>
				
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" name="password" type="password">
				</div>
				
				<div class="form-group">
					<label>비밀번호 확인</label>
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
						<button class="col-sm-6 form-control btn btn-primary" id="joinBtn" type="button" onclick="javascript:writeCheck()">회원가입</button>
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
		
		
		var check = 0;
		
		// 폼체크
		function writeCheck() { 
			
			// 폼을 변수에 담는다
			var form = document.joinform;
			
			if( !form.terms_ok.checked )  { 
				alert( "이용약관에 동의해주세요." ); 
				form.terms_ok.focus();
		   		return ;
			} 
			
			if( !form.name.value )  { 
				alert( "이름를 입력해주세요" ); 
				form.name.focus();
		   		return ;
			} 
			
			if( !form.mid.value )  { 
				alert( "id를 입력해주세요" ); 
				form.mid.focus();
		   		return ;
			} 
			
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
			
			if( check == 1 ) { 
				alert( "아이디 중복을 확인해주세요." ); 
				form.mid.focus(); 
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
		
		
		
		
		// 아이디체크
		$(".checkID").click(function() {
			
			$.ajax({
				url : "/intro/midcheck",
				type : "post",
				data : $("form").serialize(),
				success : function isID(data) {
				
				    if(data.mid != null){
				    	$(".idcheck").hide();
						$(".idcheck2").css("display","block");	// 다른 아이디를 사용해주세요.
						check = 1;
				    } else {
				    	$(".idcheck").hide();
						$(".idcheck1").css("display","block");	// 사용가능한 아이디입니다.
						check = 0;
				    }
				    console.log(check);
				
				},
				error : function(error) {
					alert(error.statusText);
				}
			});
			return false;
		});
		
		

		$(document).ready(function(){

			// 버튼제어
			$("#backBtn").on("click", function() {
				self.location="/intro/login";
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
