<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

	<h3>해당 아이디를 삭제하시겠습니까?</h3>

<div class='bottom'>
	<form name='frm' method='post' action='./loginde.do'>
		<input type="hidden" name="gid" value="${dto.gid }">
		<input type='submit' value='삭제'>
		<input type='button'
			value='취소' onclick="window.location.href='./loginre.do'">
	</form>
</div>

<%@ include file="../footer.jsp"%>