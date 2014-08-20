<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>饮食管理</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>饮食管理</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form id="diet" action="list.do" method="post" modelAttribute="dietReq" cssClass="form-inline">
					<%-- --%>
					<label>类型
						<select style="width: 80px;" class="main" name="type" onchange="mainSelect(this)">
							<option>所有</option>
							<codetable:option table="<%=ParamConstants.BEHAVIOR_TYPE %>"/>
						</select>
					</label>
					<label>子类型
						<select style="width: 80px;" class="main" name="subType" id="subType">
							<option>所有</option>
							<c:forEach end="0" var="type" items="${mdata:get('PARAMETER_MAP')['BEHAVIOR_TYPE'] }">
								<codetable:option table="${type.key }"/>
							</c:forEach>
						</select>
					</label>
					
					<label for="from">日期
						<form:input path="startDate" cssClass="input-small Wdate" onclick="WdatePicker()"/>
					</label>
					<label for="to">至
						<form:input path="endDate" cssClass="input-small Wdate" onclick="WdatePicker()"/>
					</label>
					
					<div class="btn-group">
						<form:hidden path="current"/>
						<form:hidden path="pageSize"/>
						<a href="#" onclick="$('#diet').submit(); return false;" class="btn">查询</a>
						<a href="add.do" class="btn">新增</a>
					</div> 
					
				</form:form>
				<table class="table table-hover">
					
					<thead>
						<tr>
							<th style="width: 10%">日期</th>
							<th style="width: 10%">天气</th>
							<th style="width: 70%">详情</th>
							<th style="width: 10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${paginationBean.dataList }" var="dietMaster">
							<tr>
								<td>${dietMaster.day}</td>
								<td>${dietMaster.city}<br>${dietMaster.weather}<br>${dietMaster.temperature}℃</td>
								<td>
									<c:forEach items="${dietMaster.dietRecordList }" var="dietRecordSubList" varStatus="status">
										
										<div style="float: left; margin: 0px 30px 0px 0px;">
											${mdata:get("PARAMETER_MAP")["BEHAVIOR_TYPE"][dietRecordSubList[status.index].type] } + 
											<table>
												<c:forEach items="${dietRecordSubList }" var="dietRecord">
													<tr>
														<td>
															<joda:format value="${dietRecord.timeStart }" pattern="HH:mm"/>
															-
															<joda:format value="${dietRecord.timeEnd }" pattern="HH:mm"/>
														</td>
														<td>${mdata:get("PARAMETER_MAP")[dietRecord.type][dietRecord.subType]}</td>
														<td>${dietRecord.desc }</td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</c:forEach>
								</td>
								<td>
									<a href="modify.do?id=${dietMaster.id}" class="btn">修改</a>
									<a href="javascript:remove('${dietMaster.id}');" class="btn btn-danger">删除</a>
								</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="4" form-id="diet" class="paginationPanel">${paginationBean.fullDisplay}</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="modal" class="modal hide fade">
	<div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	  <h3>删除数据</h3>
 	</div>
	<div class="modal-body">
	  <p>真的要删除该数据吗？</p>
	</div>
    <div class="modal-footer">
      <a href="#" class="btn btn-primary" data-dismiss="modal">否</a>
      <a class="btn" href="javascript: remove()">是</a>
    </div>
</div>

<script type="text/javascript">
	var Model = {
			Types:{
				BEHAVIOR_TYPE:<codetable:json table="<%=ParamConstants.BEHAVIOR_TYPE %>" type='Object'/>
			},
			options: function(type){
				var subType = this.Types[type];
				if(!subType){
					return "";
				}
				
				var options = "";
				for(var i =0 ; i < subType.length; i++){
					options += "<option value='"+subType[i].key+"'>"+subType[i].value+"</option>"
				}
				
				return options;
			}
	};
	
	(function ModelTypeInit(){
		 <c:forEach items="${mdata:get('PARAMETER_MAP')['BEHAVIOR_TYPE'] }" var="behaviorType">
			var ${behaviorType.key } = <codetable:json table="${behaviorType.key }" type='Object' none="null"/> ;
			var subTypeKey = ${behaviorType.key } ;
			if(subTypeKey !== null && subTypeKey !== '' && subTypeKey !== undefined && subTypeKey !== "undefined"){
				Model.Types['${behaviorType.key }'] = ${behaviorType.key };
			}
		</c:forEach>
	})();
	
	function mainSelect(mainSelect){
		$("#subType").html("<option>所有</option>"+Model.options(mainSelect.value));
	}
</script>
<script type="text/javascript">
function remove(id){
	
	if(id){
		$('#modal').modal();
		$('#modal').data('id', id);
	}else{
		$('#modal').modal('hide');
		location.href = 'remove.do?id='+$('#modal').data('id');
	}
}
</script>
</body>
</html>