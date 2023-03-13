<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:if test="${list == null }" >
<section>
<h3>장바구니가 비어있습니다.</h3>
</section>
</c:if>


<c:if test="${list != null }">
<div class="cart">
	<table>
	<thead>
		<tr>
		<th>제품 번호</th>
		<th>제품명</th>
		<th>구매수량</th>
		<th>개당 가격</th>
		<th>총 가격</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="ca" items="${list }">
		<tr>
			<td>${ca.pidx }</td>
			<td>${ca.name }</td>
			<td>${ca.count }</td>
			<td>${ca.price }</td>
			<td>${ca.total }</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>


<div class="clean">
	<a href="cartClean.jsp"><button>장바구니 비우기</button></a>
</div>
</div>

</c:if>


