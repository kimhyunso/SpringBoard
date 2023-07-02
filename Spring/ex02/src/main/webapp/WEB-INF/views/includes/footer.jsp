<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
	$(document).ready(function(){
		$('#dataTables-example').DataTable({
			responsive:true
		});
		$(".sidebar-nav")
		.attr("class","sidebar-nav navbar-collapse collapse")
		.attr("aria-expanded",'false')
		.attr("style","height:1px");
	});
</script>

 <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
 </footer>