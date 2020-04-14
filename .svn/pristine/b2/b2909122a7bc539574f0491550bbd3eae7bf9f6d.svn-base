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
		th {
			background-color: #f2f2f2;	
		}
		.text-info {
			font-weight: bold;
			cursor: pointer;
		}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="smsidebar.jsp" %>
<div class="container-fluid col-sm-9" style="margin-left:250px; padding: 50px 0px;">
	<div class="page-header">
		<h1>지점 조회하기</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th></th>
						<th>지점명</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>담당 매니저</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="store" items="${stores }" varStatus="loop">
						<tr>
							<td>${loop.count }</td>
							<td>${store.storeName }</td>
							<td>${store.storeAddress }</td>
							<td>${store.storeTel }</td>
							<c:choose>
								<c:when test="${not empty store.employeeName }">
									<td class="text-info" onclick="showManager(${store.employeeNo })" data-toggle="modal"
										data-target="#modal-product-detail">${store.employeeName }</td>
								</c:when>
								<c:otherwise>
									<td>없음</td>
								</c:otherwise>
							</c:choose>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-store-empdetail" role="dialog">
    <div class="modal-dialog modal-lg">
    	<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title">매니저 상세정보</h4>
        		</div>
        		<div class="modal-body">
        			<div class="row">
	        			<div class="col-sm-1">
	        				<img :src="'../resources/images/employee/' + employee.imageName" 
	        						style="width: 150px; height: 230px; margin-left:30px;">
	        			</div>
	        			<div class="col-sm-offset-2 col-sm-9">
			        		<table class="table table-bordered">
			        			<tbody>
			        				<tr>
			        					<th>부서명</th>
			        					<td>{{employee.departmentName}}</td>
			        				</tr>
			        				<tr>
			        					<th>연락처</th>
			        					<td>{{employee.tel}}</td>
			        				</tr>
			        				<tr>
			        					<th>이메일</th>
			        					<td>{{employee.email}}</td>
			        				</tr>
			        				<tr>
			        					<th>직급</th>
			        					<td>{{employee.gradeName}}</td>
			        				</tr>
			        			</tbody>
			        		</table>
	        			</div>
        			</div>
        		</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
        	</div>
      	</div>
   	</div>
</div>
<script type="text/javascript">
	var managerApp = new Vue({
		el:"#modal-store-empdetail",
		data: {
			employee:{}
		}
	})

	function showManager(no) {
		$.getJSON("/storemanagement/storeManagerDetail.erp", {no:no}, function(result) {
			managerApp.employee = result;
		})
		$("#modal-store-empdetail").modal();
	}
</script>
</body>
</html>