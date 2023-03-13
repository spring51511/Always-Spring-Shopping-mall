<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>


<div class="h3Form"><h3>상품 삭제</h3></div>

<table>
	<thead>
		<tr>
		<th>순번</th>
		<th>상품명</th>
		<th>종류</th>
		<th>가격</th>
		<th>이미지</th>
		<th></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${dao.selectList() }">
		<tr>
			<td>${dto.pidx}</td>
			<td><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name}</a></td>
			<td>${dto.kind }</td>
			<td>${dto.price }</td>
			<td><img src="${cpath }/upload/${dto.imgPath }" height="100"></td>
			<td><a href="productDelete_action.jsp?pidx=${dto.pidx }"><button>삭제</button></a></td>
		</tr>

	</c:forEach>	
	</tbody>
</table>

<%@ include file="footer.jsp" %>

