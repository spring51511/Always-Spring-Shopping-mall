<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
 tbody > tr:last-child > th {
    	border-bottom: 2px solid pink;
    }
</style>


<c:set var="dto" value="${qnaDAO.selectOne(param.QnAidx) }"/>

<h3>게시글 수정</h3>

<form action="qnaModify_action.jsp?QnAidx=${param.QnAidx }" Method="POST">
	<table>
		<tr>
			<th>게시글 제목</th>
			<td><input type="text" name="subject" value="${dto.subject }" ></td>
		</tr>
		
		<tr>
			<th>게시글 내용</th>
			<td><textarea rows="30" cols="50" name="content" >${dto.content }</textarea></td>
		</tr>
	</table>
	
	<div class="update">
	<p><input type="submit" value="등록"></p>
	</div>
</form>


<%@ include file="footer.jsp" %>