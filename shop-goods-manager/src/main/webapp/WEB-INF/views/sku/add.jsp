<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form>
<div class="container-fluid" id="all"> 
	<div class="row mt-3" >
		<span class="col-3">
			商品id
		</span>
		<input type="text"   name="spu.id"  readOnly="true" value="${spu.id}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			商品名称
		</span>
		<input type="text"   readOnly="true" value="${spu.goodsName}"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			标题
		</span>
		<input type="text"    readOnly="true" value="${spu.caption}"  class="col-8 form-control"/>
	</div>

	<div class="row mt-3" >
		<span class="col-3">
			是否在售
		</span>
		<input type="text"   readOnly="true" value="${spu.isMarketable==1?'在售':'下架'}"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			品牌
		</span>
		<input type="text"   readOnly="true" value="${spu.brand.name}"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			分类
		</span>
		<input type="text"   readOnly="true" value="${spu.category.name}"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			sku标题
		</span>
		<input type="text"   name="title"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			卖点
		</span>
		<input type="text"   name="sellPoint"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			价格
		</span>
		<input type="text"   name="price"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			库存量
		</span>
		<input type="text"   name="stockCount"  class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			规格
		</span>
		<input type="button" value="新增规格" onclick="addNode()" class="btn btn-info col-2 offset-2" />
	</div>
	<div class="mt-3" id="desNode">
		<div class="row mt-2"id="srcNode">
			<select class="spec col-4 form-control" name="specs[0].specId" onchange="cc(this)">
			<option value="-1">--请选择--</option>
			<c:forEach items="${specs}" var="spec">
				<option value="${spec.id}">${spec.specName}</option>
			</c:forEach>
			</select>
			<select class="option col-4 offset-1 form-control" name="specs[0].id">
				<option value="-1">--请选择--</option>
			</select>
			<input type="button" value="删除" class="btn btn-danger col-1 offset-1 form-control"/>
		</div>
		
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			sku码
		</span>
		<input type="text"   name="barcode"  class="col-8 form-control"/>
	</div> 
	<input type="button" value="添加" onclick="addSku()">
</div>
</form>
<script type="text/javascript">

$(function(){
	/* $('.spec').change(function(){
		var node = $(this).next();
		alert($(this).val())
		node.html("<option value='-1'>--请选择--</option>")
		$.post("/spu/getOptions",{id:$(this).val()},function(res){
			if(res!=null){
				for ( var i in res) {
					node.append("<option value='"+res[i].id+"'>"+res[i].optionName+"</option>")
				}
			}
		},"json");
		
	}) */
})

function cc(a){
	var node = $(a).next();
	node.html("<option value='-1'>--请选择--</option>")
	$.post("/spu/getOptions",{id:$(a).val()},function(res){
		if(res!=null){
			for ( var i in res) {
				node.append("<option value='"+res[i].id+"'>"+res[i].optionName+"</option>")
			}
		}
	},"json");
}

var index = 1;
function addNode(){
	$('#desNode').append("<div class='row mt-2'>"+$("#srcNode").html().replace("specs[0].specId","specs["+index+"].specId").replace("specs[0].id","specs["+index+"].id")+"</div>");
	index++;
}

function addSku(){
	$.post("/sku/addSku",$("form").serialize(),function(res){
		if(res){
			alert("添加成功!");
		}else{
			alert("添加失败!");
		}
	});
}
</script>