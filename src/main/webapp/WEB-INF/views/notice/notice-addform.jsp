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
<%@ include file="../my/mysidebar.jsp" %>
<div class="container">
	<div style="text-align: center;">
		<h1>공지사항 등록</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<form action="notice-addform.erp" method="post" class="well" id="add-form" enctype="multipart/form-data">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="title" id="notice-title">
				</div>
				<div class="form-group">
					<label>부서명</label>
					<select id="select-option" name="deptNo" class="form-control">
						<option disabled selected id="select-dept">-- 부서를 선택하세요. --</option>
						<c:forEach var="departments" items="${Departments }" >
							<option value="${departments.no }" >${departments.name }</option>	
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
				  	<label>내용</label>
				  	<textarea class="form-control" rows="5" id="notice-comment" name="content"></textarea>
				</div>
				<div class="form-group">
					<label>첨부파일</label>
					<input type="file" class="form-control" name="source">
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-primary" id="btn-register">등록하기</button>				
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#add-form").submit(function(event) {
		
		if($("#notice-title").val() == "") {
			alert("제목을 입력하세요.");
			return false;
		}
		if($("#select-option").val() == null) {
			alert("부서를 선택하세요");
			return false;
		}
		if($("#notice-comment").val() == "") {
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	});
</script>
</body>
</html>