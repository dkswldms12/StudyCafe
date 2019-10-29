<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>

		 <div class="modal-dialog" style="background-color: #ffffff"> 
			<div class="modal-body">
         <form role="form" action="./loginup.do" method="post">
          <div class="form-group">
              <label for="id">아이디</label>
              <input type="text" class="form-control" value="${dto.gid}" name="gid" id="gid" placeholder="아이디를 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="InputPassword">비밀번호</label>
              <input type="password" class="form-control" name="gpasswd" id="gpasswd" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" value="${dto.gname}" id="gname" name="gname" placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="gender">성별</label>
              <select id="ggender" name="ggender">
						<option value="A1">남자</option>
						<option value="A2">여자</option>
             </select>
            </div>
            <div class="form-group">
              <label for="birth">생년월일</label>
              <input type="text" class="form-control" value="${dto.gbirth}" name="gbirth" id="gbirth" placeholder="생년월일을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="phone">전화번호</label>
              <input type="text" class="form-control" value="${dto.gphone}" id="gphone" name="gphone" placeholder="전화번호를 입력해 주세요">
            </div>
             <div class="form-group">
              <label for="InputEmail">이메일</label>
              <input type="email" class="form-control" value="${dto.gemail}" id="gemail" name="gemail" placeholder="이메일 주소">
            </div>
            <div class="form-group">
              <label for="addr1">우편번호</label>
              <input type="text" class="form-control" value="${dto.gaddr1}" id="gaddr1" name="gaddr1" size="10" readonly="readonly">
              <input type="button" class="btn btn-info" value="주소찾기" onclick="DaumPostcode()">
            </div>
             <div class="form-group">
              <label for="addr2">주소1</label>
              <input type="text" class="form-control" value="${dto.gaddr2}" id="gaddr2" name="gaddr2" size="45" readonly="readonly">
            </div>
            <div class="form-group">
              <label for="addr3">주소2</label>
              <input type="text" class="form-control" value="${dto.gaddr3}" id="gaddr3" name="gaddr3" size="45" placeholder="상세주소">
            </div>

			<div class="form-group text-center">
			<input type="submit" class="btn btn-info" value="수정완료"/>
              <input type="button" class="btn btn-warning" value="수정취소" onclick="window.location.href='./create.do'">
            </div> 
            
        	 <div id="wrap" style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
							<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
								id="btnFoldWrap"
								style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
								onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>

						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
							// 우편번호 찾기 화면을 넣을 element
							var element_wrap = document.getElementById('wrap');

							function foldDaumPostcode() {
								// iframe을 넣은 element를 안보이게 한다.
								element_wrap.style.display = 'none';
							}

							function DaumPostcode() {
								// 현재 scroll 위치를 저장해놓는다.
								var currentScroll = Math.max(
										document.body.scrollTop,
										document.documentElement.scrollTop);
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 각 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var fullAddr = data.address; // 최종 주소 변수
												var extraAddr = ''; // 조합형 주소 변수

												// 기본 주소가 도로명 타입일때 조합한다.
												if (data.addressType === 'R') {
													//법정동명이 있을 경우 추가한다.
													if (data.bname !== '') {
														extraAddr += data.bname;
													}
													// 건물명이 있을 경우 추가한다.
													if (data.buildingName !== '') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
													fullAddr += (extraAddr !== '' ? ' ('
															+ extraAddr + ')'
															: '');
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('gaddr1').value = data.zonecode; //5자리 새우편번호 사용
												document
														.getElementById('gaddr2').value = fullAddr;

												// iframe을 넣은 element를 안보이게 한다.
												// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
												element_wrap.style.display = 'none';

												// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
												document.body.scrollTop = currentScroll;

												$('#gaddr3').focus();
											},
											// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
											onresize : function(size) {
												element_wrap.style.height = size.height
														+ 'px';
											},
											width : '100%',
											height : '100%'
										}).embed(element_wrap);

								// iframe을 넣은 element를 보이게 한다.
								element_wrap.style.display = 'block';
							}
						</script>  
						</form> 
					</div>
				</div>
						
<%@ include file="../footer.jsp" %>