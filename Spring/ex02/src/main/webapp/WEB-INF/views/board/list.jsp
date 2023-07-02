<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
     <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>
    <script src="https://ajax.googlepis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
	
		checkModal(result);
		
		history.replaceState({},null,null);
		
		
		function checkModal(result){
			if(result === '' || history.state){
				return;
			}
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 "+parseInt(result)+" 번이 등록되었습니다.");
			}
			$("#myModal").modal('show');
		}
		
		$("#regBtn").on("click", function(){
			self.location="/board/register";
		});
		
		var actionForm = $('#actionForm');
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
		
		var searchForm = $('#searchForm');
		$('#searchForm button').on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
		
		
	});
</script>
	

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="../includes/navibar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@include file="../includes/header.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
				<div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer"><div class="row">
                                <div class="col-sm-12 col-md-6">
                                <div class="dataTables_length" id="dataTable_length">
                                <label>Show <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                                </select> entries</label>
                                </div></div>
                                <div class="col-sm-12 col-md-6">
                                <div id="dataTable_filter" class="dataTables_filter">
                                <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label>
                                </div>
                                </div>
                                </div><div class="row">
                                <div class="col-sm-12">
                             <table class="table table-bordered dataTable no-footer" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                   <thead>
                                   		<th>#번호</th>
                                   		<th>제목</th>
                                   		<th>작성자</th>
                                   		<th>작성일</th>
                                   		<th>수정일</th>
                                   
                                 <tbody>
                                   	<c:forEach items="${list}" var="board" varStatus="loop">
                                   	<tr>
                                   		<td><c:out value="${board.bno }"></c:out></td>
                                   		<td><a class="move" href='<c:out value="${board.bno }"/>'><c:out value="${board.title }"/></a></td>
                                   		<td><c:out value="${board.writer }"></c:out></td>
                                   		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }"/></td>
                                   		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                                   	</tr>
                                   </c:forEach>
                                </tbody>
                              </table>
                              
                              <div class="row">
                              	<div class="col-lg-12">
                              		<form id="searchForm" action="/board/list" method="get">
                              			<select name="type">
                              				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>--</option>
                              				<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/>>제목</option>
                              				<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/>>내용</option>
                              				<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/>>작성자</option>
                              				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/>>제목 or 내용</option>
                              				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/>>제목 or 작성자</option>
                              				<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }"/>>제목 or 작성자 or 내용</option>
                              			</select>
                              			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                              			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'>
                              			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'">
                              			<button class="btn btn-default">Search</button>
                              		</form>
                              	</div>
                              </div>
                              
                              
                              
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-sm-12 col-md-5">
                                <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 10 entries</div>
                                </div>
                                <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                
                                <ul class="pagination">
                                <c:if test="${pageMaker.prev }">
                                	<li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                	<a href="${pageMaker.startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                </li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                                	<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
                                	<a href="${num }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${num }</a>
                                </li>
                                </c:forEach>
                               
                                <c:if test="${pageMaker.next }">
                                <li class="paginate_button page-item next disabled" id="dataTable_next">
                                	<a href="${pageMaker.endPage+1 }" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">Next</a>
                                </li>
                                </c:if>
                                
                                </ul>
                                
                                <form id="actionForm" action="/board/list" method="get">
                                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                                	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                                	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                                	<input type="hidden" name="ketword" value="${pageMaker.cri.keyword }">
                                </form>
                                
                                </div>
                                </div>
                                </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
           	<%@include file="../includes/footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    

   

</body>

</html>