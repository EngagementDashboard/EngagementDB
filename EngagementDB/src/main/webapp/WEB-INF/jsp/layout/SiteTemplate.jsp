<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Engagement Dashboard</title>
	<!--[if IE]>
	<link rel="stylesheet" href="resources/css/ie.css" type="text/css" media="screen, projection">
	<![endif]-->
<style>
html {
    position: relative;
    min-height: 100%;
}
body {
    margin: 0 0 100px; /* bottom = footer height */
}
div.container {
    width: 100%;
    border: 1px solid gray;
    
}

header {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}

footer {
    position: absolute;
    left: 0;
    bottom: 0;
    height: 25px;
    width: 100%;
}
 /* footer {
 
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
     float: bottom;
    } */
nav {
    float: left;
    max-width: 200px;
    margin: 0;
    padding: 1em;
     height: 100%;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
   /*  margin-left: 170px; */
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
   height:825px
    /* margin: 0 0 400px;  */
}

</style>
</head>
<body>
	<div class="container" >
		<!-- Header -->
		<tiles:insertAttribute name="header" />
		<nav>
  <tiles:insertAttribute name="menu" />
</nav>
<article>
<tiles:insertAttribute name="body"  />
</article>
		<footer>
		<!-- Footer Page -->
		<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html> --%>
<!DOCTYPE html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    
  </style>
</head>
<body>
	<div>
		<tiles:insertAttribute name="header"  />
	</div>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<tiles:insertAttribute name="menu" />
			</div>

			<div class="col-sm-9">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>

<!-- 	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer> -->

</body>
</html>
