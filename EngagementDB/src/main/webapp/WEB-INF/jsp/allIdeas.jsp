<%-- <%@include file = "adminTabs.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Idea Details</title>
<%-- <script type="text/javascript" src="<c:url value="/script/jquery-1.9.1.min.js"/>"></script> --%>
<script type="text/javascript"
	src="<c:url value="/script/jquery.validate.min.js"/>"></script>
 <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css"/>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="css/allPage.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
	<style>
            #popup{
                display: none;
                border: 1px solid black;
            }

            .cell-which-triggers-popup{
                cursor: pointer;    
            }

            .cell-which-triggers-popup:hover{
                background-color: #8CE3F7;    
            }
             #developePopUp{
                display: none;
                border: 1px solid black;
            }

            .addDeveloperPopUp{
                cursor: pointer;    
            }

            .addDeveloperPopUp:hover{
                background-color: #8CE3F7;    
            }
        </style>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<c:if test="${reviewCode == 'success'}">
<script>
  alert("Review Added Successfully");
  document.getElementById('popup').close();
</script>
</c:if>
<c:if test="${reviewCode == 'failure'}">
<script>
  alert("Error Adding Review");
  document.getElementById('popup').close();
  
</script>
</c:if>
<script>
	$(document).ready(function() {
		$('#ideaTable').DataTable();
	});
</script>

<script type="text/javascript">
	function confirm_alert(node) {
		return confirm("Please click on OK to continue.");
	}
</script>
</head>

<body>
<script>
$( document ).ready(function() {
    $(document).on("click", ".cell-which-triggers-popup", function(event){
    	var ideaID = $(event.target).parent().children('.ideaId').text();
    	var description = $(event.target).parent().children('.ideaDescription').text();
    	var owner = $(event.target).parent().children('.owner').text();
    	var team = $(event.target).parent().children('.team').text();
       	
        showPopup(ideaID,description,owner,team)    
    });

    function showPopup(ideaID,description,owner,team){
        $("#popup").dialog({
            width: 800,
            height: 800,
            open: function(){
                $(this).find("#ideaId").val(ideaID) 
                $(this).find("#description").val(description) 
                $(this).find("#owner").val(owner) 
               
            }
        });
    }
});
</script>
<script>
$( document ).ready(function() {
    $(document).on("click", ".addDeveloperPopUp", function(event){
    	var ideaID = $(event.target).parent().children('.ideaId').text();
    	var description = $(event.target).parent().children('.ideaDescription').text();     	
        showDeveloperPopup(ideaID,description)    
    });

    function showDeveloperPopup(ideaID,description){
        $("#developePopUp").dialog({
            width: 800,
            height: 800,
            open: function(){
                $(this).find("#ideaId").val(ideaID) 
                $(this).find("#description").val(description) 
                
               
            }
        });
    }
});
</script>
<!-- <script>
jQuery(function(){
    var counter = 1;
    
    jQuery('addMore').click(function(event){
    	alert("adddev")
        event.preventDefault();

        var newRow = jQuery('<tr><td><input type="text" name="developer' +
            counter + '"/></td></tr>');
            counter++;
        jQuery('.developerList').append(newRow);

    });
});
</script> -->
<script>
		
			function populateSuperVisor() {

			$("#developer").autocomplete({
				// appendTo: "#newSupervisor", 	
		
				source : function(request, response) {
				
					$.ajax({
						type : "POST",
						minLength : 1,
						url : "SeachSupervisor.htm",
						data : {
							SUPID : $("#developer").val()
							},
						success : function(data) {
							response(data);

						}

					});
				}
			});

		}
	
	</script>
	<div class="container" id="main">
		<center>
			<h1>
				<b>IDEA DETAILS</b>
			</h1>
		</center>
		<br> <br>
		 <div id="popup" class="dialog">
            <a href="#close"><img src="http://bit.ly/1qAuZh3" alt="..." width="166" height="104" align="left"/></a>
            <form id="review" action="reviewIdea.htm" method="post">
	            <table align="center">
	            <h1><label for="Idea Details">Idea Details</h1>
	            	<tr><td><label for="Idea Id">Idea Id</td><td><input type="text" id="ideaId" name="ideaId" class = "textBox"></td></tr>
	            	<tr class="break"><td colspan="2"></td></tr>
	            	<tr><td><label for="Idea Description">Idea Description</td><td><input type="text" id="description" class = "textBox"></td></tr>
	            	<tr class="break"><td colspan="2"></td></tr>
	            	<tr><td><label for="Idea Owner">Idea Owner</td><td><input type="text" id="owner" class = "textBox"></td></tr>
	            	<tr class="break"><td colspan="2"></td></tr>
	            	<tr><td><label for="Comments">Comments</td><td><textarea rows="4" cols="50" name="comments" id="comments" class = "textBox"></textarea></td></tr>
	            	<tr class="break"><td colspan="2"></td></tr>
	            	<tr class="break"><td colspan="2"></td></tr>
	            	<tr align="center"><td><input type="submit" class="btn btn-info dropdown-toggle" value="Approve" name="approveOrReject">&nbsp;&nbsp;<input type="submit" class="btn btn-info dropdown-toggle" value="Reject" name="approveOrReject">&nbsp;&nbsp;<input type="submit" class="btn btn-info dropdown-toggle" value="Hold" name="approveOrReject"></td></tr>
	            </table>
            </form>         
        </div>
      
		<div class="row" align="center">
			<div class="col-md-12">
				<div id="proData" align="center">
					<table class="display jqueryDataTable" id="ideaTable">
						<thead>
							<tr>
								<th>Idea Id</th>
								<th>Idea Description</th>
								<th>Idea Owner</th>
								<th>Team</th>
								<th>Status</th>
								<c:if test="${page == 'myidea' }">
									<th>Add Developers</th>
								</c:if>
								<c:if test="${page != 'myidea' and isReviewer == true }">
								<th>Approve/Reject</th>
								</c:if>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${ideas}" var="ideas" varStatus="loop">
							
								<tr>
									<th class="ideaId"><c:out value="${ideas.ideaId}"></c:out></th>
									
									<td class="ideaDescription" ><c:out value="${ideas.ideaDescription}" /></td>
									
									<td class="owner"><c:out value="${ideas.enterpriseId}" /></td>
									<td class="team"><c:out value="${ideaAndTeam[ideas.ideaId]}" /></td>
									<td><c:out value="${ideaAndStatus[ideas.ideaId].status}" /></td>
									<c:if test="${page == 'myidea' and ideaAndStatus[ideas.ideaId].status == 'Approved' }">
										<td align="center" class="addDeveloperPopUp">
									<a href="redirect.htm?pageName=addDevelopers&ideaId=${ideas.ideaId}&ideaDescription=${ideas.ideaDescription}">
  									<img src="css/images/add.jpg" alt="Add Developers" style="width:30px;height:28px;border:0;">
									</a>
							</td> 
									</c:if>
									<c:if test="${page != 'myidea' and isReviewer == true }">
									<td class="cell-which-triggers-popup">Review</td>
									</c:if>
									
								</tr>
							</c:forEach>

						</tbody>
					</table>


				</div>
			</div>
		</div>
	</div>




</body>
</html>