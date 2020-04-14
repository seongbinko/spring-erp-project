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
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<style type="text/css">
		td {
			text-align: center;
		}
		th {
			text-align: center;
			background-color: #f2f2f2;
		}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="productsidebar.jsp" %>
<div class="container-fluid col-sm-9" style="margin-left:250px; padding: 50px 0px;">
	<div class="page-header">
		<h1>결재 처리</h1>
	</div>
	
	<div class="row" id="div-vue">
		<div class="col-sm-12">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default">내 기안 전체</button>
				<button type="button" class="btn btn-warning">대기 중인 내 기안</button>
				<button type="button" class="btn btn-success">처리된 내 기안</button>
				<button type="button" class="btn btn-warning">결재할 기안</button>
				<button type="button" class="btn btn-primary">내가 결재한 기안</button>
			</div>
		</div>
	</div><hr/>
	<div class="row">
		<div class="col-sm-12">
			<table class="table table-bordered">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="38%">
					<col width="8%">
					<col width="12%">
					<col width="12%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>기안일자</th>
						<th>제목</th>
						<th>구분</th>
						<th>기안자</th>
						<th>결재자</th>
						<th>진행상태</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(approval, index) in approvals">
						<td>{{index+1}}</td>
						<td>{{approval.requestDate}}</td>
						<td>신천 매장 물품 발주 신청</td>
						<td>발주</td>
						<td>매니저1</td>
						<td>이응수</td>
						<td>결재대기</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	var approvalApp = new Vue({
		el:"#div-vue",
		data: {
			approvals: []
		},
		filters: {
			currency: function(value) {
				if(isNaN(value)) {
					return value;
				}
				return new Number(value).toLocaleString();
			}
		}
	})
	
	$.getJSON("/approval/myapprovals.erp", {}, function() {
		
	})
</script>
</body>
</html>