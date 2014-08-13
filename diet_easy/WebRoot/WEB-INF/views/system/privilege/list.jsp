<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>权限列表</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>权限列表</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form action="list.do" method="post" modelAttribute="privilege" cssClass="form-inline">
					<label for="name">权限名</label>
					<form:input path="name"/>
					<label for="group">权限组名</label>
					<form:input path="group"/>
					<form:hidden path="current"/>
					<form:hidden path="pageSize"/>
					<div class="btn-group">
						<a href="#" onclick="$('#privilege').submit(); return false;" class="btn">查询</a>
						<a href="add.do" class="btn">新增</a>
					</div>
				</form:form>	
				<table class="table table-hover">
					<thead>
						<tr>
							<th>权限名</th>
							<th>资源URI</th>
							<th>权限组名</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pb.dataList}" var="privilege">
							<tr>
								<td>${privilege.name}</td>
								<td>${privilege.uri}</td>
								<td>${privilege.group}</td>
								<td>
									<div class="btn-group">
										<a href="update.do?id=${privilege.id}" class="btn">修改</a>
										<a href="javascript:remove(${privilege.id})" class="btn btn-danger">删除</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4" form-id="privilege" class="paginationPanel">
								${pb.fullDisplay}
							</td>
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
	  <h3>删除权限</h3>
 	</div>
	<div class="modal-body">
	  <p>真的要删除该权限吗？</p>
	</div>
    <div class="modal-footer">
      <a href="#" class="btn btn-primary" data-dismiss="modal">否</a>
      <a href="javascript:remove()" class="btn" >是</a>
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