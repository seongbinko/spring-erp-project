<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.w3-sidebar a:hover, .w3-sidebar button:hover, .w3-sidebar a:focus, .w3-sidebar button:focus {
			background-color: #607d8b !important;
			text-decoration : none !important;
			color: white !important;
			outline : none !important;
		}
		.w3-sidebar {margin-top: 51px; border-top: 2px solid white; border-radius: 7px;}
		
		.container {margin-left:250px; width:1000px; }
	</style>

<div class="w3-sidebar w3-bar-block w3-blue-gray w3-card" style="width:200px;">
	<a href="#" class="w3-bar-item w3-button">마이 메뉴  <i class="fa fa-apple"></i></a>
<button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">메세지 <i class="fa fa-caret-down"></i></button>
<div id="demoAcc" class="w3-hide w3-blue-gray w3-card">
	<a href="/my/sendmessages.erp" class="w3-bar-item w3-button w3-right-align">발신메세지<span class="badge">${getMessageCount }</span></a>
	<a href="/my/getmessage.erp" class="w3-bar-item w3-button w3-right-align">수신 메세지 <span class="badge">${sendMessageCount }</span></a><br>
</div>
	<a href="/my/my.erp" class="w3-bar-item w3-button">내 정보보기</a>
	<a href="/my/searchemployee.erp" class="w3-bar-item w3-button">직원 검색하기</a>
	<a href="/my/modify.erp" class="w3-bar-item w3-button">내 정보 변경하기</a>
	<a href="/notice/notice.erp" class="w3-bar-item w3-button">공지사항</a>
	<c:if test="${not empty LE and LE.gradeNo eq '1' }">
		<a href="/notice/notice-addform.erp" class="w3-bar-item w3-button">공지사항 등록</a>
		<a href="/notice/modifyform.erp" class="w3-bar-item w3-button">공지사항 삭제/수정</a>
	</c:if>
</div>

<div class="w3-container" style="margin-left:200px">

</div>

<script>
	function myAccFunc() {	
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf(" w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-blue-gray";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-blue-gray", "");
	  }
	}
	function myAccFunc2() {
		  var x = document.getElementById("demoAcc2");
		  if (x.className.indexOf(" w3-show") == -1) {
		    x.className += " w3-show";
		    x.previousElementSibling.className += " w3-blue-gray";
		  } else { 
		    x.className = x.className.replace(" w3-show", "");
		    x.previousElementSibling.className = 
		    x.previousElementSibling.className.replace(" w3-blue-gray", "");
		  }
		}

</script>