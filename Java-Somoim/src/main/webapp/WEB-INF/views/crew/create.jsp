<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct02 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
	
	.formLayout textarea { min-height:200px }
	.fileDrop{
		width:100%;
		height:100px;
		border: 1px dotted gray;
		background-color: gainsboro;
		margin: auto;
	}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="container">
			<div class="row">
				<div class="picTitle">
					<h6>
						소모임개설 <small>소모임을 개설해주세요.</small>
					</h6>
				</div>
			</div>
			<div class="row">
				<form id="myForm" action="/crew/create" method="post" class="formLayout">
					
					<div class="form-group">
						<label for="title">소모임명</label>
						<input name="title" id="title" class="form-control">
					</div>	
					
					<div class="form-group">
						<label for="mid">개설자</label>
						<input value="${login.mid}" name="mid" id="mid" class="form-control" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="content">소모임소개</label>
						<textarea name="content" id="content" class="form-control"></textarea>
					</div>
					
					<div class="form-group">
						<label for="region">소모임지역</label>
						<div class="input-control">
							<select name="region" id="region">
								<option value="">시/도</option>
							</select>
							<!-- <select name="address" id="gugun1"></select> -->
						</div>
					</div>
					
					<div class="form-group">
						<label for="attend_cnt">소모임 인원</label>
						<div class="input-group">
						     <select name="attend_cnt" id="attend_cnt">
						     	<option value="">최대인원</option>
						        <%for(int i=1; i<=20; i++){ %>
						        <option value="<%=i %>"><%=i %></option>
						        <%} %>
						     </select>
						</div>
						
					</div>
					
					<div class="form-group">
					
						<label>카테고리 선택</label>
						<div class="input-group cateGoup">
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
					
					<div class="row">
						<ul class="clearfix uploadedList">
						
						</ul>
					</div>
				
					<script id="source" type="text/x-handlebars-template">
	<li class="col-xs-3 imgshow">
		<span>
			<img alt="첨부파일" src="{{imgsrc}}">
		</span>
		<div>
			<a href="{{getLink}}">{{fileName}}</a>
			<a href="{{picture}}" class="btn btn-default btn-xs pull-right delbtn">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</a>
		</div>
	</li>
	</script>
				
					<div class="filebox form-group text-right">
						<input id="fileUpload" type="file" id="file">
						<button class="btn btn-primary" type="submit" id="submit_form">
							<span class="glyphicon glyphicon-check"></span> 등록
						</button>
						<button class="btn btn-info" type="button" id="list_form">
							<span class="glyphicon glyphicon-list"></span> 목록
						</button>
					</div>
				
				</form>

			</div>	

		</div>
	
	</div>
</div>
		
			
		<script type="text/javascript">
			$(document).ready(function() {
		
			// 사진첨부
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
						url : '/uploadAjax/crew',
						data : formData,
						dataType : 'text',
						processData : false,
						contentType : false,
						success : function(result) {
							var data = crew_getFileInfo(result);
							var ht = template(data);
							
							console.log(ht);
							
							$(".uploadedList").html(ht);
						}
					});
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
		
		// 소모임지역
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
		
		$("select[name^=region]").each(function() {
			$selsido = $(this);
			$.each(eval(area0), function() {
				$selsido.append("<option value='"+this+"'>"+this+"</option>");
			});
			$selsido.next().append("<option value=''>구/군 선택</option>");
		});

	});
	
	// 체크박스 하나만 선택
	function check_only(chk){
        var obj = document.getElementsByName("category");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
		
	
	$("#submit_form").on("click",function(event){

		event.preventDefault();
		var files = event.target.files; 
		var formData = new FormData();
		formData.append("file",	files);

		var form = $("#myForm");
		var str = "";

			str += "<input value='"+$(".delbtn").attr("href")+"' name='picture' type='hidden'>";
	
		if (!$('.imgshow').length) {
			alert("사진을 선택해주세요");
			return;
		} else if ($('.imgshow').length){
			form.append(str);
			form.get(0).submit();
			alert("소모임이 개설되었습니다.");
		}
	});
	
	$("#list_form").click(function() {
		location.href="/crew/list";
	});

</script>
</body>
</html>
