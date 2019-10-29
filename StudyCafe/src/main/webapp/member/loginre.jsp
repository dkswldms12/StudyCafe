<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<c:if test="${gid != null }">
	<div class="container">
		<div class="row col-md-6 col-md-offset-2 custyle">
			<table class="table table-striped custab">
				<thead>
					<tr>
						<td class="t2">${gid }
						<td class="text-center">Action</td>
					</tr>
				</thead>
				<tr>
					<td>${gid }님이 방문하셨습니다~</td>
					<td class="text-center">
					<a class='btn btn-info btn-xs'
						 href="./loginup.do?gid=${gid }">
							<span class="glyphicon glyphicon-edit"></span> 회원 정보 수정
					</a> 
					<a class='btn btn-info btn-xs' href="./logout.jsp"> <span
							class="glyphicon glyphicon-edit"></span> 로그아웃
					</a> 
					<a href="./loginde.do?gid=${gid }" class="btn btn-danger btn-xs">
							<span class="glyphicon glyphicon-remove"></span> 회원 탈퇴
					</a></td>
				</tr>
			</table>
		</div>
	</div>
</c:if>
<c:if test="${gid == null }">
${msg1 }
<br>
${msg2 }
</c:if>

<%@ include file="../footer.jsp"%>