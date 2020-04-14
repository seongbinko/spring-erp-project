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
		<h1>내 정보 변경</h1>
	</div>
	<c:if test="${param.error eq 'fail'}">
	<div class="row">
		<div class="col-sm-12">
			<div class="alert alert-danger">
				<strong>비밀번호 변경 실패</strong> 예전 비밀번호가 일치하지 않습니다.
			</div>
		</div>
	</div>
	</c:if>
	
	<div class="row">
		<div class="col-sm-4">
			<img src="../resources/images/employee/${LE.imageName }" style="width:300px; height: 400px;">
		</div>
		<div class="col-sm-8">
			<form action="modify.erp" class="form-horizontal" method="post" id="my-form" enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label col-sm-2">이름</label>
					<div class="col-sm-9">
						<input type="text" name="name" class="form-control" value="${LE.name }" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">사진 변경</label>
					<div class="col-sm-9">
						<input type="file" id="user-photo" name="imgFile" class="form-control" value=""/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">비밀번호</label>
					<div class="col-sm-9">
						<input type="password" id="user-pwd" name="userpwd" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">새 비밀번호</label>
					<div class="col-sm-9">
						<input type="password" id="user-samepwd" name="newpwd" class="form-control" placeholder="비밀번호는 8~16사이로 입력해주세요" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">새 이메일을 입력하세요</label>
					<div class="col-sm-4">
						<input type="email" id="user-email" name="email" class="form-control" placeholder="ex) erp@erp.com" value="${LE.email }"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">연락처</label>
					<div class="col-sm-3">
						<select name="tel1" class="form-control">
							<option value="010" ${LE.tel1 eq '010' ? 'selected' : '' }> 010</option>
							<option value="016" ${LE.tel1 eq '016' ? 'selected' : '' }> 016</option>
							<option value="017" ${LE.tel1 eq '017' ? 'selected' : '' }> 017</option>
							<option value="018" ${LE.tel1 eq '018' ? 'selected' : '' }> 018</option>
							<option value="019" ${LE.tel1 eq '019' ? 'selected' : '' }> 019</option>
						</select>
					</div>
					<div class="col-sm-3">
						<input type="text"  maxlength="4" placeholder="최대 숫자 4개" class="form-control"
								name="tel2" id="user-phone2" value="${LE.tel2 }"  />
					</div>
					<div class="col-sm-3">
						<input type="text"  maxlength="4" placeholder="최대 숫자 4개" class="form-control"
								name="tel3" id="user-phone3" value="${LE.tel3 }"/>
					</div>
				</div>
				<div class="form-group col-sm-11 text-right">
					<a href="my.erp" class="btn btn-default">이전으로</a>
					<input type="submit"  class="btn btn-primary" value="제출"/>
		        </div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	
	$("#user-phone2").keypress(function(event) {
		if(event.keyCode < 48 || event.keyCode > 57) return false;
	});
	$("#user-phone2").keyup(function(e) {
		if(!(e.keyCode >= 37 && e.keyCode <= 40)) {
			var value = $(this).val();
			$(this).val(value.replace(/[^a-z0-9]/gi,''));
		}
	}) 
	$("#user-phone3").keypress(function(event) {
		if(event.keyCode < 48 || event.keyCode > 57) return false;
	});
	$("#user-phone3").keyup(function(e) {
		if(!(e.keyCode >= 37 && e.keyCode <= 40)) {
			var value = $(this).val();
			$(this).val(value.replace(/[^a-z0-9]/gi,''));
		}
	}); 
	

	
	$("#my-form").submit(function() {
		var pwd1 = $("#user-pwd").val();
		var pwd2 = $("#user-samepwd").val();
		var tel2 = $("#user-phone2").val();
		var tel3 = $("#user-phone3").val();

		
		if(pwd1 == "") {
			alert("이전 비밀번호를 입력하세요.")
			$("#user-pwd").val().focus();
			return false;
		}
		if(pwd2 == "") {
			alert("새 비밀번호를 입력하세요.")
			$("#user-samepwd").val().focus();
			return false;
		}
		if(pwd2.length < 8 || pwd2.length > 16) {
			alert("새 비밀번호는 8자이상 16이하입니다.")
			return false;
		}
		if(pwd1 == pwd2) {
			alert("이전 비밀번호와 일치합니다.")
			return false;
		}
		if(tel2.length < 8 ) {
			alert("전화번호 제대로 입력")
			return false;
		}

		return true;
	});
</script>
</body>
</html>