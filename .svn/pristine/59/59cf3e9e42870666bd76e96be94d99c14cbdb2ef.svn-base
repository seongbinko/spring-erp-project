<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>급여 지급조회</title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<%@include file="../common/nav.jsp" %>
<%@include file="hr_sidebar.jsp" %>
<div class="container" id="app">
	<div class="page-header">
		<h1>급여 지급조회</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-4">
				 	<div><h4>급여 지급조회 검색결과: {{pagination.totalRows}}명</h4></div>
				</div>

			</div>
			<br/>
			<div>
				<form id="delete-form">
					<table id="payroll-list-table" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>발령번호</th>
								<th>지급월</th>
								<th>발령구분</th>								
								<th>지급인원</th>
								<th>지급액</th>
								<th>지급일자</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="pay in payrollTables">
								<td>{{pay.payrollNo}}</td>
								<td>{{pay.payrollMonth}}</td>
								<td>{{pay.payrollType}}</td>
								<td>{{pay.payrollCount}}</td>
								<td>{{pay.payrollAmount}}</td>								
								<td>{{pay.payrollDate}}</td>								
							</tr>
						</tbody>
					</table>
				</form>
			</div>	
			<div>
				<div>
					<div class="pull-right">
						<div class="dropdown">
			  				<button class="btn btn-default" type="button">날짜입력</button>
							<input id="start-date" type="date" class="btn btn-default" value="1998-02-01" v-model="param.startDate"/> 
							<input id="end-date" type="date" class="btn btn-default" v-model="param.endDate"/>
							<button id="search-date" type="button" class="btn btn-primary" @click="searchDateBtn(param)">검색</button>
						</div>					
					</div>
				</div>
			</div>
	 	</div>
	</div>
	<br/>
	<div class="w3-center">
		<div class="w3-bar w3-border w3-round" id="pagination-box">
			<button class="w3-button w3-hover-blue" v-if="pagination.pageNo != 1" @click="prevPage(pagination.pageNo)" >&laquo;</button>
			<span class="page-count">{{pagination.pageNo}}/{{pagination.endPage}}</span>
			<button class="w3-button w3-hover-blue" v-if="pagination.pageNo != pagination.endPage" @click="nextPage(pagination.pageNo)">&raquo;</button>
		 </div>
	</div>	
</div>
</body>
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			param: {
				startDate: "1998-02-01",
				endDate: getFormatDate(new Date()),
				pageNo: 1
			},
			payrollTables: [],
			pagination: {}
		},
 		methods: {
 			searchPayrollTables: function(param) {
				$.getJSON('/hr/searchPayrollTables.erp', param,function(result){
					var x = result.payrollTables;
					
					for(i=0; i<x.length; i++) {
						 
						x[i].payrollDate = getFormatDate(new Date(x[i].payrollDate));
						x[i].payrollMonth = getFormatMonth(new Date(x[i].payrollMonth))
					}
					app.payrollTables = x;
					app.pagination = result.pagination;
					
				})
			},
			searchDateBtn: function(param) {
				app.searchPayrollTables(param)
			},
			nextPage: function(value) {
				var pageNo2 = value + 1;
				app.param.pageNo = pageNo2;
				app.searchPayrollTables(app.param);
			},
			prevPage: function(value) {
				var pageNo2 = value + -1;
				app.param.pageNo = pageNo2;
				app.searchPayrollTables(app.param);
			}
 		}
	});
	app.searchPayrollTables();
	
	function getFormatDate(date){
		var year = date.getFullYear();             
		var month = (1 + date.getMonth());             
		month = month >= 10 ? month : '0' + month;     
		var day = date.getDate();                      
		day = day >= 10 ? day : '0' + day;             
		return  year + '-' + month + '-' + day;
	}
	function getFormatMonth(date) {
		var month = (1+ date.getMonth());
		month = month >= 10 ? month : '0' + month;
		return month + '월';
	}
</script>
</html>