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
		
		.container {margin-left:250px; }
	</style>

<div class="w3-sidebar w3-bar-block w3-blue-gray w3-card" style="width:200px;">
	<h5 style="text-align:center;">인사관리 메뉴</h5>
	<hr/>
   	<a href="hrm.erp" class="w3-bar-item w3-button">사원 등록/조회</a>
   	<a href="department.erp" class="w3-bar-item w3-button">부서 등록/조회</a>
  	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">인사발령 <i class="fa fa-caret-down"></i></button>
  	<div id="demoAcc" class="w3-hide w3-blue-gray w3-card">
	    <a href="internal_mobility_registerform.erp" class="w3-bar-item w3-button w3-right-align">인사발령 등록</a>
	    <a href="search_internal_mobility.erp" class="w3-bar-item w3-button w3-right-align">인사발령 조회</a>
  	</div>
  	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc2()">인사 관리 현황 <i class="fa fa-caret-down"></i></button>
  	<div id="demoAcc2" class="w3-hide w3-blue-gray w3-card">
    	<a href="personnel_status.erp" class="w3-bar-item w3-button w3-right-align">인원 현황</a>
  	</div>
  	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc4()">근태<i class="fa fa-caret-down"></i></button>
  	<div id="demoAcc4" class="w3-hide w3-blue-gray w3-card">
    	<a href="management_registerform.erp" class="w3-bar-item w3-button w3-right-align">근태입력</a>
    	<a href="search_management.erp" class="w3-bar-item w3-button w3-right-align">근태조회</a>
  	</div>
  	<button class="w3-button w3-block w3-left-align" onclick="myAccFunc3()">급여관리 <i class="fa fa-caret-down"></i></button>
  	<div id="demoAcc3" class="w3-hide w3-blue-gray w3-card">
  		<a href="calculate_salary.erp" class="w3-bar-item w3-button w3-right-align">급여계산</a>
    	<a href="salary_status.erp" class="w3-bar-item w3-button w3-right-align">급여대장 조회</a>
    	<a href="attendance_history.erp" class="w3-bar-item w3-button w3-right-align">근무기록</a>
  	</div>
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
	function myAccFunc4() {
		  var x = document.getElementById("demoAcc4");
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
