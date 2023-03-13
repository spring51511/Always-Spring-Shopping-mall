<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="h3Form"><h3>판매내역</h3></div>

<%-- <c:set var="total" value="${orderDAO.getTotal() }" /> --%>
<%-- ${total } --%>

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
	<c:forEach var="dto" items="${orderDAO.selectList() }">
		<tr>
			<td>${dto.oridx }</td>
			<td>${dto.userid == null ? '비회원' : dto.userid }</td>
			<td>${dto.orderDate }</td>
			<td>${dto.pidx }</td>
		</tr>
	</c:forEach>	
	</tbody>
	</table>
</div>


<%@ include file="footer.jsp" %>