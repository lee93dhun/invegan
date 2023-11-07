<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invegan - 식단관리</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	#container{
		height: 800px;
		width: 1000px;
		margin: 0 auto;
		display: flex;
		padding: 20px 0;
	}
	.contents{
		width: 500px;
		height:100%;
		/* 임시 border */
		border: 1px solid lightgrey;
		
		padding: 10px 20px;
	}
	.contents > div{
		width: 95%;
	}
	#vertical-line{
		height: 100%;
		border-right: 2px solid lightgray; 
	}
	
	#contents-left-header{
		display:flex;
		justify-content: space-between;
		border-bottom: 1px solid gray;
		vertical-align: middle;
		padding: 10px;
	}
	#contents-left-header > *{
		cursor:pointer;
		margin: 0px;
	}
	#contents-left-header button{
		background: none;
		border:none;
		height: 30px;
		width: 30px;
		padding: 0px;
	}
	#contents-left-content{
		/* border: 1px solid lightgrey; */
		height: auto;
		margin: 20px auto;
		padding: 0 10px;]
	}
	#emptyList{
		height: 100px;
		border: 2px dashed gray;
		border-radius: 15px;
		position: relative;
		margin-top: 20px;
		cursor: pointer;
		color:gray;
	}
	#emptyList:hover{
		color: #6b6b6b;
		border:2px solid #6b6b6b;
	}
	#emptyList p{
		font-size:large;
		font-weight:600;
		position: absolute;
		top:30%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	#list-items{
		text-align: right;
	}
	.menu-item td{
		padding-bottom: 7px;
		padding-left: 5px;
	}
	.menu_name{
		padding-left: 20px;
		text-align: left;
	}
	.menu_name label{
		cursor: pointer;
	}
	.diet-category{
		font-size: 19px;
		font-weight: 600;
		text-align: left;
		padding-left: 0;
	}
	
	/* 영양성분 */	
	#contents-right-header{
		border-bottom:1px solid gray;
		width: 100%;
		height: 39px;
	}
	#contents-right-header ul{
		margin: 11px auto;
		padding: 0;
		display: flex;
		justify-content: center;
	}
	#contents-right-header ul li{
		display: inline-block;
		justify-content: center;
	}
	#contents-right-header ul li:not(.li-vertical-line){
		padding: 3px 16px;
		cursor: pointer;
		margin: 0 10px;
	}
	
	#contents-right-header ul li:not(.li-vertical-line):hover{
		border-bottom: 2px solid #95df95;
	}
	.li-vertical-line{
		border-right: 1px solid black; 
	}
</style>
</head>
<body>
	<c:import url="/main/header"/>
	<div id="container">
		<!-- 식단 영역 -->
		<div class="contents">
			<div id=contents-left-header>
				<h2 id="selectDate">${date}</h2>
				<button id="addMenuBtn" onclick="upsertMenu('0')"><i class="xi-plus xi-2x"></i></button>
			</div>
			<c:if test="${dietListSize == 0 }">
				<div id="emptyList" onclick="upsertMenu('0')">
					<p><i class="xi-plus-circle"></i> 메뉴를 추가해 주세요</p>
				</div>
			</c:if>
			<c:if test="${dietListSize > 0 }">
				<div id="contents-left-content">
					<table id="list-items">
						<colgroup>
							<col width="300px">
							<col width="50px">
							<col width="70px">
						</colgroup>
						<!-- 아침 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'아침' and not hasBreakfast}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasBreakfast" value="true"/>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'아침'}">
								 	<tr class="menu-item">
								 		<c:if test="${list.category eq'기본메뉴'}">
								 			<td class="menu_name"><label  onclick="">${list.food_name }</label></td>
								 		</c:if>
								 		<c:if test="${list.category eq'나만의레시피'}">
								 			<td class="menu_name"><label  onclick="">${list.recipe_name }</label></td>
								 		</c:if>
								 		<td >${list.grams}g</td>
								 		<td>${list.kcal}kcal</td>
								 	</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- 점심 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'점심' and not hasLunch}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasLunch" value="true"/>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'점심'}">
								 	<tr class="menu-item">
								 		<c:if test="${list.category eq'기본메뉴'}">
								 			<td class="menu_name"><label  onclick="">${list.food_name }</label></td>
								 		</c:if>
								 		<c:if test="${list.category eq'나만의레시피'}">
								 			<td class="menu_name"><label  onclick="">${list.recipe_name }</label></td>
								 		</c:if>
								 		<td >${list.grams}g</td>
								 		<td>${list.kcal}kcal</td>
								 	</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- 저녁 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'저녁' and not hasDinner}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasDinner" value="true"/>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'저녁'}">
								 	<tr class="menu-item">
								 		<c:if test="${list.category eq'기본메뉴'}">
								 			<td class="menu_name"><label  onclick="">${list.food_name }</label></td>
								 		</c:if>
								 		<c:if test="${list.category eq'나만의레시피'}">
								 			<td class="menu_name"><label  onclick="">${list.recipe_name }</label></td>
								 		</c:if>
								 		<td >${list.grams}g</td>
								 		<td>${list.kcal}kcal</td>
								 	</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- 기타 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'기타' and not hasEtc}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasEtc" value="true"/>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'기타'}">
								 	<tr class="menu-item">
								 		<c:if test="${list.category eq'기본메뉴'}">
								 			<td class="menu_name"><label  onclick="">${list.food_name }</label></td>
								 		</c:if>
								 		<c:if test="${list.category eq'나만의레시피'}">
								 			<td class="menu_name"><label  onclick="">${list.recipe_name }</label></td>
								 		</c:if>
								 		<td >${list.grams}g</td>
								 		<td>${list.kcal}kcal</td>
								 	</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>
		
		<div id="vertical-line"></div>
		
		<!-- 영양정보 영역 -->
		<div class="contents">
			<div id="contents-right-header">
				<ul>
					<li>전체</li>
					<li class="li-vertical-line"></li>
					<li>아침</li>
					<li class="li-vertical-line"></li>
					<li>점심</li>
					<li class="li-vertical-line"></li>
					<li>저녁</li>
					<li class="li-vertical-line"></li>
					<li>기타</li>
				</ul>
			</div>
			<div id="contents-right-content">
				<div id="nutri-top">
					<table>
						<tr>
							<td>칼로리</td>
							<td>탄수화물</td>
							<td>단백질</td>
							<td>지방</td>
						</tr>
					</table>
				</div>
				<div id="nutri-bottom">
					<table>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/main/footer"/>
</body>
<script>
$('#selectDate').on('click',function(){
	console.log('date click');
	location.href="tempCalander";
});

function upsertMenu(sort) {
	var sort = sort;
	var selectDate = $('#selectDate').text();
	console.log("upsert 분류 : "+sort);
	
	window.open("addMenu.go?sort="+sort+"&date="+selectDate, "pop", "width=1200,height=700,top=100,left=300,scrollbals=no");
}

</script>
</html>