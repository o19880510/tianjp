<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单树列表</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>菜单树列表</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form action="list.do" method="post" modelAttribute="menu" cssClass="form-inline">
					<label>菜单树名/描述
						<form:input path="keyword"/>
					</label>
					<a href="#" onclick="$('#menu').submit(); return false;" class="btn">查询</a>
					<a href="addTree.do" class="btn">新增</a>
				</form:form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>菜单树名</th>
							<th>描述</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pb.dataList}" var="menu" varStatus="vs">
							<tr>
								<td>${menu.name}</td>
								<td>${menu.description}</td>
								<td>
									<div class="btn-group">
										<a href="update.do?id=${menu.id}" class="btn">维护</a>
										<a onclick="loadTree(${menu.id}, this)" data-content="加载整个菜单树到Web App Application Scope 中, 键值为 ${menu.name}" rel="popover" class="btn" href="#" data-original-title="载入">载入</a>
										<c:if test="${'SYSTEM_MENU_TREE'!=menu.name}">
											<a href="javascript:remove(${menu.id})" class="btn btn-danger">删除</a>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3" form-id="menu" class="paginationPanel">${pb.fullDisplay}</td>
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
	  <h3>删除菜单树</h3>
 	</div>
	<div class="modal-body">
	  	<p>真的要删除该菜单树吗</p>
	</div>
    <div class="modal-footer">
      <a href="#" class="btn btn-primary" data-dismiss="modal">否</a>
      <a href="javascript:remove()" class="btn" >是</a>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("a[rel=popover]").popover({trigger:'hover', placement:'left'}).click(function(e) {
	        e.preventDefault()
	})
});

function loadTree(id, ele){
	$.ajax({
		type:'get',
		url:'load/'+id+'.do',
		beforeSend:function(){
			$(ele).text('载入中...');
		},
		error: function(jqXHR){
			alert(jqXHR.responseText);
		},
		complete: function(){
			$(ele).text('载入');
		}
	});
}

function remove(id){
	if(id){
		$('#modal').modal();
		$('#modal').data('id', id);
	}else{
		$('#modal').modal('hide');
		location.href = 'removeTree.do?id='+$('#modal').data('id');
	}
}
</script>
</body>
</html>