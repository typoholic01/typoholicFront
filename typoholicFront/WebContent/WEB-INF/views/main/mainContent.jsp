<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS -->
<style>
.ratio {
    width: 100%;
    padding-top: 122%; /* 9:11 Aspect Ratio */
    position: relative;
}
.ratio-item {
    position: absolute;
    height: 100%;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
}
</style>
<!-- AJAX -->
<script type="text/javascript" src='${pageContext.request.contextPath }/resources/js/ajax/bookList.js' ></script>

<script type="text/javascript">
var baseUrl = 'http://localhost:8080/ridibooks';

$(document).ready(function() {
	getPostList('news');
	getPostList('free');
	getCarouselList();
	$('.carousel').carousel();
});
function getCarouselList() {
	$.ajax({
		type: 'GET',
		url: baseUrl + '/book/json',
		data: {
			"category" : '',
			"directionType" : 'clap',
			"direction" : 'desc'
		},		
		async: true, 
		success: function(data) {
			$.each(data, function(index, item) {				
				$('#myCarousel div.carousel-inner').append(setBookHtml(data[index]));
					
				if (index == 0) {
					$('#myCarousel div.carousel-inner div.item').attr('class','item ratio active');
				} else if (index == 5) {
					return false;
				}
			});
		}
	});	
}
function setBookHtml(book) {	
	var html = '<div class="item ratio">'
			+'    <img class="col-sm-12 col-xs-12 ratio-item" src="'+book.cover+'" alt="'+book.title+'">'
			+'    <div class="carousel-caption">'
			+'      <h3>'+book.title+'</h3>'
			+'      <p>'+book.author+'</p>'
			+'    </div>'
			+'  </div>';
	
	return html;
}
</script>
<!-- Ajax -->
<script type="text/javascript">
function getPostList(boardUrl) {
	var target = '#'+boardUrl+' > tbody';
	
	//페이지 초기화
	var page = '${page}';
	if (page == '') {
		page = '1';
	}
	
	$.ajax({
		type: 'GET',
		url: baseUrl + '/json/'+boardUrl,
		data: {
			"page" : page
		},		
		async: true, 
		success: function(data) {			
 			$.each(data, function(index, item) {
  				//글 만들기
 				$(target).append(setPostHtml(data[index]));
  				if (index == 5) {
  					return false;
				}
			}); 
		}	
	});
	
}
function setPostHtml(post) {
	var html = '<tr>'
					+'<td>'
						+'<a href="${pageContext.request.contextPath }/free/'+post.seq+'">'+post.title+'</a>'
					+'</td>'
					+'<td>'+post.userId+'</td>'
				+'</tr>';
	
	return html;
}
</script>
<div class="container">
<div class="row">
	<div class="col-sm-3">
  	<h4 class="category-title" style="border-left: 3px solid steelblue;padding-left: 0.3em;">베스트셀러</h4>
  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
      <!-- bookList	 -->
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <div class="col-sm-9">
  	<div class="row">
		<div class="table-responsive">
		<h4 class="category-title" style="border-left: 3px solid steelblue;padding-left: 0.3em;">뉴스 게시판</h4>   	          
		  <table id="news" class="table table-hover table-bordered">
		  	<colgroup>
		  		<col class="col-sm-9" />
		  		<col class="col-sm-3" />
		  	</colgroup>
		    <tbody>
		 	<!-- 				게시물 불러오기				 -->   
		    </tbody>
		  </table>
	  	</div>
  	</div>
  	<div class="row">
		<div class="table-responsive">
		<h4 class="category-title" style="border-left: 3px solid steelblue;padding-left: 0.3em;">자유 게시판</h4>   	          
		  <table id="free" class="table table-hover table-bordered">
		  	<colgroup>
		  		<col class="col-sm-9" />
		  		<col class="col-sm-3" />
		  	</colgroup>
		    <tbody>
		 	<!-- 				게시물 불러오기				 -->   
		    </tbody>
		  </table>
	  	</div>
  	</div>
  </div>  
</div>
<hr>
</div>