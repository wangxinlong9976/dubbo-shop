<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<hr class="mt-3"/>
<form>
	<div class="row mb-2" id="tools">
		<button type="button" class="btn btn-primary ml-3 col-1" data-toggle="modal" data-target="#staticBackdrop">
		   添加
		</button>
		<input type="button" value="批量删除" id="dels" class="btn btn-danger col-1 ml-2 mr-3"/>
		<div class="col-5"></div>
		<input type="text" name="keyWord" value="${keyWord}" class="col-3 form form-control ml-5 " placeholder="请输入要查询的规格"/>
		<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum"/>
		<input type="button" value="查询" class="col-1 btn btn-primary" id="searchBtn"/>
	</div>
</form>


<!-- Modal --><!-- 添加模态框 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加规格</h5>
         <button type="button" onclick="addProp()" class="btn btn-primary"> 添加属性值
         </button>
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
       <!-- 添加模态框 -->
      <div class="modal-body">
        	<form id="addspec">
        		 <div class="form-group" >
    				<label for="specName">规格名称</label>
    				<input type="text" class="form-control" name="specName" id="specName" aria-describedby="specNamelHelp">
    				<small id="specNamelHelp" class="form-text text-muted">请输入规格名称</small>
  				</div>
  				<div class="form-group row">
    				<label for="inputAddress" class="col-2 mt-2">属性值</label>
    				<input type="text" name="options[0].optionName" class="form-control col-7" id="inputAddress" placeholder="请输入属性值..." style="margin-left:-13px">
    				<input type="hidden" name="options[0].orders" value="1">
    				<button onclick="$(this).parent().remove()" class="col-2 btn btn-danger offset-1">删除</buttonn>
  				</div>
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
        <button type="button" class="btn btn-primary" onclick="commitSpec()">提交</button>
      </div>
    </div>
  </div>
</div>


<!-- 修改的模态框 -->
<div class="modal fade" id="staticBackdrop1" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加规格</h5>
         <button type="button" onclick="addPropUpdate()" class="btn btn-primary"> 添加属性值
         </button>
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
       <!-- 修改模态框 -->
      <div class="modal-body">
        	<form id="updateSpec">
        		 <div class="form-group" >
        		 	<input type="hidden" name="id" id="specId"/>
    				<label for="specName">规格名称</label>
    				<input type="text" class="form-control" name="specName" id="specName1" aria-describedby="specNamelHelp">
    				<small id="specNamelHelp" class="form-text text-muted">请输入规格名称</small>
  				</div>
  				<!-- <div class="form-group row" id="updateContent">
    				<label for="inputAddress" class="col-2 mt-2">属性值</label>
    				<input type="text" name="options[0].optionName" class="form-control col-7" id="inputAddress" placeholder="请输入属性值..." style="margin-left:-13px">
    				<input type="hidden" name="options[0].orders" value="1">
    				<button onclick="$(this).parent().remove()" class="col-2 btn btn-danger offset-1">删除</buttonn>
  				</div>
  				 -->
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
        <button type="button" class="btn btn-primary" onclick="updateSp()">修改</button>
      </div>
    </div>
  </div>
</div>
<table class="table text-center">
	
	<tr> 
		<th>
			<input type="checkbox" id="checks"/>
		</th>
		<th>id</th>
		<th>名称</th>
		<th>详情</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${pageInfo.list}" var="spec">
		<tr>
			<td>
				<input type="checkbox" class="check" value="${spec.id}"/>
			</td>
			<td>${spec.id}</td>
			<td>${spec.specName}</td>
			<td>
				<c:forEach items="${spec.options}" var="op" >
					&nbsp;&nbsp; ${op.optionName}
				</c:forEach>
			</td>
			<td>
				<input type="button" value="修改" class="btn btn-warning" onclick="updateSpec(${spec.id})" data-toggle="modal" data-target="#staticBackdrop1"/>
				<input type="button" value="删除" class="btn btn-danger" onclick="deleteSpec(${spec.id})"/>
			</td>
		</tr>
	</c:forEach>
	
</table>    
<hr style="margin-top:-10px;"/>

<!-- pageInfo -->
<%@ include file="../common/page.jsp" %>

<script type="text/javascript">
	var addindex=1;
	function addProp(){
		$("#addspec").append('<div class="form-group row">'+
    				'<label for="inputAddress" class="col-2 mt-2">属性值</label>'+
    				'<input type="text" name="options['+addindex+'].optionName" class="form-control  col-7" id="inputAddress" placeholder="请输入属性值..." style="margin-left:-13px">'+
    				'<input type="hidden" name="options['+addindex+'].orders" value='+(addindex+1)+'>'+
    				'<button onclick="$(this).parent().remove()" class="btn btn-danger col-2 offset-1">删除</button>'+
    				'</div>')
    	addindex++;
	} 
	
	/**
	  提交数据	
	*/
	function commitSpec(){
	
		var data = $('#addspec').serialize();
		alert(data)
		$.post("/spec/add",data,function(res){
			if(res){
				/* alert("添加成功!") */
				$('#staticBackdrop').modal('hide');
				addindex=1;
				$('.modal-backdrop').remove();
				pageUtil();
				
			}
			
		},"json");
		
		
	}
	
	
	//分页
	function pageUtil(page){
		if(page==null || page==""){
			
		}else{
			$('#pageNum').val(page);
		}
		
		$('#main').load("/spec/list",$('form').serialize());
	}
	
	// 查询
	$(function(){
		$('#searchBtn').click(function(){
			pageUtil();
		});
	});
	
	
	//删除规格
	function deleteSpec(id){
		$.get("/spec/del",{ids:id},function(res){
			if(res){
				alert("删除成功!");
				pageUtil();
			}else{
				alert("删除失败!");
			}
		},"json");
	}
	
	
	//多选
	$('#checks').click(function(){
		$('.check').each(function(){
			this.checked = !this.checked;
		});
	})
	
	//批量删除
	$('#dels').click(function(){
		var ids = $('.check:checked').map(function(){
			return this.value;
		}).get().join();
		alert(ids)
	 	$.get("/spec/del",{ids:ids},function(res){
			if(res){
				alert("删除成功!");
				pageUtil();
			}else{
				alert("删除失败!");
			}
		},"json"); 
	});
	
	var maxIndex = 0; 
	function updateSpec(id){
		$.post("/spec/toUpdate",{id:id},function(obj){
			var addindex = 0;
			alert(JSON.stringify(obj));
			$('#specName1').val(obj.specName);
			$('#specId').val(obj.id);
			/* maxIndex = obj.options.length; */
			for (var i=0;i<obj.options.length;i++) {
				$('#updateSpec').append('<div class="form-group row">'+
	    				'<label for="inputAddress" class="col-2 mt-2">属性值</label>'+
	    				'<input type="text" name="options['+maxIndex+'].optionName" class="form-control  col-7" id="inputAddress" placeholder="请输入属性值..." style="margin-left:-13px" value="'+obj.options[i].optionName+'">'+
	    				'<input type="hidden" name="options['+maxIndex+'].orders" value='+obj.options[i].orders+'>'+
	    				'<button onclick="$(this).parent().remove()" class="btn btn-danger col-2 offset-1">删除</button>'+
	    				'</div>');
				maxIndex++;
			}
			
		},"json");
	}
	function addPropUpdate(){
		$("#updateSpec").append('<div class="form-group row">'+
    				'<label for="inputAddress" class="col-2 mt-2">属性值</label>'+
    				'<input type="text" name="options['+maxIndex+'].optionName" class="form-control  col-7" id="inputAddress" placeholder="请输入属性值..." style="margin-left:-13px">'+
    				'<input type="hidden" name="options['+maxIndex+'].orders" value='+maxIndex+'>'+
    				'<button onclick="$(this).parent().remove()" class="btn btn-danger col-2 offset-1">删除</button>'+
    				'</div>')
    	maxIndex++;
	} 
	
	function updateSp(){
		var data = $('#updateSpec').serialize();
		alert(data)
		$.post("/spec/update",data,function(res){
			if(res){
				alert("添加成功!") 
				$('#staticBackdrop1').modal('hide');
				addindex=1;
				$('.modal-backdrop').remove();
				pageUtil();
				
			}
			
		},"json");
	}
</script>