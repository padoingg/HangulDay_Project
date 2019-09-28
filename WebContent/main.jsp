<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<style>
#hg2{
	margin: 50px;
}
</style>
<body class="is-preload">
<section id="header">
				<header class="major">
					<h1>바른 말 고운 말, 초성 맞추기</h1>
					<p>10월 2일부터 10월 9일까지</p>
				</header>
				<div class="container">
					<ul class="actions special">
						<li><a href="#one" class="button primary scrolly">이벤트 안내</a></li>
					</ul>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic01.jpg" alt="" /></span>
					<div class="content">
						<header class="major">
							<h2>[ㄱ, ㄷ, ㅁ, ㅇ, ㅈ, ㅎ]</h2>
						</header>
						<img id="hg2" src="images/hg2.jpg" alt="" width="300px" height="200"/><br>
						<p>
						주어진 초성으로 자신만의 문장을 완성시켜주세요.<br>
						예) 멋진 한글들, 만두가 좋아 ... (글자수, 중복 제한 없음)<br>
						이벤트에 참여하신 분들 중 3분을 선정하여 선물을 드립니다.
						</p>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic02.jpg" alt="" /></span>
					<div class="content">
						<header class="major">
							<h2>이벤트 참여</h2>
						</header>
						<form method="post" action="event.jsp">
							이름: <input type="text" id="name" name="name"><br><br>
							내용: <input type="text" id="content" name="content"><br><br>
							전화번호: <input type="text" id="phone" name="phone"><br><br>
							<input type="submit" value="참여"><br>
						</form>
					</div>
				</div>
			</section>
			
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>