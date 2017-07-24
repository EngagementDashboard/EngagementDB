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
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/south-street/jquery-ui.css"> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript"
	src="<c:url value="/script/jquery-1.9.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/script/jquery.validate.min.js"/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/weekly.css">

<link rel="stylesheet" type="text/css" href="css/dataTables.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="myscripts.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
	<link rel="stylesheet" type="text/css"	href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

	


<script>
	$(function() {
		$(".txtStartDate").datepicker({dateFormat: 'dd-mm-yy'});
		$(".txtEndDate").datepicker({dateFormat: 'dd-mm-yy'});
		
		$(".txtStartDate").change(function() {
	        test = $(this).datepicker('getDate');
	        testm = new Date(test.getTime());
	        testm.setDate(testm.getDate() + 1);
	        $(".txtEndDate").datepicker({dateFormat: 'dd-mm-yy',  minDate: testm});
	    });

		
		
		
		false;
	});
</script>
<style>

 input[type='text'], input[type='password']
{

transition: 200ms all ease;
width: 249px;
height: 32px;
border-radius: 4px;
border: 0.8px solid #CCC;
padding: 12px;
font-weight: 200;
font-size: 14px;
font-family: Verdana;
box-shadow: 1px 1px 25px #333;
}

input[type='text']:hover, input[type='password']:hover
{
width: 250px;
height: 33px;
border-radius: 4px;
border: 0.9px solid #aaa;
padding: 12px; 
 border-color: #00BFFF #00BFFF #00BFFF #00BFFF;
transition: 200ms all ease;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
box-shadow: 1px 1px 18px #CCC;
} 
textarea
{
width: 380px;
resize:vertical;
height: 69px;
border-radius: 3px;
border: 1px solid #CCC;
padding: 8px;
font-weight: 200;
font-size: 15px;
 font-family:  sans-serif;
box-shadow: 1px 1px 10px #333;

}
textarea:hover
{
width: 381px;
 resize:vertical;
height: 69px;
border-radius: 3px;
border: 1px solid #aaa;
border-color: #00BFFF #00BFFF #00BFFF #00BFFF;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
box-shadow: 1px 1px 5px #CCC;
}
table.resTable {
  border-collapse: separate;
  border: 2px solid black;
  border-spacing: 20px 0px;
    width: 65%;
    align:center;
    border-spacing: 12px  5px;
     table-layout: auto;
    	
}
td.resTable {
    width: 1px;
    white-space: nowrap;
    position: inherit;
}

/* /* table {
border-collapse: inherit;
  border: 00px solid black;
  border-spacing: 00px 0px;
    width: 65%;
    align:center;
    border-spacing: 00px;
     table-layout: auto;
    position: inherit;
} 

td {
    border: 1px solid black;
        position: inherit;
}  */

 
</style> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<div id="form" align="center">
<form:form method="POST" action="addResourceTask.htm"  id="addResource">
<table class="resTable">
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<tr>
						<th rowspan="2">Resource Name</th>
						<th rowspan="2" style="text-align: center; ">Task Updates</th>
						<th colspan="2" style="text-align: center; ">Vacation
							Dates</th>
					</tr>
					<tr>
						<th>From</th>
						<th>To</th>
					</tr>
					<tr class="break">
						<td colspan="2"></td>
					</tr>
					<c:forEach items="${resourcesInProject}" var="resource" varStatus="status">

						<tr>

							<td><label
								for="resourceTaskList[${status.index}].resourceName">${resource.employeeName}</label><input
								type="hidden"
								name="resourceTaskList[${status.index}].resourceName"
								value="${resource.employeeName}"></td>
							

					<td><textarea rows="10" cols="80"
									name="resourceTaskList[${status.index}].taskUpdate"></textarea></td>
					<td><input type="text"
								name="resourceTaskList[${status.index}].vocationDateTo"
								class="txtStartDate" /></td>
						<td><input type="text"
								name="resourceTaskList[${status.index}].vocationDateFrom"
								class="txtEndDate" /></td>
						</tr>
						<tr class="break">
							<td colspan="2"></td>
						</tr>
						<tr class="break">
							<td colspan="2"></td>
						</tr>
					</c:forEach>
					
				</table>
				<br>
				<br>
				<br>
<input type="submit" value="submit"  value="Proceed" title="submits  the release details and resource vacation date to the database" class="btn btn-info dropdown-toggle">

</form:form>

</div>
</body>
</html>