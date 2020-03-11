<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<hr class="mt-3"/>
<form>
	<div class="row mb-2" id="tools">
		<button type="button" class="btn btn-primary ml-3 col-1" onclick="toAdd()">
		   添加
		</button>
		<input type="button" value="批量删除" id="dels" class="btn btn-danger col-1 ml-2 mr-3"/>
		
		<div class="col-3 row">
			<span class="col-5 pt-2 pl-4">是否在售</span>
			<select class="form-control col-4">
			    <option value="">全部</option>
			    <option>2</option>
			    <option>3</option>
			    <option>4</option>
			    <option>5</option>
			</select>
			<span class="col-3 pt-2 pl-3">品牌</span>
		</div>
		<div class="col-2 row">
			
			<select class="form-control col-6">
			    <option value="">全部</option>
			    <option>2</option>
			    <option>3</option>
			    <option>4</option>
			    <option>5</option>
			</select>
			<span class="col-5 pl-4 pt-2">分类</span>
		</div> 
		
		<div class="col-2 row" >
			<select class="form-control col-6">
			    <option value="">全部</option>
			    <option>2</option>
			    <option>3</option>
			    <option>4</option>
			    <option>5</option>
			</select>
		</div>
		<input type="text" name="keyWord" value="${keyWord}" class="col-2 form form-control ml-5 " placeholder="商品名称或标题"/>
		<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum"/>
		<input type="button" value="查询" class="col-1 btn btn-primary" id="searchBtn"/>
	</div>
</form>

<table class="table text-center">
	<thead>
		<tr>
			<th>
				<input type="checkbox" id="checks"/>
			</th>
			<th>
				<span>id</span>
			</th>
			<th>
				<span>商品名称</span>
			</th>
			<th>
				<span>标题</span>
			</th>
			<th>
				<span>是否在售</span>
			</th>
			<th>
				<span>品牌</span>
			</th>
			<th>
				<span>分类</span>
			</th>
			<th>
				<span>小图</span>
			</th>
			<th>
				<span>操作</span>
			</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${pageInfo.list}" var="spu">
			<tr>
				<td>
					<input type="checkbox" class="check" value="${spu.id}"/>
				</td>
				<td>
					<span>${spu.id}</span>
				</td>
				<td>
					<span>${spu.goodsName}</span>
				</td>
				<td>
					<span>${spu.caption}</span>
				</td>
				<td>
					<span style="color:${spu.isMarketable==1?"green":"red"}">${spu.isMarketable==1?"在售":"下架"}</span>
				</td>
				<td>
					<span>${spu.brand.name}</span>
				</td>
				<td>
					<span>${spu.category.name}</span>
				</td>
				<td>
					<span>${spu.smallPic}</span>
				</td>
				<td>
					<input type="button" value="详情" class="btn btn-info"/>
					<input type="button" value="修改" class="btn btn-warning"/>
					<input type="button" value="删除" class="btn btn-danger"/>
					<input type="button" value="sku" class="btn btn-success" onclick="toAddSku(${spu.id})"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%@ include file="../common/page.jsp"  %>
<script type="text/javascript">
function toAdd(){
	$('#main').load("/spu/toAddSpu");
}

function toAddSku(id){
	$('#main').load("/spu/toAddSku?id="+id);
}
</script>