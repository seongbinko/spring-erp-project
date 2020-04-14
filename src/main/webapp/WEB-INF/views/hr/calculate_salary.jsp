<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>급여계산/대장</title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../common/nav.jsp" %>
<%@include file="hr_sidebar.jsp" %>
<div class="container">
	<div class="page-header">
		<h1 style="text-align: center">급여계산</h1>
	</div>
	<div class="row">
		<form id="add-payroll-table" class="form-horizontal" action="">
		  	<div class="form-group">
		   		<label class="control-label col-sm-2">지급일</label>
		   		<div class="col-sm-10">
		    		<input type="date" class="form-control" name="payDate">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2">지급월</label>
		   		<div class="col-sm-10">
		    		<input id="payMonth" type="text" class="form-control" name="payMonth" placeholder="ex)2020-02">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >지급구분</label>
		   		<div class="col-sm-10">
			   		<input id="paymentType" type="text" class="form-control" name="type">
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >대상인원</label>
		   		<div class="col-sm-10">
			   		<div class="input-group">
			    		<input  id="selected_amount" type="number" class="form-control" name="selectedAmount" readonly="readonly">
			    		<div class="input-group-btn">
					      	<button id="fix-attendance-btn" class="btn btn-default" type="button">출근기록 확정</button>
					    </div>
			    	 </div>
		    	 </div>
		  	</div>
		  	<div class="form-group">
		   		<label class="control-label col-sm-2" >총급여</label>
		   		<div class="col-sm-10">
			   		<div class="input-group">
			    		<input id="total-payment" type="number" class="form-control" name="totalSalary" readonly="readonly">
			    		<div class="input-group-btn">
					      	<button id="calculate-btn" class="btn btn-default" type="button">계산</button>
					    </div>
			    	 </div>
		    	 </div>
		  	</div>
  			<div class="form-group">
    			<div class="col-sm-offset-2 col-sm-10">
      				<button type="button" id="btn-register" class="btn btn-primary pull-right">등록</button>
      				<button type="reset" class="btn btn-warning pull-left">초기화</button>
    			</div>
    		</div>    		
		</form>
	</div>		
</div>

<form id="my-form"></form>
</body>
<script type="text/javascript">
	var selectedEmpNos = [];
	
	$("#fix-attendance-btn").click(function(){
		var payMonth = $("#payMonth").val();
		$.ajax({
			type: "get",
			url : "/hr/attendanceFixed.erp",
			data: {payMonth : payMonth},
			dataType : "json",
			success : function(result) {
				
				$.each(result, function(index, employee) {
					if (!selectedEmpNos.includes(employee.employeeNo)) {
						selectedEmpNos.push(employee.employeeNo);
					}
				})
				$("#selected_amount").val(selectedEmpNos.length);
			}
		})			
	})
	
	$("#calculate-btn").click(function(){
		var payMonth = $("#payMonth").val();
		var paymentType = $("#paymentType").val();
		
		var $form = $("#my-form");
		$form.append('<input type="hidden" name="payMonth" value="'+payMonth+'">');
		$form.append('<input type="hidden" name="payType" value="'+paymentType+'">');
		$.each(selectedEmpNos, function(index, item) {
			$form.append('<input type="hidden" name="empNos" value="'+item+'">');
		})
	
		
		$.ajax({
			type: "get",
			url: "/hr/calculateTotalPayment.erp",
			data: $form.serialize(),
			dataType: "text",
			success: function(result) {
				$("#total-payment").val(result);
			}
		})
	})
	
	$("#btn-register").click(function(){
		alert("등록완료");
		$("#add-payroll-table").attr('action','registerPayroll.erp').submit();
	})
	
	
</script>
</html>