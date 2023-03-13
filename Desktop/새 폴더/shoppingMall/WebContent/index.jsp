<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<!-- <div class="hdnmig"> -->
<%--    <img src="${cpath }/upload/mainimg1.webp"> --%>
   
<!-- </div>   -->

    <style>
        .slider {

            width: 1830px;
            height: 630px;
            border: 2px solid white;
            margin: 0px;
            margin-left:25px;
            margin-right: 20px;
            overflow: hidden; //x
        }
        .wrap {
         	margin-right: 30px;
        	width: 1830px;
            display: flex;
            position: relative;
        }
        .item {
        
        	margin: 0px;
        	padding: 0px;
            position: absolute;
            width: 1830px;
            height: 630px;
            margin-left:20px;
            margin-right: 20px;
            
            background-position: center;
            background-repeat: no-repeat;
            background-size: auto 100%;
            
            transition-duration: 1s;
        }
        div.item{
        	margin: 0px;
        	padding: 20px;
        }
    </style>


    <div class="slider">
        <div class="wrap"></div>
    </div>

    <script>
        const wrap = document.querySelector('.wrap')
        const img = [ 'fm1.webp', 'fm2.webp', 'fm3.webp', 'fm4.webp', 'fm5.webp' ]
        
        img.forEach(e => {
            const div = document.createElement('div')
            div.className = 'item'
            div.style.backgroundImage = 'url(upload/' + e + ')'
            div.alt = 'Always Spring'
            wrap.appendChild(div)
        })
        
        const arr = Array.from(document.querySelectorAll('.item'))
        const unit = document.querySelector('.item').clientWidth    // 400
        
        function rotation() {
            
            arr[0].style.opacity = 0

            for(let i = 0; i < arr.length; i++) {
                const left = unit * (i - 2) + 'px'
                //console.log(i, left)
                arr[i].style.left = left
            }
            console.log('====================================')


            arr[Math.floor(arr.length / 2) + 1].style.opacity = 1

            arr.push(arr.shift())   // 배열의 첫번째 요소를 빼서, 배열의 마지막에 붙인다
            console.log(arr.map(e => e.style.backgroundImage))
        }
        rotation()
        let interval = setInterval(rotation, 2000) 

        const slider = document.querySelector('.slider')
        slider.onmouseover = () => clearInterval(interval)
        slider.onmouseout = () => interval = setInterval(rotation, 2000)

    </script>




<div class="best"><h3>이번 주 베스트 상품</h3></div>
<div class="productwrap">

	<c:forEach var="dto" items="${dao.selectList() }" begin="0" end="4">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name }</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>		
	</div>	
	</c:forEach>
</div>	



<div class="best"><h3>신상 할인 제품</h3></div>
<div class="productwrap">	
	<c:forEach var="dto" items="${dao.selectList() }" begin="5" end="9">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name }</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>		
	</div>	
	</c:forEach>
</div>	



<div class="best"><h3>최다 클릭 상품</h3></div>
<div class="productwrap">
	<c:forEach var="dto" items="${dao.selectList() }" begin="10" end="14">
	<div class="productitem">
		<div class="img"><a href="productDetail.jsp?pidx=${dto.pidx }"><img src="${cpath }/upload/${dto.imgPath }" height="200"></a></div>
		<div class="productName"><a href="productDetail.jsp?pidx=${dto.pidx }">${dto.name }</a></div>
		<div class="productPrice">
			<fmt:formatNumber value="${dto.price }" type="currency" />
		</div>		
	</div>	
	</c:forEach>
</div>	
	
	

<%@ include file="footer.jsp" %>
