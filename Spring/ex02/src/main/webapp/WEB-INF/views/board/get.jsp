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

</head>
<body>
<script>
	$(document).ready(function(){
		var operForm = $("#openForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list");
			operForm.submit();
			
		});
		
	});
</script>



<div id="wrapper">
 	<%@include file="../includes/navibar.jsp" %>
 	
 	
 	<div id="content-wrapper" class="d-flex flex-column">
	
	<%@include file="../includes/header.jsp" %>
            <!-- Main Content -->
            <div class="row">
 		<div class=col-lg-12>
 			<h1 class="page-header">Board Register</h1>
 		</div>
 	</div>

                <!-- Topbar -->
                
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            <div class="container-fluid">
             	<div class="row">
 		<div class="col-lg-12">
 			<div class="panel panel-default">
 				<div class="panel-heading">Board Register</div>
 				<div class="panel-body">
 						<div class="form-group">
 							<label>Bno</label>
 							<input class="form-control" id="bno" name="bno" value='<c:out value="${board.bno}"/>' readonly>
 						</div>
 						
 				
 						<div class="form-group">
 							<label>Title</label>
 							<input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly>
 						</div>
 						<div class="form-group">
 							<label>Text area</label>
 							<textarea rows="3" name="content" class="form-control" readonly><c:out value="${board.content }"/></textarea>
 						</div>
 						<div class="form-group">
 							<label>Writer</label>
 							<input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly>
 						</div>
 						
 						<div class="form-group">
 							<label>RegDate</label>
 							<input class="form-control" name="regDate" value='<c:out value="${board.regDate }"/>' readonly>
 						</div>
 						
 						<div class="form-group">
 							<label>UpdateDate</label>
 							<input class="form-control" name="updateDate]" value='<c:out value="${board.updateDate }"/>' readonly>
 						</div>
 						
 						
 						<button  data-oper="modify" class="btn btn-default">Modify</button>
 						<button  data-oper="list" class="btn btn-info">List</button>	
 				
 					<form action="/board/modify" method="get" id="openForm">
 						<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
 						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
 						<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
 						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
 						<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
 					</form>
 				</div>
 			</div>
 		</div>
 	
 	</div>
		

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
           	<%@include file="../includes/footer.jsp" %>
            <!-- End of Footer -->

        </div>
 	
 	</div>



  	
 	
 	
 
 
 <%@include file="../includes/footer.jsp" %>
 
 </body>
 </html>
 


