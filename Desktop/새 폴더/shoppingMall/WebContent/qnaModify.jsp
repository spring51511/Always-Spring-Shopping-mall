<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>QNA 수정</h3>

<div class="qna">
	<table>
	<thead>
		<tr>
		<th>문의 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${qnaDAO.selectList() }">
		<tr>
			<td>${dto.qnAidx }</td>
			<td>
				<a href="${cpath }/qnaDetail.jsp?QnAidx=${dto.qnAidx }">${dto.subject }</a>
			</td>
			<td>${dto.userid == null ? '비회원' : dto.userid }</td>
			<td>${dto.qnaDate }</td>
			<td><a href="qnaModify_form.jsp?QnAidx=${dto.qnAidx }"><button>수정</button></a></td>
		</tr>
	</c:forEach>	
	</tbody>
	</table>
</div>


<%@ include file="footer.jsp" %>