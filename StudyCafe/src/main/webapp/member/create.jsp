<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="modal-dialog" style="background-color: #ffffff">
	 
	<div class="modal-body">
		<form role="form" action="./create.do" method="post">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					name="gid" id="gid" placeholder="아이디를 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="InputPassword1">비밀번호</label> <input type="password"
					class="form-control" name="gpasswd" id="gpasswd" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label for="username">이름</label> <input type="text"
					class="form-control" id="gname" name="gname"
					placeholder="이름을 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="gender">성별</label>
				<select name="ggender" id="ggender">
					<option value="A1" selected>남자</option>
					<option value="A2">여자</option>
				</select>
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label> <input type="text"
					class="form-control" name="gbirth" id="gbirth"
					placeholder="생년월일을 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label> <input type="text"
					class="form-control" id="gphone" name="gphone"
					placeholder="전화번호를 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="InputEmail">이메일</label> <input type="email"
					class="form-control" id="gemail" name="gemail" placeholder="이메일 주소">
			</div>
			<div class="form-group">
				<label for="addr1">우편번호</label> <input type="text"
					class="form-control" id="gaddr1" name="gaddr1" size="10"
					readonly="readonly"> <input type="button"
					class="btn btn-info" value="주소찾기" onclick="DaumPostcode()">
			</div>
			
			<div id="wrap"
				style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
				<img
					src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
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
					var currentScroll = Math.max(document.body.scrollTop,
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
												+ extraAddr + ')' : '');
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('gaddr1').value = data.zonecode; //5자리 새우편번호 사용
									document.getElementById('gaddr2').value = fullAddr;

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
			
			<div class="form-group">
				<label for="addr2">주소1</label> <input type="text"
					class="form-control" id="gaddr2" name="gaddr2" size="45"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="addr3">주소2</label> <input type="text"
					class="form-control" id="gaddr3" name="gaddr3" size="45"
					placeholder="상세주소">
			</div>

			<div class="form-group">
				<label for="agree">약관 동의</label><br /> 
				<input type="button"
					class="btn btn-info" data-toggle="collapse" data-target="#agree"
					value="약관 보기">
				<div id="agree" class="collapse">
					
				<div class="col-xs-12">
					<div style="text-align: center">
						<h4>약관 동의서</h4>
					</div>
				<textarea class="form-control" cols="100" rows="10" readonly>
[제 1 장 총 칙]
 
제 1 조 (목적) 
이 약관은 전기통신사업법령 및 정보통신망이용촉진등에 관한 법령에 의하여 강진완도축산농협법인이 제공하는 인터넷 커뮤니티 서비스 (이하 "서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함
을 목적으로 합니다.
 
제 2 조 (약관의 공지 및 준용) 
①이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생 합니다. 
②회사는 이 약관을 임의로 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.
 
제 3 조 (약관 외 준칙) 
이 약관에 명시되지 않은 사항은 전기통신기본법,전기통신사업법, 정보통신망이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.
 
제 4 조 (용어의 정의) 
이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 
①회원 : 회사와 서비스 이용계약을 체결하고 이용자 아이디를 부여받은 자
②아이디(ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합 
③비밀번호 : 회원의 비밀 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합 
④운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 
⑤해지 : 회사 또는 회원이 서비스 개통 후 이용계약을 해약 하는 것
 
[제 2 장 서비스 이용계약]
 
제 5 조 (이용계약의 성립) 
①"위의 이용약관에 동의하여 이용계약을 신청하십니까?" 라는 이용신청시의 물음에 회원이 "동의함" 단추를 누르면 이 약관에 동의하는 것으로 간주됩니다. 
②이용계약은 회원의 이용신청에 대하여 회사가 심사 후 승낙함으로써 성립합니다.
 
제 6 조 (이용신청) 
①이용신청은 온라인으로 회사 소정의 가입신청 양식에서 요구하는 사항을 기록하여 신청합니다. 
②온라인 가입신청 양식에 기재하는 모든 회원 정보는 실제 데이터인 것으로 간주하며 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스 사용의 제한을 받을 수 있습니다.
제 7 조 : 회원정보 사용에 대한 동의
①회원의 개인 정보에 대해서는 강진완도축산농협법인의 개인정보보호정책이 적용됩니다.
②회사가 제6조에 따라 신청서에 기재를 요구하는 회원의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을 위한 목적으로 이용합니다. 
③회원이 회사 및 회사와 제휴한 서비스들을 편리하게 이용할 수 있도록 하기 위해 회원 정보는 회사와 제휴한 업체에 제공될 수 있습니다. 단, 회사는 회원 정보 제공 이전에 제휴 업체, 제공 목적, 제공할 회원 정보의 내용 등을 사전에 공지하고 회원의 동의를 얻어야 합니다. 
④회원은 회원정보 수정을 통해 언제든지 개인 정보에 대한 열람 및 수정을 할 수 있습니다.
⑤회원이 이용신청서에 회원정보를 기재하고, 회사에 본 약관에 따라 이용신청을 하는 것은 회사가 본 약관에 따라 이용신청서에 기재된 회원정보를 수집, 이용 및 제공하는 것에 동의하는 것으로 간주됩니다.
 
제 8 조 (이용신청의 승낙) 
①회사는 회원이 제 6 조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 제2호, 제3호의 경우를 예외로 하여 승낙할 수 있습니다. 
②회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다. 
㉮설비에 여유가 없는 경우 
㉯기술상 지장이 있는 경우 
㉰기타 회사의 사정상 이용승낙이 곤란한 경우 
③회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 이를 승낙하지 아니 할 수 있습니다. 
㉮이름이 실명이 아닌 경우 
㉯다른 사람의 명의를 사용하여 신청한 경우 
㉰이용신청시 필요내용을 허위로 기재하여 신청한 경우 
㉱사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우 
㉲기타 회사가 정한 이용신청요건이 미비되었을 때
 
제 9 조 (계약사항의 변경) 
회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인으로 수정을 해야 하고 미변경으로 인하여 발생되는 문제의 책임은 회원에게 있습니다.
[제 3 장 계약당사자의 의무]
 
제 10조 (회사의 의무) 
①회사는 서비스 제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙없이 제 3자에게 누설, 배포하지 않습니다. 
단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.
②1항의 범위내에서, 회사는 업무와 관련하여 회원 전체 또는 일부의 개인정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우져의 설정을 변경할 수 있습니다.
 
제 11 조 (회원의 의무) 
①회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다. 
㉮다른 회원의 ID를 부정하게 사용하는 행위 
㉯서비스에서 얻은 정보를 회사의 사전승낙 없이 회원의 이용이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위 
㉰회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위 
㉱공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위 
㉲범죄와 결부된다고 객관적으로 판단되는 행위 
㉳기타 관계법령에 위배되는 행위 
②회원은 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다. 
③회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수하여야합니다. 
④회원은 회사의 사전 승낙없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 회원이 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다. 회원은 이와 같은 영업활동에 대하여 회사에 대하여 손해배상의무를 집니다. 
⑤회원은 회사의 명시적인 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
[제 4 장 서비스 이용]
 
제 12 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무) 
①아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다. 
②자신의 아이디(ID)가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.
제 13조 (회원 홈페이지에 관한 의무) 
①회원은 자신의 홈페이지에 공공질서 및 미풍양속에 위반되는 내용물이나 제 3자의 저작권 등 기타권리를 침해하는 내용물을 등록하는 행위를 하지 않아야 합니다. 만약 이와 같은 내용물을 올렸을 때 발생하는 결과에 대한 모든 책임은 회원에게 있습니다. 
②회원은 자신의 책임하에 개설한 홈페이지를 관리하여야 하며, 이에 대한 백업본을 만들어 이를 보관하여야 합니다.
 
제 14조 (정보의 제공) 
강진완도축산농협법인은 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편이나 서신우편 등의 방법으로 회원에게 제공할 수 있으며 회원은 원치 않을 경우 가입신청메뉴와 회원정보수정 메뉴에서 정보수신거부를 할 수 있습니다.
 
제 15 조 (회원의 게시물) 
강진완도축산농협법인은 회원이 게시하거나 등록하는 서비스내의 내용물이 다음 각 호의 1에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다. 
①다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우 
②공공질서 및 미풍양속에 위반되는 내용인 경우 
③범죄적 행위에 결부된다고 인정되는 내용일 경우 
④강진완도축산농협법인의 저작권, 제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우 
⑤강진완도축산농협법인에서 규정한 게시기간을 초과한 경우 
⑥회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우 
⑦기타 관계법령에 위반된다고 판단되는 경우
 
제 16 조 (게시물의 저작권) 
서비스에 게재된 자료에 대한 권리는 다음 각 호와 같습니다. 
①게시물에 대한 권리와 책임은 게시자에게 있으며 강진완도축산농협법인은 게시자의 동의 없이는 이를 서비스내 게재 이외에 영리적 목적으로 사용하지 않습니다. 단, 비영리적인 경우에는 그러하지 아니하며 또한 강진완도축산농협법인은 서비스내의 게재권을 갖습니다. 
②회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.
 
제 17 조 (서비스 이용시간) 
①서비스의 이용은 강진완도축산농협법인의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다.
다만 정기 점검 등의 필요로 강진완도축산농협법인이 정한 날이나 시간은 그러하지 않습니다.
②강진완도축산농협법인은 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 
이 경우 그 내용을 사전에 공지합니다.
제 18조 (서비스 이용 책임) 
회원은 강진완도축산농협법인에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 불법상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란사이트를 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 
이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치등에 관해서는 강진완도축산농협법인이 책임을 지지 않습니다.
 
제 19 조 (서비스 제공의 중지) 
①강진완도축산농협법인은 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다. 
가.서비스용 설비의 보수 등 공사로 인한 부득이한 경우 
나.전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우 
다.기타 불가항력적 사유가 있는 경우 
②강진완도축산농협법인은 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나 정지할 있습니다.
[제 5 장 계약해지 및 이용제한]
 
제 20 조 (계약해지 및 이용제한) 
①회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인을 통해 강진완도축산농협법인에 해지신청을 하여야 합니다. 
②강진완도축산농협법인은 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다. 
가.타인의 서비스 ID 및 비밀번호를 도용한 경우 
나.서비스 운영을 고의로 방해한 경우 
다.가입한 이름이 실명이 아닌 경우 
라.같은 사용자가 다른 ID로 이중등록을 한 경우 
마.공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우 
바.회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우 
사.타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우 
아.서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우 
자.정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우 
차.강진완도축산농협법인, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우 
카.정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은 경우 
타.타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우 
파.강진완도축산농협법인의 서비스 정보를 이용하여 얻은 정보를 강진완도축산농협법인의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우 
하.회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트 링크하는 경우 
거.본 약관을 포함하여 기타 강진완도축산농협법인이 정한 이용조건에 위반한 경우 
 
[제 6 장 손해배상 등]
 
제 21 조 (손해배상) 
강진완도축산농협법인은 서비스 요금이 무료인 동안의 서비스 이용과 관련하여 강진완도축산농협법인의 고의, 과실에 의한 것이 아닌 한 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.
 
제 22 조 (면책조항) 
①강진완도축산농협법인은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. 
②강진완도축산농협법인은 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 
③강진완도축산농협법인은 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다. 
④강진완도축산농협법인은 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
 
제 23조 (관할법원) 
요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 강진완도축산농협법인의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.
[부칙] 
(시행일) 이 약관은 2017년 09월 01일 부터 시행합니다.  </textarea>
				</div>

				<div class="col-xs-12">
					<div class="checkbox pull-right">
						<label for="join_priv_agree"> <input
							name="join_priv_agree" class="errer" id="join_priv_agree"
							type="checkbox" value="1" />약관에 동의합니다.
						</label>
					</div>
				</div>
			</div>
			</div>

			<div class="form-group text-center">
				<input type="submit" class="btn btn-info" value="회원가입" onclick="memberCheck(f)"/>
				<input type="button"
					class="btn btn-warning" value="가입취소"
					onclick="javascript:window.history.back();">
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
function memberCheck(f) {
    //회원가입 유효성 검사

    //1) 아이디 5~10 글자 이내 
	var gid=f.gid.value;
	gid=gid.trim();//공백제거	
	if(gid.length<3 || gid.length>=8)	{
       alert("아이디는 3~8글자 이내로 작성하시오");
       return; //호출시점으로 되돌아 감
	}
	
    //2) 비밀번호 8~10 글자 이내	
	var gpasswd=f.gpasswd.value;
	//passwd=passwd.replace(/^\s+|\s+$/gm, '');
	gpasswd=gpasswd.trim();
	if(gpasswd.length<3 || gpasswd.length>=8)	{
       alert("비번은 2~8글자 이내로 작성하시오");
       f.gpasswd.focus();
       return;
	}

    //4) 이름 2~10 글자 이내
	var gname=f.gname.value;
	gname=gname.trim();
	if(gname.length<2)  {
       alert("이름은 2글자 이상입력하시오!");
       f.gname.focus();
       return;
	}
	
    //5) 이메일 @문자가 있는지 검사
	var gemail=f.gemail.value;
	gemail=gemail.trim();
	if(gemail.length<5) 	{
       alert("이메일 다시 입력 하시오!");
       return;
	}
	
	if(email.indexOf("@")<0)	{
	   alert("이메일 @문자를 넣어야하오!");
	   return;
	}	

    //유효성 검사를 통과 했으므로 회원가입폼을 전송
    f.submit();
	
}//memberCheck() end
</script>

<%@ include file="../footer.jsp"%>