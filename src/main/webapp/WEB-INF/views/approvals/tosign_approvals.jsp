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
		#table-approvals tr:hover {
			color: #5273fa;
			cursor: pointer;
		}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="approvalsidebar.jsp" %>
<div class="container-fluid col-sm-9" style="margin-left:250px; padding: 50px 0px;">
	<div class="page-header">
		<h1>처리할 결재 내역 조회</h1>
	</div>
	
	<div class="row" id="div-vue">
		<div class="col-sm-12">
			<table class="table table-bordered table-hover" id="table-approvals">
				<colgroup>
					<col width="5%">
					<col width="23%">
					<col width="35%">
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>기안일자</th>
						<th>신청 지점/매장 이름</th>
						<th>구분</th>
						<th>기안자</th>
						<th>결재자</th>
						<th>진행상태</th>
					</tr>
				</thead>
				<tbody>
					<tr v-if="approvals.length < 1">
						<td colspan="7">결재 내역이 없습니다.</td>
					</tr>
					<tr v-for="(approval, index) in approvals" @click="signApproval(index)">
						<td>{{index+1}}</td>
						<td>{{approval.fmtRequestDateWithTime}}</td>
						<td v-if="approval.storeName != null">{{approval.storeName}}</td>
						<td v-if="approval.storeName == null">{{approval.storageName}}</td>
						<td>{{approval.typeName}}</td>
						<td>{{approval.requesterName}}</td>
						<td>{{approval.responserName}}</td>
						<td>
							<a href="#" :class="getActiveClass(approval.status)">{{approval.status}}</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-sign" role="dialog">
    <div class="modal-dialog modal-lg">
    	<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
         			<h4 class="modal-title">결재 승인</h4>
       		</div>
       		<div class="modal-body">
       			<table class="table table-bordered">
       				<tbody>
       					<tr>
       						<th>결재 요청일</th>
       						<td>{{approval.fmtRequestDateWithTime}}</td>
       						<th>결재 종류</th>
       						<td>{{approval.typeName}}</td>
       					</tr>
       					<tr>
       						<th>결재 요청직원</th>
       						<td>{{approval.requesterName}}</td>
       						<th>요청 매장/창고</th>
       						<td v-if="approval.storeName != null">{{approval.storeName}}</td>
							<td v-if="approval.storeName == null">{{approval.storageName}}</td>
       					</tr>
       				</tbody>
       			</table>
       			<label>요청 내용</label>
       			<table class="table table-bordered table-hover">
       				<thead>
       					<tr>
       						<th></th>
       						<th>제품명</th>
       						<th>가격</th>
       						<th>카테고리명</th>
       						<th>주문수량</th>
       					</tr>
       				</thead>
       				<tbody>
       					<tr v-for="(item, index) in orderItems">
       						<td>{{index +1}}</td>
       						<td>{{item.productName}}</td>
       						<td>{{item.productPrice | currency}} 원</td>
       						<td>{{item.categoryName}}</td>
       						<td>{{item.amount}} 개</td>
       					</tr>
       				</tbody>
       			</table>
       			<label>비고</label>
       			<textarea rows="5" style="width: 100%" id="textarea-note" placeholder="승인/반려에 대한 메모 작성"></textarea>
       		</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal" id="btn-cancel">취소</button>
          		<button type="button" class="btn btn-danger" data-dismiss="modal" id="btn-deny">반려</button>
          		<button type="button" class="btn btn-primary" data-dismiss="modal" id="btn-accept">승인</button>
        	</div>
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
		},
		methods: {
			getActiveClass: function(status) {
				if(status == '결재대기중') {
					return status = 'btn btn-warning btn-sm';
				}
				if(status == '결재완료') {
					return status = 'btn btn-success btn-sm';
				}
				if(status == '반려') {
					return status = 'btn btn-danger btn-sm';
				}
				
			},
			signApproval: function(index) {
				signApp.approval = {};
				signApp.orderItems = [];
				$("#textarea-note").val('');
				var item = approvalApp.approvals[index];
				signApp.approval = item;
				if(item.typeNo == 20) {
					var factoryOrderNo = item.factoryOrderNo;
					
					$.getJSON("/approvals/getFactoryOrderItem.erp", {factoryOrderNo:factoryOrderNo})
					.done(function(result) {
						signApp.orderItems = result;
					})
				}
				
				if(item.typeNo == 10) {
					var orderNo = item.orderNo;
					
					$.getJSON("/approvals/getOrderItem.erp", {orderNo:orderNo})
					.done(function(result) {
						signApp.orderItems = result;
					})
				}
				$("#modal-sign").modal();
			}
		}
	})
	// 전체 내역 받아와서 뿌리기
	function getAllApproval() {
		$.getJSON("/approvals/getToSignapprovals.erp") 
			.done(function(result) {
			approvalApp.approvals = result;
		})
	}
	
	var signApp = new Vue({
		el:"#modal-sign",
		data: {
			approval:{},
			orderItems:[]
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
	// 모달의 취소버튼 클릭
	$("#btn-cancel").click(function() {
		signApp.approval = {};
		signApp.orderItems = [];
	})
	// 모달의 승인버튼 클릭
	$("#btn-accept").click(function() {
		var note = $("#textarea-note").val();
		var approvalNo = signApp.approval.approvalNo;
		var orderNo = signApp.approval.orderNo;
		var factoryOrderNo = signApp.approval.factoryOrderNo;
		$.getJSON("/approvals/sign.erp", {note:note, approvalNo:approvalNo, 
			orderNo:orderNo, factoryOrderNo:factoryOrderNo }, function() {})
		signApp.approval = {};
		signApp.orderItems = [];
		getAllApproval();
		window.location.reload();
	})
	// 모달의 반려 버튼 클릭
	$("#btn-deny").click(function() {
		signApp.approval = {};
		signApp.orderItems = [];
	})
	
	getAllApproval();
</script>
</body>
</html>