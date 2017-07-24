<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistics</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/statistics.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
	  function drawChart() {
    	  var jsonData = $.ajax({
              url: "shiftsdata.htm",
              dataType: "json",
              async: false
              }).responseText;
          var data = new google.visualization.DataTable(jsonData);
          var options = {
          title: 'HCSC Shift Details for the Current Month'
         };
		var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		chart.draw(data, options);
      }
</script>
    <!--  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);

      function drawChart1() {
    
        var data = google.visualization.arrayToDataTable([
          ['Total Entries', 'HCSC'],
          ['Submitted',     40],
          ['Not Submitted',      60],
          
        
      
        ]);

        var options = {
          title: 'Total Number of Entries for the Current Month',
          pieHole: 0.4,
         
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d1'));

        chart.draw(data, options);
      }
    </script>
     -->
  </head>
  <body>
  	<div class="container" id="main">
		<div class="row">
			<div class="col-md-12">
  	
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    <!-- <div id="piechart_3d1" style="width: 900px; height: 500px;"></div> -->
    <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	</div></div></div>	
  </body>
</html>