<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 申请信息 -->
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>申请信息</title>

  <style>
        body {
      margin: 0;
      padding: 0 20px;
      background: #f6f7fc;
    }

    /* 成员卡片，外层容器 */
    .member-card {
      display: flex;
      flex-direction: column;
      width: 100%;
      margin: 16px 0;
      background: #fff;
      border-radius: 5px;
    }

    /* 成员信息，包括头像、用户名、班级、性别 */
    .member-info {
      display: flex;
      align-items: center;
      height: 46px;
      padding: 12px 20px;
    }

    .info-avatar {
      width: 46px;
      margin: 0 16px 0 0;
      border-radius:50%
    }

    .info-detail {
      flex: 1;
    }

    .info-detail h1,
    .info-detail h2 {
      margin: 0;
    }

    .info-detail h1 {
      font-size: 18px;
      color: rgba(66, 66, 91, 1);
    }

    .info-detail h2 {
      font-size: 12px;
      color: rgba(159, 159, 172, 1);
    }

    .info-sex {
      width: 26px;
      height: 27px;
      margin: 0 0 0 20pt;
    }

    /* 成员申请信息 */
    .member-message {
      position: relative;
      padding: 38px 12px 36px 34px;
      color: rgba(159,159,172,1);
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;
    }

    .member-message::before {
      position: absolute;
      top: 4px;
      left: 0;
      width: 23px;
      font-size: 23px;
      text-align: right;
      color: rgba(159, 159, 172, 1);
      content: '“';
    }

    .member-message::after {
      position: absolute;
      right: 0;
      bottom: 0;
      width: 23px;
      height: 34px;
      font-size: 23px;
      color: rgba(159, 159, 172, 1);
      content: '”';
    }

    /* 卡片操作 */
    .card-operation {
      display: flex;
      height: 51px;      
    }

    .card-operation > button, .card-operation > a {      
      flex: 1;
      padding: 0;
      font-size: 18px;
      border: 0;
      background: inherit;
    }
    
    .card-operation > a {
      line-height: 51px;      
      text-align: center;  
      text-decoration: none;
    }

    .operation-reject, .operation-rejected {      
      color: rgba(255,32,118,1);
      border-right: 1px solid #f0f0f0 !important;
    }

    .operation-consent {      
      color: rgba(0,165,237,1);
    }    

    .operation-consented {
      color: rgba(254,181,36,1);
    }
  </style>
</head>

<body>
 <c:set value="${requestScope.activity1}" var="activity"/>
 <c:forEach items="${activity.joins}" var="join">
  <!-- 成员卡片 -->
  <div class="member-card">
	
    <!-- 用户信息，包括头像、用户名、班级、性别 -->
    <div class='member-info'>
      <!-- 用户头像 -->
      <img class='info-avatar' src="${join.join_head}" alt="头像">
      <div class='info-detail'>
        <!-- 用户名 -->
        <h1>${join.join_name}</h1>
        <!-- 班级 -->
        <h2>${join.join_class}</h2>
      </div>
      <!-- 性别默认男，性别是女的话替换 src 为 ./images/icon-sex-woman.png -->
      <!-- 参加者性别 -->
            <c:choose>
                <c:when test="${join.join_sex == 'M'}">
					<img class='info-sex' src="${ctx}/imgs/man.png" alt="性别">				 
 	   			</c:when>
	       	    <c:when test="${join.join_sex == 'F'}">
	       	   		<img class='info-sex' src="${ctx}/imgs/woman.png" alt="性别">
	       	    </c:when>
 	   			<c:otherwise></c:otherwise>
			</c:choose>
    </div>

    <!-- 成员申请信息 -->
   <!--  留言 -->
    <div class="member-message">
      ${join.words}
    </div>

    <!-- 操作 -->
    <div class="card-operation">
      <!-- 未做操作时 -->
      <c:choose>
		<c:when test="${join.join_state == 2 }">
			<button class='operation-consented'>已同意</button>
		</c:when>
		<c:when test="${join.join_state == 3}">
			<button class='operation-rejected'>已拒绝</button>	       	   
	   </c:when>
		<c:otherwise>
			<a class='operation-reject' href="application?join_id=${join.id}&&flag=3&&activity_id=${activity.id}">拒绝</a>
			<a class='operation-consent' href="application?join_id=${join.id}&&flag=2&&activity_id=${activity.id}">同意</a>
		</c:otherwise>
	</c:choose>
    </div>
  </div>
  </c:forEach>
</body>

</html>