<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="qna">
	<ul>
		<li><a href="qna.jsp">목록</a></li>
		<li><a href="qnaAdd.jsp">글 작성</a></li>
<!-- 		<li><a href="qnaModify.jsp">글 수정</a></li> -->
<!-- 		<li><a href="qnaDelete.jsp">글 삭제</a></li> -->
	</ul>
</div>

<div class="qna">
	<table>
	<thead>
		<tr>
		<th>문의 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
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
		</tr>
	</c:forEach>	
	</tbody>
	</table>
</div>



<%@ include file="footer.jsp" %>