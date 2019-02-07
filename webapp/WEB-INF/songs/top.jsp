<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Top ten songs</title>
</head>
<body class="pl-2 pr-2">

<h2 class="text-center">Top 10 songs</h2>
<a href="/dashboard">Dashboard</a>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Title</th>
            <th>Artist</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${topsongs}" var="song">
        <tr>
            <td>
            	<a href="/songs/<c:out value='${song.id}'/>">
            	<c:out value="${song.title}"/>
            	</a>
            </td>
            <td><c:out value="${song.artist}"/></td>
            <td><c:out value="${song.rating}"/></td>
        </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>