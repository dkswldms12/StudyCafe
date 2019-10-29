<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<c:if test="${owid != null }">
<div class="container">
<div class="row col-md-6 col-md-offset-2 custyle">
	<table class="table table-striped custab">
		<thead>
			<tr>
		<td class="t2">${owid }
				<td class="text-center">Action</td>
			</tr>
		</thead>
		<tr>
			<td>${owid }님이 방문하셨습니다~</td>
			<td class="text-center"><a class='btn btn-info btn-xs' href="./owloginup.do?owid=${owid }">
			<span class="glyphicon glyphicon-edit"></span>
					 회원 정보 수정</a>
			<a class='btn btn-info btn-xs' href="./owlogout.jsp">
			<span class="glyphicon glyphicon-edit"></span>
					 로그아웃</a> 
			 <a href="./owloginde.do?owid=${owid }"class="btn btn-danger btn-xs">
				<span class="glyphicon glyphicon-remove"></span>
					회원 탈퇴</a></td>
		</tr>
	</table>
</div>
</div>
</c:if>
<c:if test="${owid == null }">
${msg1 }
<br>
${msg2 }
</c:if>
<%@ include file="../footer.jsp"%>