<script type="text/javascript">
	function submit_${taskId!''}submitForm1002(isLocation){
		var submit = function (v, h, f) {
				if (v == 'ok') {
						$.jBox.tip("正在修改，请稍等...", 'loading', {
						timeout : 3000,
						persistent : true
				});
				$.post("../sdi/flow/zhangbei_state_shop", {
						taskId:$("#${taskId!''}taskId1002").val(),
						procInsId:$("#${taskId!''}procInsId1002").val()
					}, 
				function(data) {
					if (data.result) {
						if(isLocation==1){
							updatePage();
						}else{
							window.location.reload();
						}
					} else {
						$.jBox.closeTip();
						$.jBox.info(data.message);
					}
				});
			}
			return true; 
		};
		$.jBox.confirm("确定完成掌贝进件吗？", "提示", submit);

	}
</script>
<input type='hidden' id='${taskId!''}taskId1002' name='taskId' value="${taskId!''}"/>
<input type='hidden' id='${taskId!''}procInsId1002' name='procInsId'  value="${procInsId!''}"/>
<div class="act-rs-item  ${detailType!''}  ${followTaskDetailWrap!''}">
	<div class="act-rs-left floatleft">
		<div class="act-rs-title padding15">
			<h3><a href="../workflow/taskDetail?taskId=${taskId!''}&followTaskDetailWrap=${followTaskDetailWrap!''}&detailType=${detailType!''}">${taskName!''}</a></h3>
			<div class="listSubmit">
				<#if zhangbeiState?? && zhangbeiState==2 >
					<button  onclick="submit_${taskId!''}submitForm1002()" type="button" class="makesrue btn btn-primary">确定完成</button>
					<a href="javascript:;" class="select-user open-select-user" style="float: left;" onclick="syncSelect('${taskId!''}', '${taskUser!''}','${taskUserId!''}')"></a>
				<#else>
					<button  onclick="submit_${taskId!''}submitForm1002()" type="button" class="makesrue btn">确定完成</button>
					<a href="javascript:;" class="select-user open-select-user" style="float: left;" onclick="syncSelect('${taskId!''}', '${taskUser!''}','${taskUserId!''}')"></a>
				</#if>
			</div>
			<div class="taskPrincipal"><span class="taskPrincipalName">${taskUser!''}</span></div>
		</div>
		<div class="act-rs-form form-horizontal padding15">
			<div class="rs-label" style="height:50px;">
				<div class="control-group">
					<label class="subTask" value="1">掌贝进件状态：
						<#if zhangbeiState?? && zhangbeiState==2 >
							<input type="hidden" value="" name="${taskId!''}channelname1002">
							<a href="../store/basic/erpStoreInfo/zhangbei/?id=${shopMainId!''}&from=taskList"><font color="green">通过</font></a>
						<#elseif zhangbeiState?? && zhangbeiState==3>
							<span><font color="red">拒绝，(原因：${zhangbeiRemark!''})</font></span><br/>
							<span><a href="../store/basic/erpStoreInfo/urlErpShopInfoList/?id=${shopMainId!''}&form=taskList">修改掌贝进件资料</a>并重新<a href="../store/basic/erpStoreInfo/zhangbei?id=${shopMainId!''}&from=taskList">提交审核</a></span>
						<#elseif zhangbeiState?? && (zhangbeiState==1 || zhangbeiState==4)>
							<a href="../store/basic/erpStoreInfo/zhangbei/?id=${shopMainId!''}&from=taskList"><font color="orange">待审核</font></a>
						<#else>
							<a href="../store/basic/erpStoreInfo/zhangbei/?id=${shopMainId!''}&from=taskList"><font color="red">未提交</font></a>
						</#if>
					</label>
				</div>
			</div>
		</div>
	</div>
	<div class="act-rs-right">
		<div class="padding15">
			<div class="act-time">开始：${startDate!''}</div>
			<div class="act-time">到期：${endDate!''}</div>
			<div class="act-jd">
			 <#if taskConsumTime?? && (taskConsumTime < taskConsumTimeMin) >
					<div class="progress progress-success">
						<div class="bar" style="width: ${taskConsumTime!''}%"></div>
					</div>
			<#elseif taskConsumTime?? && (taskConsumTime > taskConsumTimeMin && taskConsumTime < taskConsumTimeMax)>
					<div class="progress progress-warning">
						<div class="bar" style="width: ${taskConsumTime!''}%"></div>
					</div>
			<#else>
				<div class="progress progress-danger">
						<div class="bar" style="width: 100%"></div>
					</div>
			</#if>
			</div>
			<div class="act-jd-word positionrelative"><div class="acjw positionrabsolute" style="left: 80%;">${taskConsumTime!''}%</div></div>
		</div>
	</div> 
	<div class="act-process-left-footer" >
		<div class="footer-info floatleft">
			<p></p>
			<p>负责人：${taskUser!''}</p>
		</div>
		<div class="footer-btn floatright">
			<button style="button" class="btn btn-large"  onclick="submit_${taskId!''}submitForm1002(1)">确定完成</button>
			<span class="flowTaskState hide">已完成</span>
		</div>
	</div>
</div>