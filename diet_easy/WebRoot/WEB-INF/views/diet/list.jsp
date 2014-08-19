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
					<form:input path="type"/>
					</label>
					<label>子类型
					<form:input path="subType"/>
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
							<th style="width: 80%">详情</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${paginationBean.dataList }" var="dietMaster">
							<tr>
								<td>${dietMaster.day}</td>
								<td>${dietMaster.weather}<br>${dietMaster.temperature}℃</td>
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
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="3" form-id="diet" class="paginationPanel">${paginationBean.fullDisplay}</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
</script>
</body>
</html>