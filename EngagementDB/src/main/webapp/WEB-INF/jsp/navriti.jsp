<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- <link rel="stylesheet" href="css/style.css"> -->
<link rel="stylesheet" href="css/validationmsg.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
 <script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/allPage.css">
<link rel="stylesheet" href="css/error.css">
<link href="css/jquery.filer.css" rel="stylesheet">
<link href="css/jquery.filer-dragdropbox-theme.css"
	rel="stylesheet">
<title>Ideas</title>
    <!--  Jquery Validation-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="<c:url value="/script/jquery-1.9.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/script/jquery.validate.min.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.js"></script>
<link rel="stylesheet" href="css/validationmsg.css">
<link rel="stylesheet" href="css/allPage.css"/>
<script src="script/validate.js"></script>
    
    <!-- New Import -->
     <link href="http://cdn-na.infragistics.com/igniteui/2017.1/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2017.1/latest/css/structure/infragistics.css" rel="stylesheet" />

    <script src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <!--  Jquery Validation-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="<c:url value="/script/jquery-1.9.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/script/jquery.validate.min.js"/>"></script>

<link rel="stylesheet" href="css/validationmsg.css">
<link rel="stylesheet" href="css/allPage.css"/>
<script src="script/validate.js"></script>
    

 <!--    Ignite UI Required Combined JavaScript Files -->
    <script src="http://cdn-na.infragistics.com/igniteui/2017.1/latest/js/infragistics.core.js"></script>
    <script src="http://cdn-na.infragistics.com/igniteui/2017.1/latest/js/infragistics.lob.js"></script>

	    <!-- New Import -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="script/custom.js" type="text/javascript"></script>
<script src="script/jquery.filer.min.js" type="text/javascript"></script>
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" /> -->
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script> -->




<style>
table {
  border-collapse: separate;
 
  border-spacing: 30px 0;
}
td{
   padding: 5px 0;
}
#content {
  border : 1px solid #000;
  padding : 5px;
}

</style>
<script>
$(document).ready(function() {
	
	$.validator.addMethod("pattern", function(value, element, regexpr) {  
		
	     return this.optional( element ) || regexpr.test(value);
	   }, "Please enter a valid value."); 

	
	
	$("#ideaForm").validate({
	
		 rules: {
			 "category" : {
					 required:true
					 },
					 
				"subCategory": {
						 required:true
						 },
				 "ideaDescription":{
		            	required:true,
		            	pattern: /^[a-z A-Z]+$/,
		            	maxlength:50
		            },
		           
		          
				
		   		},
			messages:{
				
				"category": {
					required: 'Please choose a Category .'
					
				},
				
				"subCategory" : {
					required: 'Please choose a Sub-Category .'
					
				},
				
				"ideaDescription": {
						required: 'Idea Description is required.',
						maxlength: 'Idea Description should be maximum  50 characters.'
				}
							
				
			},
		 errorContainer: $('#errorContainer'),
	     errorLabelContainer: $('#errorContainer ul'),
	     wrapper: 'li'
});

});
</script>
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
</head>
<body>


	<div class="container" id="main">
		<center><h2><b> New Idea </b></h2></center>
		<div class="row">
			<div class="col-md-12">
				<br>
				<br>
				
				<div id="errorContainer">
    <p>Please correct the following errors and try again:</p>
    <ul/>
	</div>		
				<div id="content">
				<br>
					<form name="ideaForm" action="addIdea.htm" method="post" id="ideaForm">
					<input type="hidden" name="enterpriseId" value="${resource.enterpriseId}"/>
						<table>
								<tr class="break"><td colspan="2"></td></tr>
		<tr><td><label for="enterprise_id">Enterprise Id<span style="color:red;">*</span></label></td>
		<td><input class = "textBox" type="text" value="${resource.enterpriseId }" disabled></td>
								
			</tr>	
				
				<tr class="break"><td colspan="2"></td></tr>
					<tr><td><label for="Idea Description">Idea Description<span style="color:red;" >*</span></label></td>
					<td>
					<textarea rows="4" cols="50" name="ideaDescription"></textarea>
					
					
					</td><td>&nbsp;</td>
						
						</tr>
						<tr class="break"><td colspan="2"></td></tr>
							
									<tr class="break"><td colspan="2"></td></tr>
								<tr><td><label for="Category">Category<span style="color:red;">*</span></td>
						          <td>							
									<select name="category">
										<option value="">--Select a Category</option>
										<option value="Accenture Internal">Accenture Internal</option>
										<option value="Client Centric">Client Centric</option>
									</select>
							      </td>
							
												
								</tr>
								<tr><td><label for="subCategory">Sub Category<span style="color:red;">*</span></td>
						          <td>							
									<select name="subCategory">
										<option value="">--Select a Sub Category</option>
										<option value="Automation">Automation</option>
										<option value="Pain Point">Pain Point</option>
										<option value="Process Improvement">Process Improvement</option>
									</select>
							      </td>
							
												
								</tr>
							
					
										
					<tr class="break"><td colspan="2"></td></tr>	
				<tr align="center"><td colspan="2"><input class="btn btn-info dropdown-toggle" name="submit" type="submit" value="Submit" >&nbsp;&nbsp;
				<input type="button" class="btn btn-info dropdown-toggle" value="Cancel" onClick="javascript:goBack(); "/>
				<!-- <a href="javascript:goBack(); " class="btn btn-info dropdown-toggle" >Cancel</a></td> -->
				</tr>				
					
					</table>					
					</form>
					

				</div>
				<br>
				<br> 
			</div>
		</div>
	</div>
	
	
</body>
</html>