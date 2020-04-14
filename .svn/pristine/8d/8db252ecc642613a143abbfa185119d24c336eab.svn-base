<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>직급검색</title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h3>직급검색</h3>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-4">
				 	<div><h4>직급리스트</h4></div>
				</div>
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<select id="check-option" class="form-control" name="opt">
									<option value="option" disabled selected >검색옵션</option>
									<option value="no" ${param.opt eq 'no' ? 'selected' :''}>직급코드</option>
									<option value="name" ${param.opt eq 'name' ? 'selected' :''}>직급명</option>
									<option value="salary" ${param.opt eq 'location' ? 'selected' :''} >직급월급</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<input  id="check-keyword" type="text" class="form-control" name="keyword" value="${param.keyword }" >
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary" id="search-keyword">검색</button>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div>
				<table id="grade-list-table" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>직급코드</th>
							<th>직급명</th>
							<th>직급월급</th>
							<th>직급선택</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>	
		 </div>
	</div>
</div>	
</body>
<script type="text/javascript">

	searchGrades();
	// 검색 옵션별 검색
	function searchGrades(option, keyword) {
		
		var param = {};
		if (option) {
			param.option = option;
		}
		if (keyword) {
			param.keyword = keyword;
		}
		
		$.ajax({
			//$.getJSON("/hr/searchEmployees.erp", {option:option, keyword:keyword }, function(result) {}
			//console.log(JSON.stringify(result)) 
			type:"get",
			url:"/hr/searchGrades.erp",
			data:param,
			dataType: "json",
			success: function(result) {
				var $tbody = $("#grade-list-table tbody").empty()
				
				$.each(result, function(index, grade) {
			
					var row = "<tr>";
					row += "<td>"+grade.no+"</td>";
					row += "<td>"+grade.gradeName+"</td>";
					row += "<td>"+(grade.gradeSalary == null ? '-' : grade.gradeSalary)+"</td>";
					row += "<td><button class='btn btn-default' data-grade-no="+grade.no+'>'+'선택'+"</button></td>";  
					row += "</tr>";
					
					$tbody.append(row)
				})
			}
		})
	};
	
	$("#search-keyword").click(function(){
		
		if($("#check-option").val() == null) {
			alert("검색 옵션을 선택하세요")
			return false
		}
		if($("#check-keyword").val() == "")	{
			alert("검색어를 입력하세요")
			return false;
		}
		
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
		
		searchGrades(option, keyword)
		
	})
	
	$("#check-keyword").keydown(function(key) {
	 if(key.keyCode==13) {					
		if($("#check-keyword").val() == "")	{
			alert("검색어를 입력하세요")
			return false;
		}
		if($("#check-option").val()== null) {
			alert("검색 옵션을 선택하세요")
			return false
		}
		
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
	 }	
	 	searchGrades(option, keyword)
	});
	
	$("#grade-list-table").on('click', 'button.btn-default', function(){
		var no = $(this).data("grade-no");
		opener.document.getElementById("grade-no").value = no;
		close();
	});
	
</script>
</html>