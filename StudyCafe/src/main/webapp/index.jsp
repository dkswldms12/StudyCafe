<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Studycafe</title>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<!-- login 메뉴 css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen">
<!-- 메인메뉴 css -->
<link href="css/main_menu.css" rel="stylesheet" type="text/css">
<!-- 메인메뉴 폰트 css -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- 새소식, 공지사항, 추천메뉴 css -->
<link href="css/menu-m.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* 이미지 슬라이드 */
  .col-sm-8 {
    width: 100%;
  }
   .container {
      padding: 80px 120px;
  }
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
   @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
      }
  } 
  
  .jumbotron {
	  margin-bottom: 0;
  } 
  
/* footer */
  footer {
	  background-color: #f2f2f2;
	  padding: 25px;
  }  
  
  footer li {
  	list-style: none;
  }    
  .container-footer {
    width: 100%;
    padding-bottom: 30px;
  }
   /*모달 배경색 */ 
  .modal-dialog { background-color: #EAEAEA;}
  
</style>
</head>

<body>
<!-- 로그인 시작 -->
	<nav class="navbar navbar-inverse">
		<div class="col-sm-8 text-right">
			<ul class="list-inline top-dark-right">
				<li><a href="index.jsp"><button type="button" class="btn btn-link" data-toggle="modal">Home</button></a></li>
				<li>
					<button type="button" class="btn btn-link" data-toggle="modal"
						data-target="#login">Login</button>
				</li>
				<li><a href="#"><button type="button" class="btn btn-link" data-toggle="modal">Sign Up</button></a></li>
			</ul>
		</div>
	</nav>
	
	<div class="modal modal-center fade" id="login">
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
			 <ul class="nav nav-tabs">
	   			 <li class="active"><a data-toggle="tab" href="#glogin">일반</a></li>
	    		<li><a data-toggle="tab" href="#owlogin">점주</a></li>
	 		 </ul>
	 		 
	<div class="tab-content">
		<div id="glogin" class="tab-pane fade in active">
		<c:if test="${sessionScope.gid != null }">
		</br>
		${sessionScope.gid } 님 로그인 되어있습니다.
		</br>
		<td class="text-center">
			<a class='btn btn-info' href="./member/loginup.do?gid=${gid }">
			<span class="glyphicon glyphicon-edit"></span> 회원 정보 수정
			</a> 
			<a class='btn btn-info' href="./member/logout.jsp"> 
			<span class="glyphicon glyphicon-edit"></span> 로그아웃
			</a> 
			<a href="./member/loginde.do?gid=${gid }" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove"></span> 회원 탈퇴
			</a>
			</td>
		</c:if>
		<c:if test="${sessionScope.gid == null }">
				<form name="loginform" method="post" action="./member/loginre.do">
					<div class="form-group">
						<label for="id">ID</label> <input type="text" class="form-control"
							id="gid" name="gid" value="${gid }" placeholder="아이디">
					</div>
					<div class="form-group">
						<label for="InputPassword">PASSWORD</label> <input type="password"
							class="form-control" id="gpasswd" name="gpasswd" placeholder="비밀번호">
					</div>
					<p>
						<button type="submit" class="btn btn-default btn-sm">Login</button>
						<a href="member/create.do"><button type="button" data-toggle="modal"
							class="btn btn-default btn-sm" data-target="#create">회원가입</button></a>
					</p>
				</form>
				</c:if>
	 		</div>
	 		
	 		
		<div id="owlogin" class="tab-pane fade">
		<c:if test="${sessionScope.owid != null }">
		</br>
		${sessionScope.owid } 님 로그인 되어있습니다.
		</br>
		<td class="text-center">
			<a class='btn btn-info' href="./owmember/owloginup.do?owid=${owid }">
			<span class="glyphicon glyphicon-edit"></span> 회원 정보 수정
			</a> 
			<a class='btn btn-info' href="./owmember/owlogout.jsp"> 
			<span class="glyphicon glyphicon-edit"></span> 로그아웃
			</a> 
			<a href="./owmember/owloginde.do?owid=${owid }" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove"></span> 회원 탈퇴
			</a>
			</td>
		</c:if>
		<c:if test="${sessionScope.owid == null }">
				<form name="loginform" method="post" action="./owmember/owloginre.do">
					<div class="form-group">
						<label for="id">ID</label> <input type="text" class="form-control"
							id="owid" name="owid" placeholder="아이디">
					</div>
					<div class="form-group">
						<label for="InputPassword">PASSWORD</label> <input type="password"
							class="form-control" id="owpasswd" name="owpasswd" placeholder="비밀번호">
					</div>
					<p>
						<button type="submit" class="btn btn-default btn-sm">Login</button>
						<a href="owmember/owcreate.do"><button type="button" data-toggle="modal"
							class="btn btn-default btn-sm" data-target="#owcreate">회원가입</button></a>
				</p>
					</form>
					</c:if>
					</div>
	 		</div>
	 	</div>
	 </div>
 </div>
 
	<div class="modal modal-center fade" id="create">
	</div>
	
	<div class="modal modal-center fade" id="owcreate">
	</div>
   
	<!-- 로그인 끝 -->
	<!-- 메인메뉴 -->
	<div class="container2">
          <div class="drop">              
        	<button class="dropbtn">COFFEE</button>  
        	<div class="drop-content">
	        	<div class="column">
			      <a href="#"><h3>원두</h3></a>
			    </div>
			    <div class="column">
			      <a href="#"><h3>나와 어울리는 커피</h3></a>
			    </div>
			    <div class="column">
			      <a href="#"><h3>에스프레스 음료</h3></a>
				    <ul>
	                    <li><a href="#">도피오</a></li>
	                    <li><a href="#">에스프레소 마키아또</a></li>
	                    <li><a href="#">아메리카노</a></li>
	                    <li><a href="#">마끼아또</a></li>
	                    <li><a href="#">카푸치노</a></li>
	                    <li><a href="#">라떼</a></li>
	                    <li><a href="#">모카</a></li>
	                    <li><a href="#">리스트레또 비안코</a></li>
					</ul>
				</div>
			    <div class="column">
			      <a href="#"><h3>최상의 커피를 즐기는 법</h3></a>
				    <ul>
	                    <li><a href="#">커피 프레스</a></li>
	                    <li><a href="#">푸어 오버</a></li>
	                    <li><a href="#">아이스 푸어 오버</a></li>
	                    <li><a href="#">커피 메이커</a></li>
	                    <li><a href="#">리저브를 매장에서 다양하게 즐기는 법</a></li>
					</ul>
				</div>				
		    </div> <!-- class="drop-content" -->
		  </div> <!-- class="drop" -->
		  
          <div class="drop">       		    
		    <button class="dropbtn">MENU</button>  
        	<div class="drop-content">
	        	<div class="column">        	
			      <a href="#"><h3>음료</h3></a>
	                  <ul>
	                    <li><a href="#">콜드브루</a></li>
	                    <li><a href="#">브루드 커피</a></li>
	                    <li><a href="#">에스프레소</a></li>
	                    <li><a href="#">프라푸치노</a></li>
	                    <li><a href="#">블랜디드음료</a></li>
	                    <li><a href="#">티</a></li>
	                    <li><a href="#">기타 제조 음료</a></li>
	                  </ul>	
                </div>
 	        	<div class="column">                   	      
			      <a href="#"><h3>푸드</h3></a>
	                  <ul>
	                    <li><a href="#">베이커리</a></li>
	                    <li><a href="#">케이크</a></li>
	                    <li><a href="#">샌드위치 & 샐러드</a></li>
	                    <li><a href="#">따뜻한 푸드</a></li>
	                    <li><a href="#">과일 & 요거트</a></li>
	                    <li><a href="#">스낵 & 미니디저트</a></li>
	                    <li><a href="#">아이스크림</a></li>
	                  </ul>	
                </div>       
 	        	<div class="column">                              	      
			      <a href="#"><h3>메뉴이야기</h3></a>
	                  <ul>
	                    <li><a href="#">나이트로 콜드브루</a></li>
	                    <li><a href="#">콜드브루</a></li>
	                    <li><a href="#">티</a></li>
	                  </ul>
                </div>                  
		    </div> <!-- class="drop-content" -->
		  </div> <!-- class="drop" -->    
  		  
          <div class="drop">       		    
		    <button class="dropbtn">STORE</button>  
        	<div class="drop-content">
 	        	<div class="column"> 
		      	  <a href="#"><h3>매장찾기</h3></a>  
                </div>	
 	        	<div class="column">                	      
		      	  <a href="#"><h3>매장이야기</h3></a>
		        </div>
		    </div>         	
  		  </div>      	
  		  
  		  <div class="drop">       		    
		    <button class="dropbtn">RESERVATION</button>  
        	<div class="drop-content">
 	        	<div class="column">        	
		          <a href="#"><h3>예약하기</h3></a>
                </div>		      
 	        	<div class="column">		        
		          <a href="#"><h3>예약확인</h3></a>
                </div>		    
		    </div> <!-- class="drop-content" -->
		  </div> <!-- class="drop" --> 
  		  
  		  <div class="drop">       		    
		    <button class="dropbtn">NEWS</button>  
        	<div class="drop-content">
  	        	<div class="column">        	
		      	  <a href="#"><h3>새 소식</h3></a>  
		        </div>		      
 	        	<div class="column"> 		      
		      	  <a href="#"><h3>공지사항</h3></a>
		        </div>		      
 	        	<div class="column"> 		      
		      	  <a href="#"><h3>월페이퍼</h3></a>
		        </div>		   	
		    </div> <!-- class="drop-content" -->
		  </div> <!-- class="drop" -->   	
	</div> <!-- class="container2" -->
	<!-- 메인메뉴 끝 -->
	
	<!-- 본문시작 -->
	<!-- 이미지 슬라이드 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		 <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active" style="width:100%;height:100%;">
	        <img src="img/main1.jpg">
	      </div>
	
	      <div class="item" style="width:100%;height:100%;">
	        <img src="img/main2.jpg">
	      </div>
	    
	      <div class="item" style="width:100%;height:100%;">
	        <img src="img/main3.jpg">   
	      </div>
	    </div> <!-- class="carousel-inner" role="listbox" -->

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div> <!-- class="carousel slide" -->


	<!-- 신메뉴,추천메뉴,게시판,새소식 -->
	<div class="sect04">
		<div class="sectInner">
			<div class="discript">
				<h2 class="tit">
					<span>Delicious Journey</span> with StudyCafe
				</h2>
				<p class="titCopy">커피와 함께하는 맛의 여행으로 초대합니다</p>
			</div>
			<ul class="menuList">
				<li class="m01"><a href=""><strong>신메뉴</strong>
						<p>신메뉴소개</p>
				</a></li>
				<li class="m02"><a href=""><strong>공지사항</strong>
						<p>공지사항</p>
				</a></li>
				<li class="m03"><a href=""><strong>새소식</strong>
						<p>새소식</p>
				</a></li>
				<li class="m04"><a href=""><strong>추천메뉴</strong>
						<p>추천메뉴</p>
				</a></li>
			</ul>
		</div> <!-- class="sectInner" -->
	</div> <!-- class="sect04" -->




<!-- footer -->
	<footer>
		<div class="btn_top text-right">
			<a href="#top"><img src="./img/btn_top.png" alt="TOP" /></a>
		</div>

		<section class="subFooter text-center">
			<div class="container-footer">
				<div class="sns_group">
					<ul class="sns">
						<li>
							<a href="https://www.instagram.com/explore/tags/인스타그램/?hl=ko">
								<img src="img/instagram.png" alt="인스타그램" /></a> 
							<a href="https://ko-kr.facebook.com/">
								<img src="img/facebook.png" alt="페이스북 " /></a> 
							<a href="https://twitter.com/?lang=ko">
								<img src="img/twitter.png" alt="트위터" /></a>
						</li>
					</ul>
				</div> <!-- class="sns_group" -->

				<div class="copyrightText">
					<ul class="copyright_info2">
						<li>법인명: (주)솔데스크｜사업자등록번호: 000-00-00000 
							<a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank">[사업자정보확인]</a>
						</li>
						<li>본사주소 : 서울시 종로구 관철동 13-13 종로코아빌딩 5층 ｜ 대표번호 : 02-0000-0000｜ 팩스 : 02-000-0000</li>
					</ul>
					<div class="copyright_info3">Copyright(c) StaRoom 2017 All
						Rights Reserved.</div>
				</div> <!-- class="copyrightText" -->

				<div class="oi_footer_right"></div>
			</div> <!-- class="container" -->
		</section>
	</footer>

</body>
</html>