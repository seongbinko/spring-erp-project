<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>인사관리</title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
 <style type="text/css">

 </style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="hr_sidebar.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>사원 등록</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
					<div class="col-sm-4">
					 	<div><h4></h4></div>
					</div>
					<div class="col-sm-8">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<select id="check-option" class="form-control" name="opt">
										<option value="option" disabled selected >검색옵션</option>
										<option value="no" ${param.opt eq 'no' ? 'selected' :''}>사원번호</option>
										<option value="name" ${param.opt eq 'name' ? 'selected' :''}>성명</option>
										<option value="tel" ${param.opt eq 'tel' ? 'selected' :''} >연락처</option>
										<option value="departmentName" ${param.opt eq 'tel' ? 'departmentName' :''}>부서명</option>
										<option value="gradeName" ${param.opt eq 'tel' ? 'gradeName' :''}>직급</option>
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
					<form id="delete-form">
						<table id="employee-list-table" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>선택</th>
									<th>사원번호</th>
									<th>성명</th>
									<th>연락처</th>
									<th>이메일</th>								
									<th>부서명</th>
									<th>부서위치</th>						
									<th>직급</th>	
									<th>입사일</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</form>
				</div>	
				<div>
					<div>
						<button id="register-employee" type="button" class="btn btn-primary " >신규등록</button>
						<button id="delete-employee" type="button" class="btn btn-default " >선택삭제</button>
						<a id="downExcel" class="btn btn-default ">Excel로 받기</a>
						<div class="pull-right">
							<div class="dropdown">
				  				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" >
				  						날짜입력 <span class="caret"></span>
				  				</button>
				  				<ul id="sort-date" class="dropdown-menu">
								    <li><a href="#">전체기간</a></li>
								    <li><a href="#">1개월</a></li>
								    <li><a href="#">3개월</a></li>
				  				</ul>
								<input id="start-date" type="date" class="btn btn-default" value="1998-02-01" />
								<input id="end-date" type="date" class="btn btn-default" value="" />
								<button id="search-date" type="button" class="btn btn-primary">검색</button>
							</div>					
						</div>
					</div>
				</div>			
		 	</div>
		</div>
	<br/>
	<div class="w3-center">
		<div class="w3-bar w3-border w3-round" id="pagination-box">

		 </div>
	</div>	
</div>
</body>
<script type="text/javascript">	
	// 사원 삭제 (잘못등록했을 경우 삭제하는 기능을 만들어보자)
	$("#delete-employee").on('click', function(){
		var checkedbox = $("input[type=checkbox]:checked");
        if (checkedbox.length == 0) {
            alert("삭제할 사원이 없습니다.");
            return;
         }
     	$('#delete-form').attr("action", "deleteEmployee.erp");
		$('#delete-form').submit();
	});
	
	searchEmployees();
	
	$("#downExcel").on('click',function(){
		var startDate = $("#start-date").val();
		var endDate = $("#end-date").val();
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
		
		$(this).attr("href", "employees_xlsx.erp?option="+option+"&keyword="+keyword+"&startDate="+startDate+"&endDate="+endDate);
		
	});
	// 검색 옵션별 검색
	function searchEmployees(option, keyword, startDate, endDate, pageNo) {
		
		var param = {};
		if (option) {
			param.option = option;
		}
		if (keyword) {
			param.keyword = keyword;
		}
		if (startDate) {
			param.startDate = startDate;
		}
		if (endDate) {
			param.endDate = endDate;
		}
		if (pageNo) {
			param.pageNo = pageNo;
		}
		$.ajax({
			//$.getJSON("/hr/searchEmployees.erp", {option:option, keyword:keyword }, function(result) {}
			//console.log(JSON.stringify(result)) 
			type:"get",
			url:"/hr/searchEmployees.erp",
			data:param,
			dataType: "json",
			success: function(result) {
				var $tbody = $("#employee-list-table tbody").empty()
				$("h4").empty();
				var pagination = result.pagination;
				var employees = result.employees;
	            count = "검색사원: " + pagination.totalRows + "명";
	            $("h4").append(count);
				$.each(employees, function(index, employee) {
			
					var hireDate = getFormatDate(new Date(employee.hireDate))
					var row = "<tr>";
					row += "<td><input type='checkbox' name='employeeNo' value="+employee.no+"></td>"
					row += "<td><a>"+employee.no+"</a></td>";
					row += "<td>"+employee.name+"</td>";
					row += "<td>"+(employee.tel == null ? '-' : employee.tel) + "</td>";
					row += "<td>"+(employee.email == null? '-' : employee.email) + "</td>";
					row += "<td>"+ (employee.departmentName ==  null ? '-' : employee.departmentName) + "</td>";
					row += "<td>"+(employee.departmentLocation == null ? '-' : employee.departmentLocation)+"</td>";
					row += "<td>"+(employee.gradeName == null ? '-' : employee.gradeName)+"</td>";
					row += "<td>"+hireDate+"</td>";
					row += "</tr>";
					
					$tbody.append(row)
				})
				
				var buttons = "";
				if (!pagination.first) {
					buttons += ' <button class="w3-button w3-hover-blue" data-page-no="'+(pagination.pageNo -1)+'">&laquo;</button>';					
				}
				for (var i=pagination.beginPage; i<=pagination.endPage; i++) {
					if (pagination.pageNo == i) {
						buttons += '<button class="w3-button w3-blue" data-page-no="'+i+'">'+i+'</button>';						
					} else {
						buttons += '<button class="w3-button" data-page-no="'+i+'">'+i+'</button>';						
					}
				}
				if (!pagination.last) {
					buttons += ' <button class="w3-button w3-hover-blue" data-page-no="'+(pagination.pageNo +1)+'">&raquo;</button>';					
				}			

				$("#pagination-box").empty().html(buttons);
				
			}
		})
	};
	
	// 페이지클릭시 요청
	$("#pagination-box").on('click','button', function() {
	    var data = $(this).data("page-no");
		
		var startDate = $("#start-date").val();
		var endDate = $("#end-date").val();
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
		var pageNo = data;
		
		searchEmployees(option, keyword, startDate, endDate, pageNo);
	 })		
	
	
	$("#search-keyword").click(function(){
		
		if($("#check-option").val() == null) {
			alert("검색 옵션을 선택하세요")
			return false
		}
		if($("#check-keyword").val() == "")	{
			alert("검색어를 입력하세요")
			return false;
		}

		var startDate = $("#start-date").val();
		var endDate = $("#end-date").val();
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
		var data = $(this).data("page-no");
		var pageNo = data;
		
		searchEmployees(option, keyword, startDate, endDate,pageNo);
		
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
		
		var startDate = $("#start-date").val();
		var endDate = $("#end-date").val();
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
		var data = $(this).data("page-no");
		var pageNo = data;
	 }	
	 searchEmployees(option, keyword, startDate, endDate, pageNo);
	}); 

	
	
	// 기간 검색
	$(function(){
		var date = new Date();
		now = getFormatDate(date);
		$("#end-date").val(now);
	});
	
	function getFormatDate(date){
		var year = date.getFullYear();             
		var month = (1 + date.getMonth());             
		month = month >= 10 ? month : '0' + month;     
		var day = date.getDate();                      
		day = day >= 10 ? day : '0' + day;             
		return  year + '-' + month + '-' + day;
	}
	
	$("#sort-date li:eq(0)").click(function(){
		$("#start-date").val("1998-02-01")
		$(function(){
			var date = new Date();
			now = getFormatDate(date);
			$("#end-date").val(now);
		});
	})
	$("#sort-date li:eq(1)").click(function(){
		var today = new Date();
		var todayTime = today.getTime();
		var beforeMonth = new Date(todayTime - 60*60*24*30*1000);
		var beforeMonthDate = getFormatDate(beforeMonth);
		$("#start-date").val(beforeMonthDate);
		$(function(){
			var date = new Date();
			now = getFormatDate(date);
			$("#end-date").val(now);
		});
	})
	
	$("#sort-date li:eq(2)").click(function(){
		var today = new Date();
		var todayTime = today.getTime();
		var beforeThreeMonth = new Date(todayTime - 60*60*24*90*1000);
		var beforeThreeMonthDate = getFormatDate(beforeThreeMonth);
		$("#start-date").val(beforeThreeMonthDate);
		$(function(){
			var date = new Date();
			now = getFormatDate(date);
			$("#end-date").val(now);
		});
	})
	
	$("#search-date").click(function (){
		//var startDate = new Date( $("#start-date").val());
		//var endDate = new Date($("#end-date").val());
		
		var startDate = $("#start-date").val();
		var endDate = $("#end-date").val();
		var option = $("#check-option").val();
		var keyword = $("#check-keyword").val();
		 var data = $(this).data("page-no");
		var pageNo = data;
		
		searchEmployees(option, keyword, startDate, endDate, pageNo);
	}) 
	
	$("#register-employee").click(function (){
		window.open("/hr/employeeRegisterForm.erp","registerform","width=800,height=600, left=300,top= 200");
	})
</script>
</html>
