<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>부서검색</title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h3>부서검색</h3>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-4">
				 	<div><h4>부서리스트</h4></div>
				</div>
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<select id="check-option" class="form-control" name="opt">
									<option value="option" disabled selected >검색옵션</option>
									<option value="no" ${param.opt eq 'no' ? 'selected' :''}>부서번호</option>
									<option value="name" ${param.opt eq 'name' ? 'selected' :''}>부서명</option>
									<option value="location" ${param.opt eq 'location' ? 'selected' :''} >부서위치</option>
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
				<table id="department-list-table" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>부서번호</th>
							<th>부서명</th>
							<th>부서위치</th>
							<th>부서선택</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>	
		 </div>
	</div>
</div>	
</body>
<script type="text/javascript">

	searchDepartments();
	// 검색 옵션별 검색
	function searchDepartments(option, keyword) {
		
		var param = {};
		if (option) {
			param.option = option;
		}
		if (keyword) {
			param.keyword = keyword;
		}
		console.log(param)
		
		$.ajax({
			//$.getJSON("/hr/searchEmployees.erp", {option:option, keyword:keyword }, function(result) {}
			//console.log(JSON.stringify(result)) 
			type:"get",
			url:"/hr/searchDepartments.erp",
			data:param,
			dataType: "json",
			success: function(result) {
				var $tbody = $("#department-list-table tbody").empty()
				
				$.each(result, function(index, department) {
			
					var row = "<tr>";
					row += "<td>"+department.no+"</td>";
					row += "<td>"+department.name+"</td>";
					row += "<td>"+(department.location == null ? '-' : department.location)+"</td>";
					row += "<td><button class='btn btn-default' data-department-no="+department.no+'>'+'선택'+"</button></td>"; 
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
		
		searchDepartments(option, keyword)
		
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
	 	searchDepartments(option, keyword)
	});
	
	$("#department-list-table").on('click', 'button.btn-default', function(){
		var no = $(this).data("department-no");
		opener.document.getElementById("department-no").value = no;
		close();
	});
	
</script>
</html>