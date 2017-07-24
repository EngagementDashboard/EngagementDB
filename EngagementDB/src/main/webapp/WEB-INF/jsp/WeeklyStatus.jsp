<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"	src="<c:url value="/script/jquery-1.9.1.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="css/weekly.css">
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">


<style>
.tableheader{
	position:static;
	text-align:center;
	border-radius: 5px;
    border: 0px solid #73AD21;
    padding: 7px;background-color:Gainsboro;
    width:33%;

}
</style>


<script>
	$(function() {
		$(".datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
		$(".txtStartDate").datepicker({ dateFormat: 'dd-mm-yy' });
		$(".txtEndDate").datepicker({ dateFormat: 'dd-mm-yy' });

		false;
	});
	
</script>

<script >
/* 

function checkdate()
{
$(document).ready(function() {
	var startDate = new Date($(".txtStartDate").val()).getTime();
	var endDate = new Date($(".txtEndDate").val()).getTime();
	if (startDate < endDate){
	alert('asdf');
	return true;
	}
	else
		{
		alert('asdasfdasff');}
		return false;
    /* $.validator.addMethod("endDate", function(value, element) {
        var startDate = $('.startDate').val();
        return Date.parse(startDate) <= Date.parse(value) || value == "";
    }, "* End date must be after start date");
    /* $('#formId').validate(); */
/* });
} */ 
</script>
</script>
<script>
	function getResoursebyProjectID()
	{
		//alert("this is n=inside function1");
		$('#content').load('addResourceTaskandVacation.htm',  {	PROID : $("#programId").val()});
			
	
	}
</script>



<script>
 function wsrFormIntoSession()
{
	 
alert("saving");
//$.post('saveWeeklyStatus.htm', $('#wsrDetails').serialize()) 
//var value = $("#wsrDetails").serialize();
$.ajax({
  type: "post",
  url: "saveWeeklyStatus.htm",
  data:  $('#wsrDetails').serialize(),
/*   success: function(data) {
	  
	  alert("Proceed to Resource task");
	  return true;
  }  */
				
});
 }
</script>
<script>
function getWSRbyProjectName() {
	
	$('#wsrcontent').load('getWsrRecords.htm', {programNames : $("#projectName").val()}	);
}
</script>
<style>
.textbox
{
box-shadow:1px 1px 45px #333;
transition: 200ms all ease;
border:none;
padding: 0px 0px;

}
.textbox
{
/* margin:-5px 0 0 10px; */
height:29px;
width:250px;
}
.textbox
{

box-shadow:1px 1px 45px #333;
transition: 200ms all ease;
border:none;
padding: 5px 5px;

}
</style>
<title>Weekly Status Report</title>
</head>
<body>
	<c:if test="${code == 'success'}">
		<c:set var="code" value="emPty">
		</c:set>
		<script>
			alert("Record Added  Successfully.");
		</script>

	</c:if>
	<c:if test="${code == 'failure'}">
	
		
		<script>
			alert("Record Added Unsuccessfully.... Please Try again !!!");
		</script>
	</c:if>
	<c:if test="${setTab == 'resourceTab'}"> 
		<script>
			openTab(event, 'resourceTab'); 
		</script>
	</c:if>
 
		<form:form method="POST"  action="addResourceTaskandVacation.htm" id="wsrDetails" modelAttribute="wsrDetails">
	
 				<tr class="break">	<td colspan="2"></td></tr>
				<tr class="break"> 	<td colspan="2"></td>
				</tr><tr class="break">	<td colspan="2"></td>
				</tr>
			
				<table id="table" align="center">


					<tr class="break">
						<td colspan="2"></td>
					</tr>
					
					<tr>
					<td><b> Project Name</b></td>
					<td>
					<select  id = "programId" name="applicationName" class="textbox" required onchange="getResoursebyProjectID()" >
											<option >Select Project Name</option>
											<c:forEach items="${ProjectNames}" var="ProjectNames">
											<option value= "${ProjectNames.id}" >${ProjectNames.projectName}</option>
											</c:forEach>
        							</select>
        							
					</td>			
			 
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td><b>Release in Progress:</b></td>
						<td><input type="text" class="textbox" id="releaseName"
							name="releaseName" required></td>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td><b>Release go Live:</b></td>
						<td><input type="text" name="releaseDate" class="datepicker" required ></td>
					</tr>
					<tr class="break"><td colspan="2"></td>
				
					</tr>
					<tr>
						<td><b>Week Start:</b></td>
						<td><input type="text" name="weekStart" class="txtStartDate" required></td>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td><b>Week End:</b></td>
						<td><input type="text" name="weekend" class="txtEndDate" required></td>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td><b>Project Accomplishments:</b></td>
						<td><textarea rows="3" cols="40" name="projectAccomplishment"
								id="projectDescription" class="tb" required></textarea></td>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td><b>Next week Plan:</b></td>
						<td><textarea rows="3" cols="80" name="nextWeekPlan"
								id="projectDescription" class="tb" required></textarea></td>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td><b>Risk/Impediments:</b></td>
						<td><textarea rows="3" cols="80" name="risk" id="impediments"
								class="tb" required></textarea></td>
					</tr>
					
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
					<td colspan="2" align="center" ><input type="submit" value="Proceed" title="Click to save data and proceed to resource task form." class="btn btn-info dropdown-toggle"    onclick=" return wsrFormIntoSession()" ></td>
				</tr>
			<tr class="break">
						<td colspan="2"></td>
				</table>
				</form:form>
			
				<br>
				<br>
			 
			
				<br>
				<div id="content"> </div>
				
				<br>
				
				</div>
				
		
</body>
</html>