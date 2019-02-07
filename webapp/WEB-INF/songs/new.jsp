<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Add song</title>
</head>
<body>

<p><a href="/dashboard">Dashboard</a></p>


<form:form action="/songs" method="post" modelAttribute="newsong">
    <p>
        <form:label path="title">Title: </form:label>
        <form:input path="title"/>
    </p>
    <p><form:errors class="text-danger" path="title"/></p>
    <p>
        <form:label path="artist">Artist: </form:label>
        <form:input path="artist"/>
    </p>
    <p><form:errors class="text-danger" path="artist"/></p>
    <p>
        <form:label path="rating">Rating: </form:label>
        <form:input type="number" path="rating"/>
    </p>
    <p><form:errors class="text-danger" path="rating"/></p>
    <input type="submit" value="Submit"/>
</form:form> 


</body>
</html>