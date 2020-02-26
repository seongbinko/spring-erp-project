<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h2>사원등록</h2>
	</div>
	<div class="row">
		<form id="add-employee-form" class="form-horizontal well" action="addemployee.erp" method="post" enctype="multipart/form-data">
		  	<div class="form-group">
		   		<label class="control-label col-sm-2">성명</label>
		   		<div class="col-sm-10">
		    		<input type="text" class="form-control" name="name" placeholder="ex) 홍길동">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >전화번호</label>
		   		<div class="col-sm-10">
		    		<input type="tel" class="form-control" name="tel" placeholder="ex) 010-1234-5678">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >이메일</label>
		   		<div class="col-sm-10">
		    		<input type="email" class="form-control" name="email" placeholder="ex) erp@erp.com">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >부서코드</label>
		   		<div class="col-sm-10">
			   		<div class="input-group">
			    		<input  id="department-no" type="number" class="form-control" name="departmentNo" >
			    		<div class="input-group-btn">
					      	<button id="search-department-no" class="btn btn-default" type="button">
					        	<i class="glyphicon glyphicon-search"></i>
					      	</button>
					    </div>
			    	 </div>
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >직급코드</label>
		   		<div class="col-sm-10">
			   		<div class="input-group">
			    		<input id="grade-no" type="number" class="form-control" name="gradeNo" >
			    		<div class="input-group-btn">
					      	<button id="search-grade-no" class="btn btn-default" type="button">
					        	<i class="glyphicon glyphicon-search"></i>
					      	</button>
					    </div>
			    	 </div>
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >이미지</label>
		   		<div class="col-sm-10">
		    		<input type="file" class="form-control" name="imgFile" id="img-file">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >입사일</label>
		   		<div class="col-sm-10">
		    		<input type="date" class="form-control" name="hireDate">
		    	 </div>
		  	</div>
  			<div class="form-group">
    			<div class="col-sm-offset-2 col-sm-10">
      				<button type="button" id="btn-aaa" class="btn btn-primary pull-right">등록</button>
      				<button type="reset" class="btn btn-warning pull-left">초기화</button>
    			</div>
    		</div>    		
		</form>
	</div>
	<div class="row">
		<form id="excel-file-form" class="form-horizontal well" method="post" action="addXlsx.erp" enctype="multipart/form-data">
			<div class="form-group">
				<label class="contral-label col-sm-2">엑셀파일</label>
				<div class="col-sm-10">
					<input id="excel-file" type="file" class="form-control" name="xlsxfile" accept=".xls, .xlsx"/>
				</div>
			</div>
			<div class="text-right">
				<button id="add-employee-excel-btn" type="button" class="btn btn-primary">일괄등록</button>
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
	$("#search-department-no").click(function (){
		window.open("/hr/searchDepartmentForm.erp","searchDepartment","width=800,height=600, left=300,top= 200")
	})
	$("#search-grade-no").click(function (){
		window.open("/hr/searchGradeForm.erp","searchGrade","width=800,height=600, left=300,top= 200")
	})
	
	$("#btn-aaa").click(function() {
		
		var formData = new FormData();
		formData.append("name", $("[name=name]").val());
		formData.append("tel", $("[name=tel]").val());
		formData.append("email", $("[name=email]").val());
		formData.append("departmentNo", $("[name=departmentNo]").val());
		formData.append("gradeNo", $("[name=gradeNo]").val());
		formData.append("hireDate", $("[name=hireDate]").val());
		formData.append("imgFile", document.getElementById("img-file").files[0]);
		
		$.ajax({
			type:"POST",
			url: "addemployee.erp",
			enctype:"multipart/form-data",
			processData:false,
			contentType:false,
			cache:false,
			data:formData,
			complete:function() {
				alert("한명의 사원 등록 성공")
				opener.location.reload();
				self.close();
			}
		});
	});
	$("#add-employee-excel-btn").click(function(){
		if(!($("#excel-file-form :input[type='file']").val())){
			alert("엑셀 파일을 등록해주세요")
			return false; 
		}
		var formData = new FormData();
		formData.append("xlsxfile", document.getElementById("excel-file").files[0]);
		
		$.ajax({
			type:"POST",
			url: "addXlsx.erp",
			enctype:"multipart/form-data",
			processData:false,
			contentType:false,
			cache:false,
			data:formData,
			complete:function() {
				alert("제출 성공");
				opener.location.reload();
				self.close();
			}	
		})
		
	}) 
</script>
</html>