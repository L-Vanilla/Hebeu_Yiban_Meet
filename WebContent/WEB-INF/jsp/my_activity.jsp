<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我发布的活动</title>
    <link type="text/css" rel="styleSheet"  href="${ctx }////css/home.css">
    <style type="text/css">
		.content-item {
			position: relative;
	        padding-right: 2em;
		}
		.content-item .number  {
	        position: absolute;
	        top: 0;
	        right: 0;
	        min-width: 2rem;
			}	

		/* 卡片顶部圆角 */ 
		.home_commend {
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
		}
		/* 所选区域图标文字对齐 */
		.home-content2 {
			display: flex;
			align-items: center;
		}
		/* 卡片底部圆角/底部外边距 */
		.card-info {
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;			
			margin-bottom: 1rem;
		}
      </style>
</head>
<body style="background-color: #F8F8F8;margin: 1rem">
	<!--  当没有发布活动情况-->
	<c:if test="${empty requestScope.activitys}">
		<div style="margin:2rem">
			<img src="imgs/launch_empty.png" class="state_empty">
			<div class="message_empty1">暂未发布活动</div>
			<div class="message_empty2">去创建自己想要的活动吧</div>
			<a href="add_activity?flag=0"><button class="find_insert" style="width:100%">创建活动</button></a>
		</div>
	</c:if>
<!-- 发布了活动 -->
    <c:forEach items="${requestScope.activitys}" var="activity">
    <img src="${ctx}/upload/${activity.img}" class="home_commend">
    <div class='card-info' style="background-color: #ffffff">
        <div class="content">
            <div class="home_content1">${activity.title}</div>
            <div class="home_content2">
                <img src="imgs/place.png" style="width: 10px;height: 11px; margin-right: 5px">
                <span>${activity.activity_place}</span>
            </div>
            <div class="home_content2">
                <img src="imgs/time.png" style="width: 10px;height: 10px; margin-right: 5px">
               <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </div>
            <div class="home_content2">
                <img src="imgs/sex.png" style="width: 11px;height: 11px; margin-right: 5px">
                <c:choose>
					<c:when test="${activity.sex_limit == 0}">
						<span style="color: rgba(32, 203, 175, 1)">不限男女</span>
					</c:when>
					<c:when test="${activity.sex_limit == 1}">
						<span style="color: rgba(32, 203, 175, 1)">仅限男生</span>
					</c:when>
					<c:otherwise>
						<span style="color: rgba(32, 203, 175, 1)">仅限女生</span>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
        <hr style="border:none;border-top:1px solid rgba(241,241,243,1);" />
        <div  class="content-item" style="margin: 10px 1rem">
            <c:forEach items="${activity.joins}" var="join">
                 <img src="${join.join_head}" style="width: 28px;height: 28px;border-radius:50%">
            </c:forEach>
             <!-- 人数无限制，不显示人数 -->      
               <!--  参加者不足的显示图片 -->
              <c:choose>
       		  <c:when test="${activity.people_limit==0}">
       		  		<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
       		  		<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
       		  		<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
       		  		<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
       		  		<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
       		  		<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
       		  		<span class="number">无限制</span>
       		  </c:when>
       		  <c:otherwise>
        		   <c:set var="num"  value="${activity.people_limit-activity.count}"/>
        		  <c:forEach var="i" begin="1" end="${num}">
        		  	<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px">
        		  </c:forEach>
        		  <span class="number">${activity.count}/${activity.people_limit}</span>
       		  </c:otherwise>
       	   </c:choose>
        </div>
        <hr style="border:none;border-top:1px solid rgba(241,241,243,1);" />
        <div  style="margin: 1rem">
            <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem;border-radius:50%">
            <span class="name">${activity.user_name}<br></span>
            <span class="banji">${activity.user_class}</span>
            <!-- 发起人性别 -->
            <c:choose>
                <c:when test="${activity.user_sex == 'M'}">
 	   						<img src="${ctx}/imgs/man.png" style="width: 26px;height: 26px;vertical-align:middle;float: right;
				 margin-top: -24px;">
 	   			</c:when>
	       	    <c:when test="${activity.user_sex == 'F'}">
	       	   		<span><img src="${ctx}/imgs/woman.png" style="width: 26px;height: 26px;vertical-align:middle;float: right;
							 margin-top: -24px;"></span>
	       	    </c:when>
 	   			<c:otherwise></c:otherwise>
			</c:choose>
        </div>
        <hr style="border:none;border-top:1px solid rgba(241,241,243,1);" />
        <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
    </div>
    <br>
	</c:forEach>
</body>
</html>