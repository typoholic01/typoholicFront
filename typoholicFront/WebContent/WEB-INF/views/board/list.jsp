<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- list-style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/list.css" />
<!-- Ajax -->
<script type="text/javascript">
$(document).ready(function() {
	getPostList();
});
function getPostList() {
	//페이지 초기화
	var page = '${page}';
	if (page == '') {
		page = '1';
	}
	
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath }/json/${boardUrl}',
		data: {
			"page" : page
		},		
		async: true, 
		success: function(data) {
			console.log(data);
			
 			$.each(data, function(index, item) {
 				console.log(data[index]);
  				//글 만들기
 				$('#postList > tbody').append(setPostHtml(data[index]));
			}); 
		}	
	});
	
}
function setPostHtml(post) {
	var html = '<tr>'
					+'<td>'+post.seq+'</td>'
					+'<td>'
						+'<a href="${pageContext.request.contextPath }/${boardUrl}/'+post.seq+'?page=${pagination.currPage}">'+post.title+'</a>'
					+'</td>'
					+'<td>'+post.userId+'</td>'
					+'<td>'+post.createAt+'</td>'
				+'</tr>';
	
	return html;
}
</script>
<!-- body -->
<h2 class="category-title">${boardName }</h2>

<div class="row">
<div class="col-sm-12">
<div class="table-responsive">          
  <table id="postList" class="table table-hover table-bordered">
  	<colgroup>
  		<col class="col-sm-1" />
  		<col class="col-sm-7" />
  		<col class="col-sm-2" />
  		<col class="col-sm-2" />
  	</colgroup>
    <thead>
      <tr class="active">
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>
 	<!-- 				게시물 불러오기				 -->   
    </tbody>
  </table>
  </div>
</div>
</div>


    <!-- 버튼 목록 -->
	<div class="button-group col-sm-12" style="text-align: -webkit-right;">
		<div class="arc-comment">
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/${boardUrl }/write'"><i class="fa fa-comments"></i> 글쓰기</button>			
		</div>
	</div>

	<!-- 페이징 -->
    <div style="text-align: center;">
    <ul class="pagination pagination-lg">
    	<!-- 10페이지 이전 -->
    	<c:choose>
	  	<c:when test="${pagination.currPage <= pagination.pageLimit }">
	  		<li class="disabled"><a><i class="fa fa-angle-double-left"></i></a></li>	  	
	  	</c:when>
	  	<c:otherwise>
	  		<li><a href="${pageContext.request.contextPath }/${boardUrl }?page=${pagination.currPage - pagination.pageLimit }"><i class="fa fa-angle-double-left"></i></a></li>	 	  	
	  	</c:otherwise>
	  </c:choose> 
	  <!-- 1페이지 이전 -->
	  <c:choose>
	  	<c:when test="${pagination.currPage == 1 }">
	  		<li class="disabled"><a><i class="fa fa-angle-left"></i></a></li>	  	
	  	</c:when>
	  	<c:otherwise>
	  		<li><a href="${pageContext.request.contextPath }/${boardUrl }?page=${pagination.currPage - 1 }"><i class="fa fa-angle-left"></i></a></li>	 	  	
	  	</c:otherwise>
	  </c:choose>
	  <!-- 페이징 설정만큼 돌리기 -->
	  <c:forEach var="i" begin="${pagination.startPage }" end="${pagination.endPage }" step="1">
	  	<c:choose>
	  		<c:when test="${i == pagination.currPage }">
	 			<li class="active">
	 				<a href="${pageContext.request.contextPath }/${boardUrl }?page=${i }">${i }</a>
	 			</li>	  		
	  		</c:when>
	  		<c:otherwise>
	  			<li><a href="${pageContext.request.contextPath }/${boardUrl }?page=${i }">${i }</a></li>	  		
	  		</c:otherwise>
	  	</c:choose>
	  </c:forEach>
	  <!-- 1페이지 이후 -->
	  <c:choose>
	  	<c:when test="${pagination.currPage == pagination.finalEndPage }">
	  		<li class="disabled"><a><i class="fa fa-angle-right"></i></a></li>	  	
	  	</c:when>
	  	<c:otherwise>
	  		<li><a href="${pageContext.request.contextPath }/${boardUrl }?page=${pagination.currPage + 1 }"><i class="fa fa-angle-right"></i></a></li>	 	  	
	  	</c:otherwise>
	  </c:choose>
	  <!-- 10페이지 이후 -->
	  <c:choose>
	  	<c:when test="${pagination.currPage + pagination.pageLimit > pagination.finalEndPage }">
	  		<li class="disabled"><a><i class="fa fa-angle-double-right"></i></a></li>	  	
	  	</c:when>
	  	<c:otherwise>
	  		<li><a href="${pageContext.request.contextPath }/${boardUrl }?page=${pagination.currPage + pagination.pageLimit }"><i class="fa fa-angle-double-right"></i></a></li>	 	  	
	  	</c:otherwise>
	  </c:choose>
	</ul>
    </div>
    