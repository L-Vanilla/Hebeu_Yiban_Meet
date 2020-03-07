<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心</title>
  <link rel="stylesheet" href="${ctx }//css/home.css">
  <style type="text/css">
	  .menu-mycreate::before {
	  background: url('${ctx}//imgs/launch.png') top left/19px no-repeat;
	}
	
	.menu-mysign::before {
	  background: url('${ctx}//imgs/join.png') top left/16px 17px no-repeat;
	}
	.footer{
    background-color: #ffffff;
    height: 56px;
    width: 100%;
    bottom: 0;
    position:fixed;
    z-index:999;
    display: flex;
    align-items: center;
    margin-left: 0!important;
	}
	.navigation{
	    display:inline;
	    float: left;
	    margin-left: 12%;
	    width: 21%;
	}
  </style>
</head>

<body style="background-color: #F8F8F8;">
  <!-- 背景样式相关 -->
  <div class='background-style'></div>

  <!-- 网页头部，包括头像、用户名、班级 -->
  <div class='user-info'>
  <c:set var="user"  value="${sessionScope.userinfo_session}"/>
    <img class='info-avatar' src="${user.user_head}" alt="头像">
    <h1 class='info-name' class=>${user.user_name}</h1>
    <p class='info-class'>${user.user_class}</p>
  </div>

  <!-- 菜单 -->
  <div class='menu-list'>
   <a href="my_activity" style="-webkit-tap-highlight-color: transparent;">
	    <div class='menu-item menu-mycreate'>
	      <span>我发布的活动</span>
	    </div>
    </a>
     <a href="my_join" style="-webkit-tap-highlight-color: transparent;">
	    <div class="menu-item menu-mysign" >
	      <span>我报名的活动</span>
	    </div>
    </a>
  </div>

     <!--底部导航栏-->
    <footer class="footer">
        <div class="navigation" ><a href="home"><img src="${ctx}/imgs/home_active.png" style="height:28.5px;width:34px"></a></div>
        <div class="navigation"><a href="add_activity?flag=0"> <img src="${ctx}/imgs/insert.png" style="height:40.5px;width:40.5px"></a></div>
        <div class="navigation"><a href="mine"><img src="${ctx}/imgs/my_active.png" style="height:29.5px;width:28.5px"></a></div>
    </footer>
</body>

</html>