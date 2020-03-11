<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid"> 
	<div class="row mt-3" >
		<span class="col-3">
			商品id
		</span>
		<input type="text" readOnly="true" value="${sku.id}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			商品标题
		</span>
		<input type="text" readOnly="true" value="${sku.title}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			价格
		</span>
		<input type="text" readOnly="true" value="${sku.price}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			库存量
		</span>
		<input type="text" readOnly="true" value="${sku.stockCount}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			发布时间
		</span>
		<input type="text" readOnly="true" value="${sku.createTime}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			成本价
		</span>
		<input type="text" readOnly="true" value="200" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			品牌
		</span>
		<input type="text" readOnly="true" value="${sku.spu.brand.name}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			分类
		</span>
		<input type="text" readOnly="true" value="${sku.spu.category.name}" class="col-8 form-control"/>
	</div>
	<div class="row mt-3" >
		<span class="col-3">
			规格详情
		</span>
		<div class="col-9"></div>
		
		<c:forEach items="${sku.specs}" var="spec">
			<div class="row offset-1">
				${spec.specName} : ${spec.optionName}
			</div>
		</c:forEach>
	</div>
	<input type="button" value="返回" onclick="history.back()"/>
	
</div>