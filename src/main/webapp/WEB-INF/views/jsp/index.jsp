<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sahaja Yoga</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Sahaja Yoga</a>
		</div>
	</div>
</nav>

<div class="jumbotron">
	<div class="container">
		<h1>Sahaja Yoga</h1>
		<p>
			<c:if test="${not empty msg}">
				Hello ${msg}
			</c:if>

			<c:if test="${empty msg}">
				Most Welocme
			</c:if>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
		</p>
	</div>
</div>

<div class="container">

	<div class="row">
		<div class="col-md-8"> 
			<h2>Sahaja Yoga Mediataion Most Welcom </h2>
			<h3>Self Realisation And Kundalini Awakening, Experience Now</h3>
			<h4>https://www.sahajayoga.org.in/</h4>
		</div>	
	</div>


	<hr>
	<footer>
		<p>&copy;@sahajayog/</p>
	</footer>
</div>

<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>
