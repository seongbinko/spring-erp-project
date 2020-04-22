<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    	.navbar { background-color: #607d8b; color: white !important;}
    	.container {padding: 50px 0px;}
    </style>
<nav class="navbar navbar-fixed-top" style="margin-bottom:100px; ">
	<div class="container-fluid">
    	<ul class="nav navbar-nav" style="margin-left: 60px;">
			<li class="active"><a href="/main.erp">메인</a></li>
    	</ul>

		<ul class="nav navbar-nav" id="emp">
			<li><a href="/hr/hrm.erp">사원관리</a></li>
			<li><a href="/hr/department.erp">부서관리</a></li>
			<li><a href="/hr/internal_mobility_registerform.erp">인사발령</a></li>
			<li><a href="/hr/management_registerform.erp">근태관리</a></li>
			<li><a href="/hr/salary_status.erp">급여관리</a></li>
		</ul>

	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="/my/my.erp">내 정보</a></li>
	      <li><a href="/logout.erp">로그아웃</a></li>
	    </ul>

  	</div>
</nav>