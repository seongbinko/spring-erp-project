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
		
		.w3-hide {
			background-color: #eee !important;
			color: black !important;
		} 
		
	</style>

<div class="w3-sidebar w3-bar-block w3-blue-gray w3-card" style="width:200px;">
	<a href="main.erp" class="w3-bar-item w3-button">매장관리 메뉴  <i class="fa fa-apple"></i></a>
  	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">
  		발주관리 <i class="fa fa-caret-down"></i>
  	</button>
	<div id="demoAcc" class="w3-hide w3-blue-gray w3-card">
		<a href="order.erp" class="w3-bar-item w3-button w3-right-align">발주 등록</a>
		<a href="ordermodify.erp" class="w3-bar-item w3-button w3-right-align">발주 수정/삭제</a>
   		<a href="orderhistory.erp" class="w3-bar-item w3-button w3-right-align">발주내역 조회</a>
	</div>
	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc2()">
		재고관리 <i class="fa fa-caret-down"></i>
	</button>
	<div id="demoAcc2" class="w3-hide w3-blue-gray w3-card">
		<a href="stockinformation.erp" class="w3-bar-item w3-button w3-right-align">재고내역 조회</a>
		<a href="transactioninformation.erp" class="w3-bar-item w3-button w3-right-align">거래내역 조회</a>
	</div>
	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc3()">
		매출관리 <i class="fa fa-caret-down"></i>
	</button>
	<div id="demoAcc3" class="w3-hide w3-blue-gray w3-card">
		<a href="statistic.erp" class="w3-bar-item w3-button w3-right-align">매장 통계</a>
	</div>
	
	<a href="findStore.erp" class="w3-bar-item w3-button">매장찾기</a>
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
	function myAccFunc3() {
	 	var x = document.getElementById("demoAcc3");
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

