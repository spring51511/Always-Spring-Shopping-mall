<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="orderList" value="${orderDAO.selectListUser(param.userid) }"/>

<c:if test="${orderList.isEmpty() }">
<section>
<h3>주문내역이 없습니다.</h3>
</section>
</c:if>

<c:if test="${!orderList.isEmpty() }">
<div class="order">
	<table>
	<thead>
		<tr>
		<th>주문 번호</th>
		<th>구매자</th>
		<th>주문날짜</th>
		<th>상품번호</th>
		</tr>
	</thead>
	<tbody>
	
	<c:forEach var="dto" items="${orderList }">
		<tr>
			<td>${dto.oridx }</td>
			<td>${dto.userid }</td>
			<td>${dto.orderDate }</td>
			<td>${dto.pidx }</td>
		</tr>
	</c:forEach>	
	</tbody>
	</table>
</div>
</c:if>

<%@ include file="footer.jsp" %>