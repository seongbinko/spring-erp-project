<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>인원현황</title>
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
		<h1 style="text-align: center;"><strong>인원 현황</strong></h1>
		<button class="btn btn-xs btn-primary pull-right" @click="getPersonnelStatus(searchYear)">검색</button>
		<input class="pull-right" type="text" name="year" placeholder="연도입력" v-model="searchYear">
		<br/>
	</div>
	<div>
		<table class="table table-bordered">
			<caption>
				<span style="font-size:x-large; font-weight: bold;">인원 현황</span>
				<span class="pull-right">(연말 기준, 명)</span>
			</caption>
			<thead>
				<tr>
					<th rowspan="2">재직원</th>
					<th rowspan="2">입사원</th>
					<th colspan="2">입사인원 상세</th>
					<th rowspan="2">총원</th>
				</tr>
				<tr>
					<th>경력</th>
					<th>신입</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{{totalStatus.incumbent}}</td>
					<td>{{totalStatus.newComer}}</td>
					<td>{{totalStatus.newbie}}</td>
					<td>{{totalStatus.newSenior}}</td>
					<td>{{totalStatus.totalStatus}}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table class="table table-bordered table-striped" >
			<caption>
				<span style="font-size:x-large; font-weight: bold;">부서별 인원현황</span>
				<span class="pull-right">(연말 기준, 명)</span>
			</caption>
			<thead>
				<tr>
					<th rowspan="2">부서</th>
					<th rowspan="2">재직원</th>
					<th colspan="2">재직인원상세</th>
				</tr>
				<tr>
					<th>정규직</th>
					<th>인턴</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="dept in totalStatusByDepts">
					<td><strong>{{dept.department}}</strong></td>
					<td>{{dept.incumbent}}</td>
					<td>{{dept.fullTimer}}</td>
					<td>{{dept.partTimer}}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table class="table table-bordered">
			<caption>
				<span style="font-size:x-large; font-weight: bold;">직급별 인원현황</span>
				<span class="pull-right">(연말 기준, 명)</span>
			</caption>
			<thead>
				<tr>
					<th>구분</th>
					<th>임원</th>
					<th>부장</th>
					<th>차장</th>
					<th>과장</th>
					<th>대리</th>
					<th>사원</th>
					<th>인턴</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><strong>인원</strong></td>
					<td>{{totalStatusByGrade.director}}</td>
					<td>{{totalStatusByGrade.manager}}</td>
					<td>{{totalStatusByGrade.subManager}}</td>
					<td>{{totalStatusByGrade.seniorAssistant}}</td>
					<td>{{totalStatusByGrade.assistant}}</td>
					<td>{{totalStatusByGrade.staff}}</td>
					<td>{{totalStatusByGrade.intern}}</td>
					<td><strong>{{totalStatusByGrade.totalStatus}}</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			searchYear: "",
			totalStatus: {},
			totalStatusByGrade: {},
			totalStatusByDepts:[]
		},
		methods: {
			getPersonnelStatus: function(searchYear) {
				$.getJSON("/hr/getPersonnelStatus.erp", {year:searchYear}, function(result){
					app.totalStatus = result.totalStatus;
					app.totalStatusByGrade = result.totalStatusByGrade;
					app.totalStatusByDepts = result.totalStatusByDepts;
				})
			}
		}
	})
	app.getPersonnelStatus(new Date().getFullYear());
</script>
</html>