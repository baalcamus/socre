<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>首页</title>

</head>

<body class=" ">
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN CONTENT-->
				<div class="alert alert-warning clearfix">
					<i class="fa fa-volume-down"></i><strong>消息通知</strong><span>
						<script>
							var marqueeContent = new Array(); //滚动主题 
							marqueeContent[0] = '<a href="javascript:void(0);">黑龙江省科学院条财项目评审系统全新上线！</a>';
							marqueeContent[1] = '<a href="javascript:void(0);">黑龙江省科学院条财项目评审系统全新上线！</a>';
							var marqueeInterval = new Array(); //定义一些常用而且要经常用到的变量 
							var marqueeId = 0;
							var marqueeDelay = 4000;
							var marqueeHeight = 18;
							function initMarquee() {
								var str = marqueeContent[0];
								document
										.write('<div id=marqueeBox style="overflow:hidden;height:'
												+ marqueeHeight
												+ 'px" onmouseover="clearInterval(marqueeInterval[0])" onmouseout="marqueeInterval[0]=setInterval(\'startMarquee()\',marqueeDelay)"><div>'
												+ str + '</div></div>');
								marqueeId++;
								marqueeInterval[0] = setInterval(
										"startMarquee()", marqueeDelay);
							}
							function startMarquee() {
								var str = marqueeContent[marqueeId];
								marqueeId++;
								if (marqueeId >= marqueeContent.length)
									marqueeId = 0;
								if (marqueeBox.childNodes.length == 1) {
									var nextLine = document
											.createElement('DIV');
									nextLine.innerHTML = str;
									marqueeBox.appendChild(nextLine);
								} else {
									marqueeBox.childNodes[0].innerHTML = str;
									marqueeBox
											.appendChild(marqueeBox.childNodes[0]);
									marqueeBox.scrollTop = 0;
								}
								clearInterval(marqueeInterval[1]);
								marqueeInterval[1] = setInterval(
										"scrollMarquee()", 10);
							}
							function scrollMarquee() {
								marqueeBox.scrollTop++;
								if (marqueeBox.scrollTop % marqueeHeight == marqueeHeight) {
									clearInterval(marqueeInterval[1]);
								}
							}
							initMarquee();
						</script>
					</span>
				</div>
				<div class="page-content">
					<!--这是交易量模块开始-->
					<div class="index_user">
						<div class="left">
							<h1>黑龙江省科学院条财项目评审系统</h1>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-8">
							<div class="panel index_pro">
								<div class="panel-body">

									<div class="col-lg-6 col-sm-6 col-xs-12">
										<div class="index_pro_box">

											<div class="pro_icon df"></div>
											<div class="pro-txt">
												<h1>评审</h1>
												<br>
											</div>
										</div>

									</div>
									<div class="col-sm-6 col-md-6">
										<div class="index_pro_box">

											<div class="pro_icon ds"></div>
											<div class="pro-txt">
												<h1>评审</h1>
												<br>
											</div>
										</div>

									</div>
									<div class="col-sm-6 col-md-6">
										<div class="index_pro_box">

											<div class="pro_icon risk"></div>
											<div class="pro-txt">
												<h1>评审</h1>
											</div>

										</div>

									</div>
									<div class="col-sm-6 col-md-6">
										<div class="index_pro_box">

											<div class="pro_icon wy"></div>
											<div class="pro-txt">
												<h1>评审</h1>
												<br>
											</div>

										</div>

									</div>
									<div class="col-sm-6 col-md-6">
										<div class="index_pro_box">

											<div class="pro_icon kj"></div>
											<div class="pro-txt">
												<h1>评审</h1>
												<br>
											</div>
										</div>

									</div>
									<div class="col-sm-6 col-md-6">
										<div class="index_pro_box">

											<div class="pro_icon kj02"></div>
											<div class="pro-txt">
												<h1>评审</h1>
												<br>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="col-lg-4">

							<div class="portlet box prolet-primary">
								<div class="portlet-header">
									<div class="caption text-uppercase">
										<i style="font-size: 17px; margin-top: 2px;"
											class="fa fa-inbox"></i>待办事物
									</div>
								</div>
								<div class="panel-body">
									<ul>
										<li><a href="#">黑龙江省科学院条财项目评审系统全新上线！</a></li>

									</ul>

								</div>
							</div>

						</div>
					</div>

				</div>
				<!--End CONTENT-->
			</div>
			<!--右侧内容 end-->

		</div>


	</div>
</body>
</html>
