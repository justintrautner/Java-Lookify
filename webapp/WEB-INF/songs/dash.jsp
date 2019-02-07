<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>DashBoard</title>
</head>
<body>

<body class="pl-2 pr-2">
	<div class="row pb-3 mt-1">
		<div class="col-md-3 pl-4">
			<a href="/songs/new">Add New</a>
		</div>
		<div class="col-md-3">
			<a href="/search/topTen">Top Songs</a>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-4">
			<form method="post" action="/search">
				<input type="text" name="name">
				<input type="submit" value="Search Artists">
			</form>
		</div>
	</div>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Title</th>
            <th>Artist</th>
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
            <td><c:out value="${song.artist}"/></td>
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