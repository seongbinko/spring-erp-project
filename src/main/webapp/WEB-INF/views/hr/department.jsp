<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>부서등록</title>
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
		<h1>부서등록</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-4">
					 <div><h4>부서리스트</h4></div>
				</div>
			</div>
			<br/>
			<div>
					<table id="department-list-table" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>부서코드</th>
								<th>부서명</th>
								<th>부서위치</th>
								<th>상세조회/수정/삭제</th>
							</tr>
						</thead>						
						<tbody>
							<tr v-for="dept in departments">
								<td>{{dept.no}}</td>
								<td>{{dept.name}}</td>
								<td>{{dept.location}}</td>
								<td>
									<form v-bind:id="'delete-department-' + dept.no">
										<button id="delete-department-btn" type="button" class="btn btn-default" @click="openEmployees(dept)">사원목록</button>
										<button id="modify-department-btn" type="button" class="btn btn-default"  @click="openModal(dept)"  >수정</button>
										<button id="delete-department-btn" type="button" class="btn btn-warning" @click="deleteFunction(dept)">삭제</button>
										<input type="hidden" name="no" v-model="dept.no">
									</form>
								</td>
							</tr>
					</tbody>
				</table>
			</div>	
		 	<div>
				<button id="register-department-btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#register-department-modal">부서등록</button>
		 	</div>
		</div>
		<div id="register-department-modal" class="modal fade" role="dialog">
  			<div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		     	<div class="modal-content">
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		<h1>부서등록</h1>
		      		</div>
			      	<div class="modal-body">
						<div class="row">
							<form id="add-department-form" class="form-horizontal">
							  	<div class="form-group">
							   		<label class="control-label col-sm-2">부서명</label>
							   		<div class="col-sm-6">
							    		<input type="text" class="form-control" name="name" placeholder="">
							    	 </div>
							  	</div>
							  	<div class="form-group">
							   		<label class="control-label col-sm-2" >부서위치</label>
							   		<div class="col-sm-6">
										<input class="form-control" type="text"  id="map1-address" placeholder="주소" name="location">
							    	 </div>
							    	 <div class="col-sm-2">
							    	 	<input id="search-location" class="btn btn-default" type="button" onclick="drawMap('map1', 'map1-address')" value="주소 검색"><br>
							    	 </div>
							  	</div>
								<div id="map1" style="width:550px;height:470px;margin-top:10px;display:none; left: 155px;"></div>
							</form>	
						</div>			        	
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        	<button id="add-department-button" type="button" class="btn btn-success pull-left">등록</button>
			      	</div>
		    	</div>
		  	</div>
		</div>
		 <div id="modify-department-modal" class="modal fade" role="dialog">
  			 <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		     	<div class="modal-content">
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		<h1>부서수정</h1>
		      		</div>
					<form id="modify-department-form" class="form-horizontal" action=" modifyDepartment.erp">
					  	<div class="form-group">
					   		<label class="control-label col-sm-2">부서코드</label>
					   		<div class="col-sm-5">
					    		<input type="text" class="form-control" name="no" v-model="dept.no" readonly>
					    	 </div>
					  	</div>
					  	<div class="form-group">
					   		<label class="control-label col-sm-2" >부서명</label>
					   		<div class="col-sm-5">
					    		<input type="text" class="form-control" name="name" v-model="dept.name">
					    	 </div>
					  	</div>
					  	<div class="form-group">
					   		<label class="control-label col-sm-2" >부서위치</label>
					   		<div class="col-sm-5">
								<input class="form-control" type="text"  id="map2-address" placeholder="주소" name="location" v-model="dept.location">
					    	 </div>
					    	 <div class="col-sm-2">
					    	 	<input id="search-location" class="btn btn-default pull-right" type="button" onclick="drawMap('map2', 'map2-address')" value="주소 검색"><br>
					    	 </div>
					  	</div>
						<div id="map2" style="width:550px;height:470px;margin-top:10px;display:none; left: 155px;"></div>	
					</form>
					<div class="modal-footer">
	      				<button type="button" id="modify-department-btn" class="btn btn-success pull-right">수정</button>
					</div>
		      	</div>
	    	</div>
	  	</div>
		 <div id="employee-list-modal" class="modal fade" role="dialog">
  			 <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		     	<div class="modal-content">
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		<h1 v-text="dept.name + ' 사원목록'"></h1>
		      		</div>
		      		<div class="modal-body">
						<table id="employee-list-table" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>사원번호</th>
									<th>성명</th>
									<th>연락처</th>
									<th>이메일</th>								
									<th>직급</th>	
									<th>월급</th>
									<th>입사일</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="emp in employees">
									<td>{{emp.no}}</td>
									<td>{{emp.name}}</td>
									<td>{{emp.tel}}</td>
									<td>{{emp.email}}</td>
									<td>{{emp.gradeName}}</td>
									<td>{{emp.numberWithCommaSalary}}</td>
									<td>{{emp.fmtDate}}</td>
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
</div>	
</body>
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			departments:[],
			dept: {},
			employees: []
		},
		methods: {
			openModal: function(dept) {
				this.dept = dept;
				$("#modify-department-modal").modal("show");
			},
			deleteFunction: function(dept) {
				this.dept = dept;
				$("#delete-department-"+dept.no).attr('action', 'deleteDepartment.erp');
				$("#delete-department-"+dept.no).submit();
			},
			getAllDepartments: function() {
				$.getJSON('/hr/getDepartments.erp', function(result) {app.departments=result;})
			},
			openEmployees: function(dept){
				this.dept = dept;
				var no = dept.no;
				console.log(no);
				
				
				$.getJSON('/hr/getEmployeesByDepartmentNo.erp', {no:no}, function(result) {
					app.employees=result;
				})
			
				
				$("#employee-list-modal").modal("show");
			}
			
			
		}
	});
	app.getAllDepartments();
	
	$('#add-department-button').click(function(){
		$("#add-department-form").attr('action', 'addDepartment.erp');
		$("#add-department-form").submit();
	})
	
	$('#modify-department-btn').click(function(){
		$("#modify-department-form").attr('action', 'modifyDepartment.erp');
		$("#modify-department-form").submit();
	})	
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d75bca9fff31f3a1b10f418630fdcc44&libraries=services"></script>
<script type="text/javascript">

   function drawMap(divId, addressId) {
	   
	    var mapContainer = document.getElementById(divId), // 지도를 표시할 div 
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	   
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = data.address; // 최종 주소 변수
              // 주소 정보를 해당 필드에 넣는다.
              document.getElementById(addressId).value = addr;
              // 주소로 상세 정보를 검색
              geocoder.addressSearch(data.address, function(results, status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                      var result = results[0]; //첫번째 결과의 값을 활용

                      // 해당 주소에 대한 좌표를 받아서
                      var coords = new daum.maps.LatLng(result.y, result.x);
                      // 지도를 보여준다.
                      mapContainer.style.display = "block";
                      map.relayout();
                      // 지도 중심을 변경한다.
                      map.setCenter(coords);
                      // 마커를 결과값으로 받은 위치로 옮긴다.
                      marker.setPosition(coords)

                  }
              });
          }
      }).open();
   }

</script>
</html>