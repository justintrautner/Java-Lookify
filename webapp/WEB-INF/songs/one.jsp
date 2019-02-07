<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title><c:out value="${song.title}"/></title>
</head>
<body class="pl-2 pr-2">

	<table class="table">
	    <thead>
	        <tr>
	            <th>Title</th>
	            <th>Artist</th>
	            <th>Rating</th>
	            <th>Action</th>
	        </tr>
		</thead>
		<tbody>
			<tr>
				<td><c:out value="${song.title}"/></td>
				<td><c:out value="${song.artist}"/></td>
				<td><c:out value="${song.rating}"/></td>
				 <td>
	           		<form action="/songs/${song.id}" method="post">
	   					<input type="hidden" name="_method" value="delete">
	   					<input type="submit" value="Delete">
					</form>
            	</td>
			</tr>
		</tbody>
	</table>
	<a href="/dashboard">Dashboard</a>

</body>
</html>