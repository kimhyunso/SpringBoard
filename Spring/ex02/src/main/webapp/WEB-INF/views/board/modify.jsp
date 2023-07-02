<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<script>
	$(document).ready(function(){
		var formObj = $("form");
		$("button").on("click",function(e){
			e.perventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'remove'){
				formObj.attr("action","/board/remove");
			}else if(operation === 'list'){
				formObj.attr("action","/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone(); 
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
				return;
			}
			formObj.submit();
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
 			<h1 class="page-header">Board Modify Page</h1>
 		</div>
 	</div>
		<form action="/board/modify" method="post" role="form">
			<input type="hidden" value='<c:out value="${cri.pageNum }"/>' name="pageNum">
			<input type="hidden" value='<c:out value="${cri.amount }"/>' name="amount">
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
 			<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
		
                <!-- Topbar -->
                
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
            <div class="container-fluid">
            	<div class="row">
 					<div class="col-lg-12">
 						<div class="panel panel-default">
 							<div class="panel-heading">Board Modify Page</div>
 							<div class="panel-body">
 				
 						<div class="form-group">
 							<label>Bno</label>
 							<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
 						</div>
 					
 						<div class="form-group">
 							<label>Title</label>
 							<input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
 						</div>
 						<div class="form-group">
 							<label>Text area</label>
 							<textarea rows="3" name="content" class="form-control"><c:out value="${board.content }"/></textarea>
 						</div>
 						<div class="form-group">
 							<label>Writer</label>
 							<input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly>
 						</div>
 						
 						<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
 						<button type="submit" data-oper="list" class="btn btn-danger" data-oper="remove">Remove</button>
 						<button type="submit" class="btn btn-info" data-oper="list">List</button>
 					</div>
 					</div>
 					</div>
 					</div>
 					</div>
 					
 					</form>
 				</div>
 			</div>
<%@include file="../includes/footer.jsp" %>
</body>
</html>