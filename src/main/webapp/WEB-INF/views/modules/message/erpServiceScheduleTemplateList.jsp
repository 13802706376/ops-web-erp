<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>服务进度模板表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/message/erpServiceScheduleTemplate/">服务进度模板表列表</a></li>
		<shiro:hasPermission name="message:erpServiceScheduleTemplate:edit"><li><a href="${ctx}/message/erpServiceScheduleTemplate/form">服务进度模板表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="erpServiceScheduleTemplate" action="${ctx}/message/erpServiceScheduleTemplate/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>备注</th>
				<th>更新日期</th>
				<shiro:hasPermission name="message:erpServiceScheduleTemplate:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="erpServiceScheduleTemplate">
			<tr>
				<td><a href="${ctx}/message/erpServiceScheduleTemplate/form?id=${erpServiceScheduleTemplate.id}">
					${erpServiceScheduleTemplate.remarks}
				</a></td>
				<td>
					<fmt:formatDate value="${erpServiceScheduleTemplate.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="message:erpServiceScheduleTemplate:edit"><td>
    				<a href="${ctx}/message/erpServiceScheduleTemplate/form?id=${erpServiceScheduleTemplate.id}">修改</a>
					<a href="${ctx}/message/erpServiceScheduleTemplate/delete?id=${erpServiceScheduleTemplate.id}" onclick="return confirmx('确认要删除该服务进度模板表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>