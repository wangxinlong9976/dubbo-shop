<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resource/scss/aa.css" rel="stylesheet"/>
<link href="/resource/css/bootstrap.css" rel="stylesheet" >  
<div  class="container-fluid " style="margin-top:-50px">
	<div class="row">
		<div  class="col-md-6" id="catTree" style="height:600px;overflow:auto;">
		
		</div>
		<div  class="col-md-6" id="edit">
			<div class="addCategory mb-5" id="addCategory">
				<form id="addForm">
					<div class="row">
						<span class="col-md-2 mt-2 pl-5">父级ID</span>
						<input type="text" id="show_p_id" class="col-md-9 form form-control" readonly="true"/>
					</div>
					<div class="row mt-2">
						<span class="col-md-2 mt-3 pl-5">父级名称</span>
						<input type="text" id="show_p_name" class="col-md-9 form form-control" readonly="true"/>
					</div>
					<div class="row mt-2">
						<span class="col-md-2 mt-3 pl-5">节点名称</span>
						<input type="text" id="addName" class="col-md-9 form form-control"/>
					</div>
					<div class="row mt-3">
						<input type="button" value="添加节点" class="btn btn-primary col-md-4 offset-md-4" onclick="addCategory()"/>
					</div>
				</form>
			</div>
			<div class="updateCategory mt-5 mb-5" id="updateCategory">
				<form id="updateForm">
					<div class="row mt-2">
						<span class="col-md-2 mt-3 pl-5">节点ID</span>
						<input type="text" id="node_id" class="col-md-9 form form-control show_id" readonly="true"/>
					</div>
					<div class="row mt-2">
						<span class="col-md-2 mt-3 pl-5">节点名称</span>
						<input type="text" id="updateName" class="col-md-9 form form-control show_name"/>
					</div>
					<div class="row mt-3">
						<input type="button" value="修改节点" class="btn btn-primary col-md-4 offset-md-4"  onclick="updateCategory()"/>
					</div>
				</form>
			</div>
			<div class="mt-5">
				<div class="row mt-2">
					<span class="col-md-2 mt-3 pl-5">节点ID</span>
					<input type="text" id="show_node_id" class="col-md-9 form form-control show_id" readonly="true"/>
				</div>
				<div class="row mt-2">
					<span class="col-md-2 mt-3 pl-5">节点名称</span>
					<input type="text" id="show_name" class="col-md-9 form form-control show_name"  readonly="true"/>
				</div>
				<div class="row mt-3">
					<input type="button" value="删除节点" class="btn btn-primary col-md-4 offset-md-4" id="deleteBtn"  onclick="deleteCategory()"/>
				</div>
			</div>
		</div>
	</div>
</div> 
 <script type="text/javascript">
function initTree() {
	//发送ajax获取树需要的数据
	$.post("/category/treeData", {},
			function(treeData) {
				//初始化添加的时候分类的树
				$("#catTree").treeview({
					data : treeData,
					levels : 2,
					onNodeSelected : function(event, node) {
						if (node.nodes.length==0) {
							$('#deleteBtn').removeAttr("disabled");
							/* $("#addCategoryTree").hide(); */
						}else{
							$('#deleteBtn').attr("disabled","disabled");
							
						}
						$('#show_p_id').val(node.id);
						$('#show_p_name').val(node.text)
						$(".show_name").val(node.text);
						$(".show_id").val(node.id);
						/* alert(JSON.stringify(node.nodes)) */
						
						
					} 
				});

			}, "json");
}
initTree();

function addCategory(){
	$.post("/category/addCategory",{parentId:$('#show_p_id').val(),name:$('#addName').val()},function(res){
		if(res){
			alert("OK");
			reference()
		}
	},"json");
}

function updateCategory(){
	$.post("/category/updateCategory",{id:$("#node_id").val(),name:$('#updateName').val()},function(res){
		if(res){
			alert("OK");
			reference()
		}
	},"json");
}

function deleteCategory(){
	alert($("#show_node_id").val())
	$.post("/category/deleteCategory",{id:$("#show_node_id").val()},function(res){
		if(res){
			alert("OK");
			reference()
		}
	},"json");
}

function reference(){
	$('#main').load(absPath)
}
</script> 