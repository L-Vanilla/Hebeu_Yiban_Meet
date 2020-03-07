<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <title>首页</title>
    <link rel="stylesheet" href="${ctx }/css/home.css"> 
    <script src="${ctx }/js/zepto_min.js"></script>
    <script src="${ctx }/js/touchslider.js"></script>
    <style type="text/css">
   		#slider1 {
    	height: auto !important;
    	margin-bottom: 56px;
	  }
	  li {
	    height: auto !important; 
	  }
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
	
    </style>
</head>
<body style="background-color: #F8F8F8;">

    <ul id="pagenavi1" class="page" style="position:fixed;z-index: 1;top: 0;">
        <li><a href="#" class="active">推荐</a></li>
        <li><a href="#">约吃饭</a></li>
        <li><a href="#">约跑步</a></li>
        <li><a href="#">约逛街</a></li>
        <li><a href="#">约学习</a></li>
        <li><a href="#">约游戏</a></li>
        <li><a href="#">约其他</a></li>
    </ul>
    <!--内容详情-->
    <div id="slider1" class="home" style="margin-top:3rem">
        <ul>
            <!-------推荐页面----------->
          
            <li>
              <c:forEach items="${requestScope.activitys}" var="activity"><br>
				<input type="hidden" name="id"  value="${activity.id}" />
                <div class="home_title">
						<img src="${ctx }/imgs/juxing.png" style="height:22px;">
						<c:choose>
							<c:when test="${activity.type == 0}">
								约吃饭
							</c:when>
							<c:when test="${activity.type == 1}">
								约跑步
							</c:when>
							<c:when test="${activity.type == 2}">
								约逛街
							</c:when>
							<c:when test="${activity.type == 3}">
								约学习
							</c:when>
							<c:when test="${activity.type == 4}">
								约游戏
							</c:when>
							<c:otherwise>
								约其他
							</c:otherwise>
						</c:choose>
						<!-- <a href="home.html"
							class="home_more">更多></a> -->
					</div>
                <img src="${ctx}/upload/${activity.img}" class="home_commend">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
               
      				<hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />    
      				 			        
                 	<!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem;">
                   	   <c:forEach items="${activity.joins}" var="join">                     	 
	                   	    	<img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">           	                       	                    	                     
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
                		  </c:when>
                		  <c:otherwise>
	                		   <c:set var="num"  value="${activity.people_limit-activity.count}"/>
	                		  <c:forEach var="i" begin="1" end="${num}">
	                		  	<img src="${ctx}/imgs/3.png" style="width: 28px;height: 28px;border-radius:50%;margin-right:10px;">
	                		  </c:forEach>
	                		  <span class="number" >${activity.count}/${activity.people_limit}</span>
                		  </c:otherwise>
                	   </c:choose>

                   </div>
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                  <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
            <!------------0约吃饭------------->
            <li class="li_list">
             <c:forEach items="${requestScope.activitys0}" var="activity"><br>
             	<input type="hidden" name="id"  value="${activity.id}" />
                <img src="${ctx}/upload/${activity.img}" class="home_commend" style=" margin-top: 2rem;">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem">
                   	   <c:forEach items="${activity.joins}" var="join">                   	                       	                    	  
                          <img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">                      
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
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
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <!-- --------------------------- -->
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                   <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
            <!------------1跑步------------->
            <li class="li_list">
             <c:forEach items="${requestScope.activitys1}" var="activity"><br>
             	<input type="hidden" name="id"  value="${activity.id}" />
                <img src="${ctx}/upload/${activity.img}" class="home_commend" style=" margin-top: 2rem;">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem">
                   	   <c:forEach items="${activity.joins}" var="join">                   	                       	                    	  
                          <img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">                      
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
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
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <!-- --------------------------- -->
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                   <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
            <!------------2约逛街------------->
            <li class="li_list">
             <c:forEach items="${requestScope.activitys2}" var="activity"><br>
             	<input type="hidden" name="id"  value="${activity.id}" />
                <img src="${ctx}/upload/${activity.img}" class="home_commend" style=" margin-top: 2rem;">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem">
                   	   <c:forEach items="${activity.joins}" var="join">                   	                       	                    	  
                          <img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">                      
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
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
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <!-- --------------------------- -->
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                   <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
            <!------------3约学习------------->
           <li class="li_list">
             <c:forEach items="${requestScope.activitys3}" var="activity"><br>
             	<input type="hidden" name="id"  value="${activity.id}" />
                <img src="${ctx}/upload/${activity.img}" class="home_commend" style=" margin-top: 2rem;">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem">
                   	   <c:forEach items="${activity.joins}" var="join">                   	                       	                    	  
                          <img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">                      
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
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
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <!-- --------------------------- -->
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                   <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
            <!------------4约游戏------------->
            <li class="li_list">
             <c:forEach items="${requestScope.activitys4}" var="activity"><br>
             	<input type="hidden" name="id"  value="${activity.id}" />
                <img src="${ctx}/upload/${activity.img}" class="home_commend" style=" margin-top: 2rem;">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem">
                   	   <c:forEach items="${activity.joins}" var="join">                   	                       	                    	  
                          <img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">                      
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
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
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <!-- --------------------------- -->
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                   <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
            <!------------5约其他------------->
           <li class="li_list">
             <c:forEach items="${requestScope.activitys5}" var="activity"><br>
             	<input type="hidden" name="id"  value="${activity.id}" />
                <img src="${ctx}/upload/${activity.img}" class="home_commend" style=" margin-top: 2rem;">
                <div style="background-color: #ffffff">
                    <div class="content">
                        <div class="home_content1">${activity.title}</div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/place.png" style="width: 10px;height: 11px;">
                            <span>${activity.activity_place}</span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/time.png" style="width: 10px;height: 10px;">
                            <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                        <div class="home_content2">
                            <img src="${ctx}/imgs/sex.png" style="width: 11px;height: 11px;">
                             <c:choose>
                            <c:when test="${activity.sex_limit == 0}">
       	   						<span>不限男女</span>
       	   					</c:when>
				       	   <c:when test="${activity.sex_limit == 1}">
				       	   		<span>仅限男生</span>
				       	   </c:when>
       	   					<c:otherwise><span>仅限女生</span></c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!-- 参加者 -->
                   <div class="content-item" style="margin:10px 1rem">
                   	   <c:forEach items="${activity.joins}" var="join">                   	                       	                    	  
                          <img src="${join.join_head}" style="width:28px;height: 28px;border-radius:50%;margin-right:10px">                      
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
                		  		<span class="number"> <img src="imgs/wuxian.png" style="width: 28px;height: 28px;"> </span>
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
		      
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                    <!------------- 发布人信息----------- -->
                    <div  style="margin: 1rem">
                        <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem; border-radius: 50%;">
                        <span class="name">${activity.user_name}<br></span>
                        <span class="banji">${activity.user_class}</span>
                        	<!-- 发起人性别 -->
							<c:choose>
								<c:when test="${activity.user_sex == 'M'}">
									<img src="${ctx}/imgs/man.png"
										style="width: 26px;height: 26px; vertical-align: middle; float: right; margin-top: -15px;">
								</c:when>
								<c:when test="${activity.user_sex == 'F'}">
									<span><img src="${ctx}/imgs/woman.png"
										style="width: 26px;height: 26px;vertical-align: middle; float: right; margin-top: -15px;"></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
                    </div>
                    <!-- --------------------------- -->
                    <hr style="height:1px;border:none;border-top:1px solid rgba(241,241,243,1);" />
                   <a href="details?id=${activity.id}"><button class="detail" >查看详情</button></a>
                </div>
                </c:forEach>
            </li>
         </ul>
    </div>
  <ul id="pagenavi2"></ul> 
    <!--底部导航栏-->
    <footer class="footer">
        <div class="navigation" ><a href="home"><img src="${ctx}/imgs/home_active.png" style="height:28.5px;width:34px"></a></div>
        <div class="navigation"><a href="add_activity?flag=0"> <img src="${ctx}/imgs/insert.png" style="height:40.5px;width:40.5px"></a></div>
        <div class="navigation"><a href="mine"><img src="${ctx}/imgs/mine.png" style="height:29.5px;width:28.5px"></a></div>
    </footer>
</body>
 <script type="text/javascript">
 		// 卡片设置圆角
 		window.onload = ()=> {
            const nav = document.querySelectorAll('#pagenavi1 li a')
            const pages = document.querySelectorAll('#slider1 ul li')  
            $('#slider1 > ul > li').append('<div style="padding: 30px 0 14px;text-align: center;color: #ccc;">暂无更多</div>')
		pages.forEach((item, index) => index !== 0 ? item.style.display = 'none' : '')
          
            
            const addNavEvent = () => {                
                nav.forEach((item, index) => {
                    item.addEventListener('click', () => {                        
                        // 导航栏 a 标签添加选中样式
                        item.classList.add('active')
                        // 其他 a 标签移除选中样式                        
                        nav.forEach((item2, index2) => index !== index2 ? item2.classList.remove('active') : '')                        
                        // 显示当前索引页面，隐藏其它
                        pages.forEach((item3, index3) => item3.style.display = index === index3 ? 'block' : 'none')
                    })
                })        
            }

            addNavEvent()

           $('.content').parent().css('border-radius', '5px !important')
           // 顶部滚动条未选中项透明度
            $('.page').children('li').children('a').css('opacity', '0.7')
            // 卡片列表上边距 
            $('.home').css('margin-top', 'calc(40px + 1rem) !important')     
            // 卡片活动分类标题样式
            $('.home_title')
                .css({'display': 'flex', 'align-items': 'center', 'margin-bottom': '12px', 'margin-top': '0 !important'})
                .children('img')
                .css('margin-right','12px')
            // 卡片活动详情图标文字对齐                
            $('.home_content2')
                .css({'display': 'flex', 'align-items': 'center'})
                .children('img').css('margin-right','5px')                
            // 卡片图片圆角
            $('.home_commend').css({'margin-top': '0 !important', 'border-top-left-radius': '5px', 'border-top-right-radius': '5px'})            


 		}
 
 
    </script>
</html>