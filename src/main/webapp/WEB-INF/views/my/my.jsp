<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="mysidebar.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>내 정보</h1>
	</div>
	<p>내 정보 보기</p>
	
	<div class="row">
		<div class="col-sm-4">
			<img src="../resources/images/employee/${LE.imageName }" style="width:300px; height: 300px;">
		</div>
		
		<div class="col-sm-8">
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>직급</th>
						<th>연락처</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${myInfo.name }</td>
						<td>${myInfo.gradeName == null ? '-' : myInfo.gradeName }</td>
						<td>${myInfo.tel == null ? '-' : myInfo.tel }</td>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th>부서명</th>
						<th>부서위치</th>
						<th>이메일</th>
						<th>입사일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${myInfo.departmentName == null ? '-' : myInfo.departmentName }</td>
						<td>${myInfo.departmentLocation == null ? '-' : myInfo.departmentLocation }</td>
						<td>${myInfo.email == null ? '-' : myInfo.email }</td>
						<td><fmt:formatDate value="${myInfo.hireDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>