<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Song by Artist</title>
</head>
<body class="pl-2 pr-2">

<h2 class="text-center">Songs by <c:out value="${songs[0].artist}"/></h2>

	<div class="row">
		<div class="col-md-8">
		<p><a href="/dashboard">Dashboard</a></p></div>
		<div class="col-md-4">
			<form method="post" action="/search">
				<input type="text" name="name">
				<input type="submit" value="Search Artists">
			</form>
		</div>
	</div>
	
	<table class="table table-hover">
    <thead>
        <tr>
            <th>Title</th>
            <th>Rating</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${songs}" var="song">
        <tr>
            <td>
            	<a href="/songs/<c:out value='${song.id}'/>">
            	<c:out value="${song.title}"/>
            	</a>
            </td>
            <td><c:out value="${song.rating}"/></td>
            <td>
           		<form action="/songs/${song.id}" method="post">
   					<input type="hidden" name="_method" value="delete">
   					<input type="submit" value="Delete">
				</form>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>


</body>
</html>