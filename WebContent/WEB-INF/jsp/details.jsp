<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>活动详情</title>
    <link type="text/css" rel="styleSheet"  href="${ctx }//css/home.css" />
    <!--提示信息  -->
     <script src="${ctx }/js/message.js"></script>
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
      </style>

</head>
<body>
 <c:set var="userinfo_session"  value="${sessionScope.userinfo_session}"/>
   <c:set var="activity"  value="${requestScope.activity1}"/>
    <div style=" margin: 0 0 1rem;">
        <img src="${ctx}/upload/${activity.img}" class="home_commend">
        <div style="background-color: #ffffff">
            <!--------活动细节---------->
           
             <input type="hidden" name="id"  value="${activity.id}" />
            <div class="content">
                <div class="home_content1">${activity.title}</div>
                <div class="home_content2">
                    <img src="imgs/place.png" style="width: 10px;height: 11px;">
                    <span>${activity.activity_place}</span>
                </div>
                <div class="home_content2">
                    <img src="imgs/time.png" style="width: 10px;height: 10px;">
                   <span><f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/></span>

                </div>
                <div class="home_content2">
					<img src="imgs/sex.png" style="width: 11px;height: 11px;">
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
                <div class="home_content2">
                   
                    <!-- 判断是否参加成功 -->
                    <c:forEach items="${activity.joins}" var="join">
                		<c:if test="${join.joinuser_id==userinfo_session.user_id }">
							<c:set var="joinuser_id"  value="${join.joinuser_id}"/>
						</c:if>
                     </c:forEach>
                    <c:choose>
						<c:when test="${(userinfo_session.user_id == joinuser_id) or (userinfo_session.user_id == activity.user_id)}">
							 <img src="imgs/phone_small.png" style="width: 10px;height: 10px;">
							<span style="color: rgba(254,181,36,1)">${activity.phone}</span>
							<!-- qq 少一个qq图标-->
							<span style="color: rgba(254,181,36,1)">${activity.qq}</span>
						</c:when>
						<c:otherwise>
							<span style="color: rgba(254,181,36,1)">成功加入后可见发起人联系方式</span>
						</c:otherwise>
					</c:choose>
                    <!--未成功加入-->
                   <!--  <span style="color: rgba(254,181,36,1)">成功加入后可见发起人联系方式</span> -->
                    <!--成功加入-->
                    <!--<span style="color: rgba(254,181,36,1)">联系方式</span>-->
                </div>
            </div>
            <!----------活动详情------->
            <div class="content">
                <div class="details_title" style=" font-weight:bold">活动详情</div>
                <div class="details_content">${activity.activity_content}</div>
            </div>
            <div class="content">
                <div class="details_title"  style=" font-weight:bold">已加入的同学</div>
                <div class="content-item" style="margin:10px 0;">
                	<c:forEach items="${activity.joins}" var="join">
                		<c:if test="${join.joinuser_id==userinfo_session.user_id }">
							<c:set var="join_state"  value="${join.join_state}"/>
						</c:if>						
						<span>
							<c:choose>
                				<c:when test="${join.join_state == 2}">
 	   								<img src="${join.join_head}" style="width: 28px;height: 28px;border-radius:50%;">
 	   							</c:when>
 	   							<c:otherwise></c:otherwise>
							</c:choose>											
					    </span>
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
            </div>
            <!--活动发起人-->
            <div class="content">
                <div class="details_title"  style=" font-weight:bold">活动发起人</div>
            </div>
        </div>
    </div>
    <div  style="background-color:#F8F8F8;padding:1px 1rem 1px 0;margin-bottom:4rem" >
        <div style="margin: 1rem;">
            <img src="${activity.user_head}" style="float: left;width: 46px;height: 46px;margin-right: 1rem;border-radius: 50%;">
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
    </div>
    <!--不同状态显示不同按钮  -->
	<div>
		<c:choose>
			<c:when test="${userinfo_session.user_id == activity.user_id}">
			<!-- 如果没有组员显示还没有组员 -->
			    <c:choose>
				    <c:when test="${activity.count == 0}">
				    	<button type="submit" class="find_phone"  id="find_phone">查看组员联系方式</button>
				    </c:when>
				    <c:otherwise>
				    	<a href="members?activity_id=${activity.id}"><button type="submit" class="find_phone">查看组员联系方式</button></a>
				    </c:otherwise>
			    </c:choose>
			    <!-- 如果没有人申请显示还无人申请 -->
			     <c:choose>
				    <c:when test="${activity.app_count == 0}">
				    	<button type="submit" class="find_insert" id="find_insert">查看申请信息</button>
				    </c:when>
				    <c:otherwise>
				    	<a href="application?activity_id=${activity.id}&&flag=0"><button type="submit" class="find_insert">查看申请信息</button></a>	
				    </c:otherwise>
			    </c:choose>			     			
			</c:when>
			<c:otherwise>
			<!-- 针对参见者 -->
				<c:choose>
					<c:when test="${join_state == 1}">
						<button class="details_join2">等待发起人同意</button>
					</c:when>
					<c:when test="${join_state == 2}">
						<!-- 已同意 -->
						<button class="details_join2">已同意</button> 
					</c:when>
					<c:when test="${join_state == 3}">
						<button class="details_join2">被拒绝</button>
					</c:when>
					<c:otherwise>
					<!-- 针对参见者 -->
						<c:choose>
						<c:when test="${activity.count == activity.people_limit && activity.people_limit!=0 }">
						<!-- 人已满 -->
							<button class="details_join2">人已满</button>
						</c:when>
						<c:otherwise>	
							<a href="add_join?activity_id=${activity.id}&&flag=0"><button class="details_join">申请参加</button></a>
						</c:otherwise>
						</c:choose>

					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		
	</div>

<script type="text/javascript">
	document.getElementById('find_phone').onclick = function () {
	    alert('还未有组员参加!')
	};
	document.getElementById('find_insert').onclick = function () {
	    alert('还未有人申请!')
	};
</script>

</body>
</html>