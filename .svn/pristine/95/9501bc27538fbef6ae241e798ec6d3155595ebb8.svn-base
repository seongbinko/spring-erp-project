<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="/resources/js/datepicker.js"></script>
	<style type="text/css">
		#div-stock thead { background-color: #99ccff; }
		#div-stock thead tr th { text-align: center; }
		#div-stock tbody { background-color: white; }
		#div-orderlist thead { background-color: #99ccff; }
		#div-orderlist thead tr th { text-align: center; }
		#div-orderlist tbody { background-color: white; }
		#tbody-orderlist input{
			border: 0px;
			width: 80%;
			text-align: right;
		}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="stocksidebar.jsp" %>
<div class="container-fluid col-sm-9" style="margin-left:250px; padding: 50px 0px;">
	<div class="page-header">
		<h1>생산 의뢰</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12" id="div-vue">
			<form class="well" method="post">
				<div class="form-group">
					<label>매장 선택</label>
					<select id="select-storages" class="form-control" name="storage">
						<option disabled selected> --지점을 선택하세요 -- </option>
						<c:forEach var="storage" items="${storages }">
							<option value="${storage.no }"> ${storage.name } </option>
						</c:forEach>
					</select>
				</div>
				<div id="div-stock">
				<label>매장 재고상황</label>
					<table class="table table-bordered">
							<colgroup>
								<col width="5%">
								<col width="35%">
								<col width="15%">
								<col width="20%">
								<col width="15%">
								<col width="10%">
							</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>제품명</th>
								<th>제품가격</th>
								<th>카테고리명</th>
								<th>출시일</th>
								<th>수량</th>
							</tr>
						</thead>
						<tbody class="text-right">
							<tr v-for="(stock, index) in stocks">
								<td>{{index +1}}</td>
								<td>{{stock.productName}}</td>
								<td>{{stock.productPrice | currency}} 원</td>
								<td>{{stock.categoryName}}</td>
								<td>{{stock.fmtProductCreateDate}}</td>
								<td>{{stock.amount | currency }} 개</td>
							</tr>
							<tr v-if="stocks.length == 0">
								<td colspan="6" class="text-center">재고가 존재하지 않습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr/>
				<div class="form-group">
					<label>상위 카테고리 선택</label>
					<select id="select-upper-category" class="form-control">
							<option disabled selected id="option-upper-category-default">-- 상위 카테고리를 선택하세요 --</option>
						<c:forEach var="upcat" items="${upperCategories }">
							<option value="${upcat.no }" >${upcat.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>하위 카테고리 선택</label>
					<select id="select-sub-category" class="form-control">
						<option disabled selected id="sub-default">-- 하위 카테고리를 선택하세요 --</option>
						<option v-bind:value="cate.no" v-for="cate in categories">{{cate.name}}</option>
					</select>
				</div>
				<div class="form-group">
					<label>제품 선택</label>
					<select id="select-product" class="form-control">
						<option disabled selected id="product-default">-- 제품을 선택하세요 --</option>
						<option v-bind:value="product.no" v-for="product in products">{{product.name}}</option>
					</select>
				</div>
				<div id="product-detail">
					<div class="form-group">
						<label>제품 명</label>
						<input type="hidden" v-bind:value="detail.no" id="product-no" class="form-control" >
						<input type="text" v-bind:value="detail.name" id="product-name" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>제품 가격</label>
						<input type="text" v-bind:value="detail.price | currency" class="form-control" id="input-price" readonly>
					</div>
					<div class="form-group">
						<label>제품 출시일</label>
						<input type="text" v-bind:value="detail.fmtDate" id="product-createDate" class="form-control" 
						id="datepicker" autocomplete="off" readonly>
					</div>
				</div>
				<div class="text-right">
					<button type="button" class="btn btn-success" id="btn-add">제품 추가하기</button>
				</div><hr/>
			</form>
			<form class="well" method="post" action="request_order.erp" id="form-orderlist">	
				<div class="form-group" id="div-orderlist">
					<label>생산 의뢰할 제품 리스트</label>
					<table class="table table-bordered">
						<colgroup>
							<col width="5%">
							<col width="30%">
							<col width="20%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="5%">
						</colgroup>
						<thead style="text-align: center;">
							<tr>
								<th></th>
								<th>제품명</th>
								<th>카테고리명</th>
								<th>제품 가격</th>
								<th>출시일</th>
								<th>수량</th>
								<th></th>
							</tr>
						</thead>
						<tbody class="text-right" id="tbody-orderlist">
							<tr v-for="(order, index) in orderlist">
								<td style="text-align: center;">{{index+1}}</td>
								<td><input type="hidden" name="productNo" v-bind:value="order.no">{{order.name}}</td>
								<td>{{order.categoryName}}</td>
								<td>{{order.price | currency}} 원</td>
								<td>{{order.fmtDate}}</td>
								<td><input type="number" style="width:50px;" name="amount" v-model="amounts[index]">개</td>
								<td><button type="button" class="btn btn-sm btn-danger" @click="removeOrder(index)">삭제</button></td>
							</tr>
						</tbody>
					</table>
						<input type="hidden" name="storageNo" v-bind:value="storage.no">
				</div>
			</form>
		<div class="text-right">
			<button class="btn btn-primary" id="btn-complete-order">생산 주문서 기안</button>
		</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//상위 카테고리 선택시 하위 카테고리 AJAX로 받기
	var vueApp = new Vue({
		el:"#div-vue",
		data: {
			categories:[],
			products:[],
			detail:{},
			stocks:[],
			storage:{},
			orderlist:[],
			amounts:[]
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
			removeOrder: function(index) {
				vueApp.orderlist.splice(index, 1);
				vueApp.amounts.splice(index, 1);
			}
		}
	})
	// 상위 카테고리 선택시 하위 카테고리 정보 뷰에 전달
	$("#select-upper-category").change(function() {
		var no = this.value;
		if(isEmpty(vueApp.storage)) {
			alert("창고를 선택하세요.");
			$("#option-upper-category-default").prop("selected", true);
			return false;
		}
		
		$("#sub-default").prop("selected", true);
		$("#product-default").prop("selected", true);
		
		resetProduct();
				
		 $.getJSON("/products/subcategory.erp", {uppercateno:no}, function(result) {
			 vueApp.categories = result;
			 
			 vueApp.products.splice(0, vueApp.products.length);
			 vueApp.detail = {};
		});
		
	})
	// 하위 카테고리 선택시 제품 리스트 뷰에 전달
	$("#select-sub-category").change(function() {
		var no = this.value;
		$("#product-default").prop("selected", true);
		resetProduct();
		vueApp.products = [];
		
		$.getJSON("/products/categoryproducts.erp", {categoryno:no}, function(result) {
			vueApp.products = result;
			vueApp.detail = {};
			
		});
	})
	
	// 해당 제품 선택시 상세정보 AJAX로 받기
	// 변경할 하위 카테고리 리스트를 같이 AJAX로 받는다.
	$("#select-product").change(function() {
		var no = this.value;
		
		resetProduct();
		
		$.getJSON("/products/productdetail.erp", {productno:no}, function(result) {
			vueApp.detail = result;
		});
	})
	
	function resetProduct() {
		//$("#input-price").val("");
		//$("#product-name").val("");
		//$("#product-createDate").val("");
		vueApp.detail = {};
	}
	
	// 지점 선택시 ajax로 지점 정보, 매니저 정보를 불러온다.	
	$("#select-storages").change(function() {
		resetProduct();
		$("#option-upper-category-default").prop("selected", true);
		$("#sub-default").prop("selected", true);
		$("#product-default").prop("selected", true);
		var no = this.value;
		
		$.getJSON("/stock/storagedetail.erp", {no:no}, function(result) {
			vueApp.storage = result;
		}) 
		
		$.getJSON("/stock/storageStocks.erp", {storageNo:no})
			.done(function(result) {
				vueApp.stocks = result;
			})
	})
	
	// 추가버튼 클릭시 동작
	$("#btn-add").click(function() {
		if(isEmpty(vueApp.detail)) {
			alert("제품을 선택하세요.");
			return false;
		}
		
		for(var i=0; i<vueApp.orderlist.length; i++) {			
			if(vueApp.detail.no == vueApp.orderlist[i].no) {
				alert("이미 주문리스트에 존재하는 상품입니다.");
				return false;
			}
		} 
		
		var item = vueApp.detail;
		vueApp.orderlist.push(item);
		vueApp.amounts.push(0);
	})
	
	
	$("#btn-complete-order").click(function() {
		var storageNo = vueApp.storage.no;
		if(isEmpty(vueApp.storage)) {
			alert("창고를 먼저 선택하세요.");
			return false;
		}
		if(isEmpty(vueApp.detail)) {
			alert("제품을 선택하세요");
			return false;
		}
		if(isEmpty(vueApp.orderlist)) {
			alert("생산 의뢰 리스트에 아무 제품도 등록되지 않았습니다.");
			return false;
		}
		
		var isEmptyAmount = false;
		for(var i=0; i<vueApp.amounts.length; i++) {
			if(vueApp.amounts[i] == '0') {
				isEmptyAmount = true;
			}
		}
		if(isEmptyAmount) {
			alert("수량이 미 입력된 제품이 존재합니다.");
			return false;
		}
		
		$("#form-orderlist").submit();
	})
	
	// 비어있는지 여부를 파악하는 함수
	function isEmpty(value) { 
		if( value == "" || value == null || value == undefined || ( value != null 
			&& typeof value == "object" && !Object.keys(value).length ) ){ 
				return true;
			}else { 
				return false; 
			} 
		};
</script>
</body>
</html>