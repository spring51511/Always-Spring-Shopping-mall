<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="h3Form"><h3>회원목록</h3></div>

<table>
  <thead>
  	<tr>
  		<th>IDX</th>
  		<th>USERID</th>
  		<th>NAME</th>
  		<th>PHONE</th>
  		<th>JOINDATE</th>
  		<th>EMAIL</th>
  		<th>ADDRESS</th>
  		
  	</tr>
  	</thead>
	<tbody>
		<c:forEach var="dto" items="${userDAO.showList() }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.userid }</td>
				<td>${dto.name }</td>
				<td>${dto.phone }</td>
				<td>${dto.joindate }</td>
				<td>${dto.email }</td>
				<td>${dto.address }</td>
			</tr>
		</c:forEach>

	</tbody>
</table>


<%@ include file="footer.jsp" %>