<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.*, user_.*, qna.*, order.*, cart.*, manager.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>   

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${ProductDAO.getInstance() }"  />
<c:set var="userDAO" value="${UserDAO.getInstance() }" />
<c:set var="qnaDAO" value="${QnaDAO.getInstance() }" />
<c:set var="orderDAO" value="${OrderDAO.getInstance() }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Mall</title>

<style>
	table {
			
			border-collapse: collapse;
			width: 90%;
			margin-left:auto;
			margin-right:auto;
			border: 2px solid pink;
		}
		
	td, th {
		border-top: 2px solid pink;
           border-bottom: 2px solid #dadada;
           text-align: center;
		padding: 10px;
		
	}

    th {
    	border-top: 2px solid pink;
        background-color: #E2A9F3;;
        color: white;
    }
    
    td {
    	background-color: white;
    }
    
    tbody > tr:last-child > td {
    	border-bottom: 2px solid pink;
    }
  
  	
	a {
		text-decoration: none;
		color: inherit;
	}
	
	a:hover {
		text-decoration: underline;
	}
	
	.title  a:hover {
		text-decoration: none;
	}
	
	nav > ul {
		padding: 0;
		list-style: none;
		margin: 20px auto;
 		width: 80%; 
		display: flex;
		justify-content: space-around;
		font-weight: bold;
		font-size: 20px;
		
	}
	
	h1 {
		display: flex;
		width: 100%;
		margin: auto;
		justify-content: center;
		align-items: center;
	}
	
	.login > nav > ul {
		padding: 0;
		margin: 20px;
		width: 97%;
		display: flex;
		justify-content: flex-end;
		position: space-around;
		alingn-itmes: right;
		font-weight: 20px;
		font-size: 15px;
		color: darkgray;
	}
	
	.login > nav > ul > li {
		margin: 0 10px;
	}
	
	.greeting {
		color: gray;
	}
	
	div.productitem {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;	
		margin: 10px 10px;
		border: 1px solid #dadada;
		padding: 10px;
		
	}
	
	div.productwrap {
		display: flex;
		justify-content: center;
		align-items: center;	
    	flex-wrap: wrap;
	}

	.detail > .order > button {
		display: flex;
		margin: 30px 10px;
	}

	.detail > .update > button {
		display: flex;
		margin: 30px 10px;
	}

	.productimg {
		width: 250px;
		height: 250px;
	}


	section {
		width: 500px;
		margin: 30px auto;
		text-align: center;
		margin: auto;
		border: 2px solid pink;
		border-collapse: collapse;
		color: gray;
		margin-top: 30px;
	}
	
	.fm1_f {

	   width: 1500px;
	   margin: 30px auto;
	   text-align: center;
	   margin: auto;
	   border: 2px solid pink;
	   border-collapse: collapse;
	   color: gray;
	   margin-top: 30px;
	   
	   
	}

	manager {
		display: flex;
	}
	
	button {
		margin-bottom: 25px;
	}

	
	.kind > nav {
            background-color: pink;
            margin: 30px;
            color: white;
            
    }
    
    .clean, .update, .qnaAdd {
    	width: 500px;
		margin: 30px auto;
		text-align: center;
		margin: auto;
		color: gray;
		margin-top: 30px;
    }
    
    .title {
	      display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          font-style: italic;
          font-family: 'Times New Roman', Times, serif;
          font-size: 30px;
          margin: 20px 0 0 0;
          color: grey;
    }
    
    .user {
    	display: flex;
    	justify-content: right;
    	width: 100%;
    	margin: 0 0 0 0;
    }
    
    .title > img {
    	height: 160px;
    }
    
    .footerkind > nav {
	   background-color: pink;
	   margin-bottom: 30px;
	   margin-top: 0px;
	   color: white;
	}
	
	.footer > img {
	   margin-left: 1251px;
	   margin-bottom: 0px;
	   height: 50px;
	}
    
    .h3Form {
    	color: gray;
    }
    
    .qna > ul  {
    	padding: 0;
		list-style: none;
		margin: 20px auto;
 		width: 80%; 
		display: flex;
		justify-content: space-around;
		font-weight: bold;
		font-size: 20px;
		color: #999999;
    }
    
   .hdnmig > img {
	   height: 460px;
	   width: 1342px;
	   margin-left: 30px;
	}
	
	.hdnmig {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.detailImg {
		margin: 30px;
	}
	
	.detailName {
		font-size: 25px;
		margin : 20px;
		font-weight: bold;
	}
	
	.detailPrice {
		margin-bottom : 50px;
	}
	
	.productName, .productPrice {
		color: gray;
	}
	
	.best {
		display: flex;
		margin: 30px 0 0 19%;
		
	}
	
	.hidden {
		color: transparent;
	}
    
    h3 {
    	display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
    button {
           width: 55%;
		   height: 40px;
		   text-align: center;
		   padding: 10px;
		   background-color: #E2A9F3;
		   border: 2px solid pink;
		   margin-bottom: 15px;
		   color: white;
		   font-size: 15px;

        }

     button:hover {
         cursor: pointer;
     }
     
     input[type="submit"] {
	   width: 55%;
	   height: 40px;
	   text-align: center;
	   padding: 10px;
	   background-color: #E2A9F3;
	   border: 2px solid pink;
	   margin-bottom: 15px;
	   color: white;
	}
     input[type="submit"]:hover {
         cursor: pointer;
     }
     
	input[type="text"], input[type="password"], input[type="number"], input[type="tel"],
	   input[type="email"] {
	   width: 50%;
	   padding: 10px;
	   border: 2px solid #BDBDBD ;
	}
	
	select {
		width: 55%;
	    padding: 10px;
	    border: 2px solid #BDBDBD ;
	}
	
	textarea{
		width: 55%;
		border: 2px solid #BDBDBD ;
	}
	
	
</style>

</head>
<body>
	<div class="title" >
		<img src="${cpath }/upload/메인꽃.jpg">
	<h1><a href="${cpath }">Always Spring</a></h1></div>
		
<!-- 		<div class="user"> -->
<%-- 				<h4>${not empty login ? login.name : null } ${not empty login ? "님 환영합니다." : null } </h4> --%>
<!-- 		</div> -->
		
		
		<div class=login>
			<nav>
			<ul>
				<li><a href="${cpath }/${empty login ? 'login.jsp':'logout.jsp' }">
			${empty login ? 'Login':'Logout' }</a></li>
				<li><a href="${cpath }/join.jsp">Join</a></li>
				<li><a href="${cpath }/myPage.jsp">My page</a></li>
				<li><a href="${cpath }/cartList.jsp">Cart</a></li>
				<li><a href="${cpath }/qna.jsp">QNA</a></li>
				<c:if test="${type == 'm' }">				
				<li><a href="${cpath }/orderList.jsp" class="manager">판매내역</a></li>
				<li><a href="${cpath }/list.jsp" class="manager">회원 목록</a></li>
				<li><a href="${cpath }/productAdd.jsp" class="manager">상품추가</a></li>
				<li><a href="${cpath }/productModify.jsp"class="manager">상품수정</a></li>
				<li><a href="${cpath }/productDelete.jsp"class="manager">상품삭제</a></li>
				</c:if>		
				<c:if test="${not empty login }">
				<li><div class="greeting">${login.name }님 환영합니다.</div></li>
				</c:if>
			</ul>
			</nav>
		</div>
		
		
		
		<div class="kind">
			<nav>
			<ul>
				<li><a href="${cpath }/productList.jsp">All</a></li>
				<li><a href="${cpath }/productList.jsp?kind=상의">Top</a></li>
				<li><a href="${cpath }/productList.jsp?kind=하의">Bottom</a></li>
				<li><a href="${cpath }/productList.jsp?kind=신발">Shoes</a></li>
				<li><a href="${cpath }/productList.jsp?kind=악세사리">Accessory</a></li>
			</ul>
			</nav>
		
		</div>
		
		
		

	




