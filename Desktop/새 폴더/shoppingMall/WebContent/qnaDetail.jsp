<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${qnaDAO.selectOne(param.QnAidx) }"/>

<style>
 tbody > tr:last-child > th {
    	border-bottom: 2px solid pink;
    }
</style>

<div class="qna_detail">
	<table>
		<tr>
			<th width="100px;">작성자</th>
			<td>${dto.userid == null ? '비회원' : dto.userid }</td>
			<th width="100px;">작성시간</th>
			<td>${dto.qnaDate }</td>
		</tr>
		<tr>
			<th>게시글 제목</th>
			<td colspan="3">${dto.subject }</td>
		</tr>
		<tr>
			<th>게시글 내용</th>
			<td colspan="3" height="300px;">${dto.content }</td>
		</tr>
	
	</table>
</div>
	
	
	<div class="update">
		<a href="qnaModify_form.jsp?QnAidx=${dto.qnAidx }"><button>수정</button></a>
		<a href="qnaDelete_action.jsp?QnAidx=${dto.qnAidx }"><button>삭제</button></a>
	</div>



<%@ include file="footer.jsp" %>