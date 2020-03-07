<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <title>我申请的活动</title>
    <link type="text/css" rel="styleSheet"  href="${ctx}////css/home.css" />
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
		/*空图片样式  */  
		.img_empty{
		width: 100%;height:278px;background:#ffffff;text-align: center;display:table-cell;vertical-align:middle
		}
      </style>
</head>
<body style="background-color: #F8F8F8;margin:1rem">
<!--------1正在申请------------>
<div>
<!--  当没有申请情况-->
	<c:if test="${empty requestScope.joins1}">
		<div class="state1">正在申请</div>
		<div class="img_empty">
			<img src="imgs/join_empty.png" style="width:70%;">
			<div class="message_empty1">暂未申请任何活动</div>
		</div>
	</c:if>
	
	
	<!-- 申请了活动 -->
    <c:forEach items="${requestScope.joins1}" var="join">
    <div class="state1">正在申请</div>
    <img src="${ctx}/upload/${join.activity.img}" style="width: 100%">
    <div style="background-color: #ffffff">
        <div class="content">
            <div class="home_content1">${join.activity.title}</div>
            <div class="home_content2">
                <img src="imgs/place.png" style="width: 10px;height: 11px;">
                <span>${join.activity.activity_place}</span>
            </div>
            <div class="home_content2">
                <img src="imgs/time.png" style="width: 10px;height: 10px;">
                  <span><f:formatDate value="${join.activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </div>
            <div class="home_content2">
                <img src="imgs/sex.png" style="width: 11px;height: 11px;">
                <c:choose>
                    <c:when test="${join.activity.sex_limit == 0}">
    	   				<span>不限男女</span>
    	   		    </c:when>
	       	   		<c:when test="${join.activity.sex_limit == 1}">
	       	   			<span>仅限男生</span>
	       	   		</c:when>
    	   			<c:otherwise><span>仅限女生</span></c:otherwise>
				</c:choose>
            </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
        <div class="content-item" style="margin: 10px 1rem">
	        <c:forEach items="${join.joins1}" var="join1">
	             <img src="${join1.join_head}" style="width: 28px;height: 28px;border-radius:50%">
	       </c:forEach>
          <!--  参加者不足的显示图片 -->
       	  <c:set var="num"  value="${join.activity.people_limit-join.count}"/>
  		  <c:forEach var="i" begin="1" end="${num}">
  		  	<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%">
  		  </c:forEach>                     
            <span class="number">${join.count}/${join.activity.people_limit}</span>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
				<div style="margin: 1rem">
					<img src="${join.activity.user_head}"
						style="float: left;width: 46px;height: 46px;margin-right: 1rem;border-radius:50%">
					<span class="name">${join.activity.user_name}<br></span> <span
						class="banji">${join.activity.user_class}</span>
					<!-- 发起人性别 -->
					<c:choose>
						<c:when test="${join.activity.user_sex == 'M'}">
							<img src="${ctx}/imgs/man.png" style="width: 26px;height: 26px;vertical-align:middle;float: right; margin-top: -24px;">
						</c:when>
						<c:when test="${join.activity.user_sex == 'F'}">
							<span><img src="${ctx}/imgs/woman.png" style="width: 26px;height: 26px;vertical-align:middle;float: right;
							 margin-top: -24px;"></span>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</div>
				<hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
        <a href="details?id=${join.activity.id}"><button class="detail">查看详情</button></a>
    </div>
    <br>
    </c:forEach>
</div>
<!--2申请成功-->
	<c:if test="${empty requestScope.joins2}">
		<div class="state2">申请成功</div>
		<div class="img_empty">
			<img src="imgs/join_empty.png" style="width:70%;">
			<div class="message_empty1">暂未成功申请任何活动</div>
		</div>
	</c:if>
    <c:forEach items="${requestScope.joins2}" var="join">
    <div class="state2">申请成功</div>
    <img src="${ctx}/upload/${join.activity.img}" style="width: 100%">
    <div style="background-color: #ffffff">
        <div class="content">
            <div class="home_content1">${join.activity.title}</div>
            <div class="home_content2">
                <img src="imgs/place.png" style="width: 10px;height: 11px;">
                <span>${join.activity.activity_place}</span>
            </div>
            <div class="home_content2">
                <img src="imgs/time.png" style="width: 10px;height: 10px;">
                  <span><f:formatDate value="${join.activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </div>
            <div class="home_content2">
                <img src="imgs/sex.png" style="width: 11px;height: 11px;">
                <c:choose>
                    <c:when test="${join.activity.sex_limit == 0}">
    	   				<span>不限男女</span>
    	   		    </c:when>
	       	   		<c:when test="${join.activity.sex_limit == 1}">
	       	   			<span>仅限男生</span>
	       	   		</c:when>
    	   			<c:otherwise><span>仅限女生</span></c:otherwise>
				</c:choose>
            </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
        <div class="content-item" style="margin: 10px 1rem">
	        <c:forEach items="${join.joins1}" var="join1">
	             <img src="${join1.join_head}" style="width: 28px;height: 28px;border-radius:50%">
	       </c:forEach>
          <!--  参加者不足的显示图片 -->
       	  <c:set var="num"  value="${join.activity.people_limit-join.count}"/>
  		  <c:forEach var="i" begin="1" end="${num}">
  		  	<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%">
  		  </c:forEach>                     
            <span class="number">${join.count}/${join.activity.people_limit}</span>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
				<div style="margin: 1rem">
					<img src="${join.activity.user_head}"
						style="float: left;width: 46px;height: 46px;margin-right: 1rem;border-radius:50%">
					<span class="name">${join.activity.user_name}<br></span> <span
						class="banji">${join.activity.user_class}</span>
					<!-- 发起人性别 -->
					<c:choose>
						<c:when test="${join.activity.user_sex == 'M'}">
							<img src="${ctx}/imgs/man.png" style="width: 26px;height: 26px;vertical-align:middle;float: right; margin-top: -24px;">
						</c:when>
						<c:when test="${join.activity.user_sex == 'F'}">
							<span><img src="${ctx}/imgs/woman.png" style="width: 26px;height: 26px;vertical-align:middle;float: right; margin-top: -24px;"></span>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</div>
				<hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
        <a href="details?id=${join.activity.id}"><button class="detail">查看详情</button></a>
    </div>
    <br>
    </c:forEach>
    
    <!--3被拒绝的申请-->
	<c:if test="${empty requestScope.joins3}">
		<div class="state3">被拒绝的申请</div>
		<div class="img_empty">
			<img src="imgs/join_empty.png" style="width:70%;">
			<div class="message_empty1">暂无被拒绝加入的活动</div>
		</div>
	</c:if>
    <c:forEach items="${requestScope.joins3}" var="join">
    <div class="state3">被拒绝的申请</div>
    <img src="${ctx}/upload/${join.activity.img}" style="width: 100%">
    <div style="background-color: #ffffff">
        <div class="content">
            <div class="home_content1">${join.activity.title}</div>
            <div class="home_content2">
                <img src="imgs/place.png" style="width: 10px;height: 11px;">
                <span>${join.activity.activity_place}</span>
            </div>
            <div class="home_content2">
                <img src="imgs/time.png" style="width: 10px;height: 10px;">
                  <span><f:formatDate value="${join.activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </div>
            <div class="home_content2">
                <img src="imgs/sex.png" style="width: 11px;height: 11px;">
                <c:choose>
                    <c:when test="${join.activity.sex_limit == 0}">
    	   				<span>不限男女</span>
    	   		    </c:when>
	       	   		<c:when test="${join.activity.sex_limit == 1}">
	       	   			<span>仅限男生</span>
	       	   		</c:when>
    	   			<c:otherwise><span>仅限女生</span></c:otherwise>
				</c:choose>
            </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
        <div class="content-item" style="margin: 10px 1rem">
	        <c:forEach items="${join.joins1}" var="join1">
	             <img src="${join1.join_head}" style="width: 28px;height: 28px;border-radius:50%">
	       </c:forEach>
          <!--  参加者不足的显示图片 -->
       	  <c:set var="num"  value="${join.activity.people_limit-join.count}"/>
  		  <c:forEach var="i" begin="1" end="${num}">
  		  	<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%">
  		  </c:forEach>                     
            <span class="number">${join.count}/${join.activity.people_limit}</span>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
				<div style="margin: 1rem">
					<img src="${join.activity.user_head}"
						style="float: left;width: 46px;height: 46px;margin-right: 1rem;border-radius:50%">
					<span class="name">${join.activity.user_name}<br></span> <span
						class="banji">${join.activity.user_class}</span>
					<!-- 发起人性别 -->
					<c:choose>
						<c:when test="${join.activity.user_sex == 'M'}">
							<img src="${ctx}/imgs/man.png" style="width: 26px;height: 26px;vertical-align:middle;float: right; margin-top: -24px;">
						</c:when>
						<c:when test="${join.activity.user_sex == 'F'}">
							<span><img src="${ctx}/imgs/woman.png" style="width: 26px;height: 26px;vertical-align:middle;float: right; margin-top: -24px;"></span>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</div>
				<hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
        <a href="details?id=${join.activity.id}"><button class="detail">查看详情</button></a>
    </div>
    <br>
    </c:forEach>



</body>
</html>