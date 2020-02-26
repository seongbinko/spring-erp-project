<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>근태입력</title>
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
<div class="container">
	<div class="page-header">
		<h1>근태입력</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-4">
					 <div><h4>근태입력</h4></div>
				</div>
			</div>
			<br>
			<div>
				<form id="management-registerform" >
					<div class="table-responsive">
						<table class="table table-condensed" id="management-table">
							<thead>
								<tr>
									<th>근태일</th>
									<th>사번</th>
									<th>성명</th>
									<th>근태타입</th>
									<th>근태수</th>
								</tr>
							</thead>
							<tbody></tbody>
						 </table>
					 </div>
					 <br>
					 <button class="btn btn-default" type="reset" >초기화</button>
					 <button id="add-btn" class="btn btn-default" type="button">추가</button>
					 <button id="delete-btn" class="btn btn-default" type="button">삭제</button>
					 <button id="save-btn" class="btn btn-default" type="button">저장</button>
				 </form>
			 </div>
				 <form>
					 <div id="employee-list-modal" class="modal fade" role="dialog">
			 			<div id="app">
			  			 	<div class="modal-dialog modal-lg">
						     	<div class="modal-content">
						      		<div class="modal-header">
				        				<div class="input-group">
					        				<div class="input-group btn pull-right">
				        					<input v-on:keydown.enter.prevent="searchOneEmployeeByNo(no)" type="text" class="form-control" placeholder="사원번호 검색" v-model="no">
					        					<button class="btn btn-default" type="button" @click="searchOneEmployeeByNo(no)">
					        						<i class="glyphicon glyphicon-search"></i>
					        					</button>
					        				</div>
				        				</div>
						      		</div>
						      		<div class="modal-body">
										<table id="employee-list-table" class="table table-bordered table-hover">
											<thead>
												<tr>
													<th>사원번호</th>
													<th>성명</th>
													<th>이전 직급코드</th>
													<th>이전 직급</th>						
													<th>이전 부서코드</th>								
													<th>이전 부서</th>
													<th>선택</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>{{employee.no}}</td>
													<td>{{employee.name}}</td>
													<td>{{employee.gradeNo}}</td>
													<td>{{employee.gradeName}}</td>
													<td>{{employee.departmentNo}}</td>
													<td>{{employee.departmentName}}</td>
													<td>
														<button v-if="employee.no" type="button" class="btn btn-default pull-right" @click="insertEmp()">선택</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
						      				<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
									</div>
						      	</div>
				    		</div>
					 	</div>
				  </div>
			 </form>
		</div>	
	</div>
</div>
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			employee: {},
			no:"",
			selectedRowNo:""
		},
		methods: {
			searchOneEmployeeByNo: function(no){
				$.getJSON('/hr/searchOneEmployeeByNo.erp',{no:no},function(result){app.employee=result;})
			},
			insertEmp: function() {
				var $tr = $('#management-table tbody tr').eq(app.selectedRowNo);
				$tr.find("td:eq(1) input").val(app.employee.no);
				$tr.find("td:eq(2) input").val(app.employee.name);
				$("#employee-list-modal").modal("hide");
				app.employee = "";
				app.no = "";
			}
		}
	});
	//내가누른게 내부모에서 몇번쨰를계산 버튼이몇번째인지 알수없음.
	$("#add-btn").click(function(){
		var row = "";
		row += "<tr>"
		row += "<td><input type='date' name='managementDate'></td>"
		row += "<td><input type='text' name='employeeNo'></td>"
		row += "<td><input type='text' name='employeeName'></td>"
		row += "<td><input type='text' name='managementType'></td>"
		row += "<td><input type='number' name='managementAmount'></td>"
		row += "</tr>"
		
		$('#management-table tbody').append(row);
	})
	$("#delete-btn").click(function(){
		$("tbody tr:last").remove();
	})
	
	$("#management-table tbody").on('click', ":input[name='employeeNo']",function(){
		app.selectedRowNo = $(this).closest("tr").index();
		$("#employee-list-modal").modal("show");
	})
	//$('#password').tooltip({'trigger':'focus', 'title': 'Password tooltip'});
	
	$("#management-table tbody").on('mouseover', ":input[name='managementType']",function(){
		$(this).tooltip({'trigger':'focus', 'title': '[선택] 야근,지각,휴가'});
	})
	
	
	
	$("#save-btn").on('click',function (){
		var hasEmptyInput = false;
		$("#management-registerform :input[type=text]").each(function(index, item) {
			console.log('값', $(item).val());
			if (!$(item).val()) {
				hasEmptyInput = true;
			}
		});
		console.log(hasEmptyInput);
		if (hasEmptyInput) {
			alert("입력되지 않은 필드가 있습니다.");
			return;
		} 
		$("#management-registerform").attr('action','add_management.erp')
		alert("등록 완료")			
		$("#management-registerform").submit();
	})
	
</script>
</body>
</html>