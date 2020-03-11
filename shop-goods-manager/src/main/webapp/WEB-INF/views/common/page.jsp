<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav aria-label="..." class="row text-center"  >
	  <ul class="pagination" style="margin:0 auto;">
	    <li class="page-item">
	      <a class="page-link" href="javascript:pageUtil(${pageInfo.prePage==0?1:pageInfo.prePage})">Previous</a>
	    </li>
	    <c:forEach items="${pageInfo.navigatepageNums}" var="page">
		    <c:if test="${pageNum==page}">
		    	<li class="page-item active" aria-current="page">
		      		<a class="page-link" href="javascript:pageUtil(${page})">${page}<span class="sr-only">(current)</span></a>
		    	</li>
		    </c:if>
		    <c:if test="${pageNum!=page}">
	    		<li class="page-item"><a class="page-link" href="javascript:pageUtil(${page})">${page}</a></li>
	    	</c:if>
	    </c:forEach>

	    <li class="page-item">
	      <a class="page-link" href="javascript:pageUtil(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})">Next</a>
	    </li>
	  </ul>
	</nav>