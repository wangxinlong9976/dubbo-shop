<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<hr class="mt-3"/>
<form id="form1">
	<div class="row mb-2" id="tools">
		<input type="button" value="添加品牌" class="btn btn-primary col-1 ml-3 mr-2"  data-toggle="modal" data-target="#staticBackdrop"/>
		<input type="button" value="批量删除" class="btn btn-danger col-1" onclick="deleteBrandBatch()"/>
		<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum"/>
		<div class="col-5 mr-2"></div>
		<input type="text" name="firstChar" value="${firstChar}" class="col-3 form form-control ml-5 " placeholder="请输入要查询的品牌"/>
		<input type="button" value="查询" class="col-1 btn btn-primary" id="searchBtn"/>
	</div>
</form>
<table class="table table-bordered text-center">
	<thead>
		<tr>
			<th>
				<input type="checkbox" id="checkAll"/>
			</th>
			<th>
				<span>编号</span>
			</th>
			<th>
				<span>品牌名</span>
			</th>
			<th>
				<span>操作</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pageInfo.list}" var="brand">
			<tr>
				<td>
					<input type="checkbox" class="checks-brand" value="${brand.id}"/>
				</td>
				<td>
					<span>${brand.id}</span>
				</td>
				<td>
					<span>${brand.name}</span>
				</td>
				<td>
					<input type="button" value="修改" class="btn btn-warning" onclick="toUpdateBrand(${brand.id})"  data-toggle="modal" data-target="#staticBackdrop1"/>
					<input type='button' value="删除" class="btn btn-danger" onclick="deleteBrand(${brand.id})"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%@ include file="../common/page.jsp" %>


<!-- Modal --><!-- 添加模态框 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加品牌</h5>
         </button>
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
       <!-- 添加模态框 -->
      <div class="modal-body">
        	<form id="addBrand">
        		 <div class="form-group" >
    				<label for="specName">品牌名称</label>
    				<input type="text" class="form-control" name="name" id="brandName" aria-describedby="specNamelHelp">
    				<small id="specNamelHelp" class="form-text text-muted">请输入品牌名称</small>
  				</div>
  				<div class="form-group row">
    				<label for="inputAddress" class="col-3 mt-2 pl-4">品牌首字母</label>
    				<input type="text" name="firstChar" class="form-control col-9" id="inputAddress" placeholder="请输入品牌的首字母" style="margin-left:-13px">
  				</div>
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
        <button type="button" class="btn btn-primary" onclick="addBrand()">提交</button>
      </div>
    </div>
  </div>
</div>


<!-- 修改的模态框 -->
<div class="modal fade" id="staticBackdrop1" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">修改品牌</h5>
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
       <!-- 修改模态框 -->
      <div class="modal-body">
        	<form id="updateBrand">
        	<input type="hidden" name="id" id="brand-id"/>
        		  <div class="form-group" >
    				<label for="specName">品牌名称</label>
    				<input type="text" class="form-control" name="name" id="brand-name" aria-describedby="specNamelHelp">
    				<small id="specNamelHelp" class="form-text text-muted">请输入品牌名称</small>
  				</div>
  				<div class="form-group row">
    				<label for="inputAddress" class="col-3 mt-2 pl-4">品牌首字母</label>
    				<input type="text" name="firstName" class="form-control col-9" id="brand-first" placeholder="请输入品牌的首字母" style="margin-left:-13px">
  				</div>
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
        <button type="button" class="btn btn-primary" onclick="updateBrand()">修改</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
//分页
function pageUtil(page){
	if(page==null || page==""){
		
	}else{
		$('#pageNum').val(page);
	}
	
	$('#main').load("/brand/list",$('#form1').serialize());
}


function addBrand(){
	$.post("/brand/addBrand",$('#addBrand').serialize(),function(res){
		if(res){
			alert("添加成功!")
			pageUtil();
			$('.modal-backdrop').remove();
		}
	},"json");
}

function toUpdateBrand(id){
	$.post("/brand/toUpdateBrand",{id:id},function(res){
		$('#brand-id').val(res.id);
		$('#brand-name').val(res.name);
		$('#brand-first').val(res.firstChar);
	},"json");
}

function updateBrand(){
	$.post("/brand/updateBrand",$('#updateBrand').serialize(),function(res){
		if(res){
			alert("修改成功!");
			
			pageUtil();
			$('.modal-backdrop').remove();
		}
	},"json");
	
}

function deleteBrand(id){
	alert(id)
	$.post('/brand/deleteBrand',{ids:id},function(res){
		if(res){
			alert("删除成功!");
			pageUtil();
		}
	},"json");
}
function deleteBrandBatch(){
	var ids = $('.checks-brand:checked').map(function(){
		return this.value;
	}).get().join();
	$.post('/brand/deleteBrand',{ids:ids},function(res){
		if(res){
			alert("删除成功!");
			pageUtil();
			$('.modal-backdrop').remove();
		}
	},"json");
}
$('#searchBtn').click(function(){
	pageUtil();
});
//多选
$('#checkAll').click(function(){
	$('.checks-brand').each(function(){
		this.checked = !this.checked;
	});
})
</script>