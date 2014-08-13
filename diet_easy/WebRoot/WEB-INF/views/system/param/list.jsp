<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>参数列表</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>参数列表</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form action="list.do" method="post" modelAttribute="PARAM" cssClass="form-inline">
					<label class="">
					参数名<form:input path="name"/>
					</label>
					<label>
					参数说明<form:input path="description"/>
					</label>
					<form:hidden path="current"/>
					<form:hidden path="pageSize"/>
					<div class="btn-group">
						<a href="#" onclick="$('#PARAM').submit(); return false;" class="btn">查询</a>
						<a href="add.do" class="btn">新增</a>
					</div>
				</form:form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>参数名</th>
							<th>参数说明</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pb.dataList}" var="Param">
							<tr>
								<td>${Param.name}</td>
								<td>${Param.description}</td>
								<td>
									<div class="btn-group">
										<a href="view.do?id=${Param.id}" class="btn">详细</a>
										<a href="update.do?id=${Param.id}" class="btn">修改</a>
										<a href="javascript:remove(${Param.id});" class="btn btn-danger">删除</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3" form-id="PARAM" class="paginationPanel">${pb.fullDisplay}</td>
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
	  <h3>删除参数</h3>
 	</div>
	<div class="modal-body">
	  <p>真的要删除该参数吗？</p>
	</div>
    <div class="modal-footer">
      <a href="#" class="btn btn-primary" data-dismiss="modal">否</a>
      <a href="javascript:remove()" class="btn">是</a>
    </div>
</div>

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