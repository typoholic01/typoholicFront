<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath }/js/password-confirm.js"></script>

<div class="container">
	<div class="row main col-sm-4 col-sm-offset-4">
		<div class="panel-heading">
              <div class="panel-title text-center">
              		<h1 class="title">활자중독</h1>
              		<hr />
              	</div>
           </div> 
		<div class="main-login main-center">
			<form class="form-horizontal" method="post" action="account">

				<div class="form-group">
					<label for="email" class="cols-sm-2 control-label">이메일</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="nickname" class="cols-sm-2 control-label">별명</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon" style="    padding: 6px 13.5px;"><i class="fa fa-user fa" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="nickname" id="nickname" placeholder="별명을 입력해주세요"/>
						</div>
					</div>
				</div>

				<div id="password" class="form-group">
					<label for="password" class="cols-sm-2 control-label">비밀번호</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input onblur="confirmPassword();" type="password" class="form-control" name="password" placeholder="Enter your Password"/>
							<span class="glyphicon glyphicon-ok form-control-feedback" style="display: none;"></span>
						</div>
					</div>
				</div>

				<div id="confirm" class="form-group">
					<label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input onblur="confirmPassword();" type="password" class="form-control" name="confirm" placeholder="Confirm your Password"/>
							<span class="glyphicon glyphicon-ok form-control-feedback" style="display: none;"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-lg btn-block login-button">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>