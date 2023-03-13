<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:set var="kind" value="${param.kind }" />

<c:if test="${kind == null }" >


<div class="productwrap">
	<c:forEach var="dto" items="${dao.selectList() }">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name}</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>		
	</div>	
	</c:forEach>
</div>
	
</c:if>
	
	
<c:if test="${kind == '상의' }" >
<div class="h3Form"><h3>상의</h3></div>
<div class="productwrap">
	<c:forEach var="dto" items="${dao.selectListKind(kind) }">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name}</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>		
	</div>	
	</c:forEach>
</div>
	
</c:if>


<c:if test="${kind == '하의' }" >
<div class="h3Form"><h3>하의</h3></div>
<div class="productwrap">
	<c:forEach var="dto" items="${dao.selectListKind(kind) }">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name}</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>		
	</div>	
	</c:forEach>
</div>
	
</c:if>



<c:if test="${kind == '신발' }" >
<div class="h3Form"><h3>신발</h3></div>
<div class="productwrap">
	<c:forEach var="dto" items="${dao.selectListKind(kind) }">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name}</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>			
	</div>	
	</c:forEach>
</div>
	
</c:if>



<c:if test="${kind == '악세사리' }" >
<div class="h3Form"><h3>악세사리</h3></div>
<div class="productwrap">
	<c:forEach var="dto" items="${dao.selectListKind(kind) }">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name}</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>	
	</div>	
	</c:forEach>
</div>
	
</c:if>


<%@ include file="footer.jsp" %>