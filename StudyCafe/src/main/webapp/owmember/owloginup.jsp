<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="modal-dialog" style="background-color: #ffffff">
	 
	<div class="modal-body">
		<form role="form" action="./owloginup.do" method="post">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					value="${dto.owid}" name="owid" id="owid"
					placeholder="아이디를 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="InputPassword">비밀번호</label> <input type="password"
					class="form-control" name="owpasswd" id="owpasswd"
					placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label for="username">이름</label> <input type="text"
					class="form-control" value="${dto.owname}" id="owname"
					name="owname" placeholder="이름을 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="gender">성별</label> <select id="owgender" name="owgender">
					<option value="A1">남자</option>
					<option value="A2">여자</option>
				</select>
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label> <input type="text"
					class="form-control" value="${dto.owbirth}" name="owbirth"
					id="owbirth" placeholder="생년월일을 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label> <input type="text"
					class="form-control" value="${dto.owphone}" id="owphone"
					name="owphone" placeholder="전화번호를 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="InputEmail">이메일</label> <input type="email"
					class="form-control" value="${dto.owemail}" id="owemail"
					name="owemail" placeholder="이메일 주소">
			</div>

			<div class="form-group text-center">
				<input type="submit" class="btn btn-info" value="수정완료" /> <input
					type="button" class="btn btn-warning" value="수정취소"
					onclick="window.location.href='./owcreate.do'">
			</div>

		</form>
		 
	</div>
</div>

<%@ include file="../footer.jsp"%>