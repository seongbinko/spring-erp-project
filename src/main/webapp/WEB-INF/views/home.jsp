<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>erp</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h1>Home</h1>	
	</div>
	
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 well">
			<h1>로그인</h1>
			<form action="login.erp" method="post">
				<div class="form-group">
					<label>사원번호</label>
					<input type="text" class="form-control" name="employeeno">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="password">
				</div>
				<div class="text-right">
					<button class="btn btn-primary btn-right">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>