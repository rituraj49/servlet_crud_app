<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<%
Object li = session.getAttribute("list");
if(li == null) {
	response.sendRedirect("home.jsp");
}
%><%-- 
<p><%= li %></p> --%>

	<div class="d-flex flex-column justify-center align-items-center"
		style="">
		<div
			class="d-flex flex-column align-items-center justify-content-between bg-light w-100 pb-3">
			<h4 class="p-4 text-danger text-uppercase">List of Employees</h4>
			<div class="d-flex flex-row justify-content-between w-100">
				<form onsubmit="return false">
					<div class="d-flex align-items-center ms-4">
						<input type="text" id="search" class="mx-2" />
						<button onclick="handleSearch()" class="btn btn-outline-primary">Search</button>
					</div>
				</form>
				<div class="btn-group me-4">
					<!-- <button type="button" class="btn btn-danger dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">Action</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Separated link</a></li>
					</ul> -->
					<select class="btn btn-danger dropdown-toggle" id="select">
						<option class="" selected>--select--</option>
						<option value="name" id="name" onclick="sortTable(1)">Name</option>
						<option value="designation" id="designation" onclick="sortTable(2)" >Designation</option>
						<option value="designation" id="department" onclick="sortTable(3)" >Department</option>
					</select>
					<a href="register.jsp" class="btn btn-info ms-4 ">Register</a>
				</div>
			</div>
		</div>
		<div class="">
			<table class="table table-primary table-hover " id="table">
			<thead>
				<tr>
					<th onclick="sortTable(0)" style="cursor: pointer">ID</th>
					<th onclick="sortTable(1)" style="cursor: pointer">Name</th>
					<th onclick="sortTable(2)" style="cursor: pointer">Designation</th>
					<th onclick="sortTable(3)" style="cursor: pointer">Department</th>
					<th onclick="sortTable(4)" style="cursor: pointer">Date Of birth</th>
					<th onclick="sortTable(5)" style="cursor: pointer">Date Of joining</th>
					<th onclick="sortTable(6)" style="cursor: pointer">Address</th>
					<th onclick="sortTable(7)" style="cursor: pointer">Contact</th>
					<th onclick="sortTable(8)" style="cursor: pointer">Email</th>
					<th>Actions</th>
				</tr>
					<tbody>
				<c:forEach items="${list}" var="l">
					<tr>
						<td><c:out value="${l.getEmployeeID()}" /></td>
						<td><c:out value="${l.getEmployeeName()}" /></td>
						<td><c:out value="${l.getDesignation()}" /></td>
						<td><c:out value="${l.getDepartment()}" /></td>
						<td><c:out value="${l.getDateOfBirth()}" /></td>
						<td><c:out value="${l.getDateOfJoining()}" /></td>
						<td><c:out value="${l.getAddress()}" /></td>
						<td><c:out value="${l.getContact()}" /></td>
						<td><c:out value="${l.getEmail()}" /></td>
						<td>
							<div class="d-flex flex-row">
								<form action="view" >
									<input type="hidden" name="identity" value="${l.getEmployeeID()}" />								
									<button type="submit" class="btn btn-success me-2">update</button>
								</form>
								<form action="delete" method="POST">
									<input type="hidden" name="employeeId" value="${l.getEmployeeID()}" />
									<button class="btn btn-danger" type="submit">delete</button>
								</form>
							</div>
						</td>
					</tr>
				</c:forEach>
					</tbody>
			</table>
		</div>
	</div>

	<script>
		
			const table = document.getElementById('table');
			const searchField = document.getElementById('search');
			const filter = searchField.value.toUpperCase();
			const rows = table.getElementsByTagName('tr');
			let toggle = false;
		
		  function sortTable(index){
			//console.log(typeof(index)," index no");
			//ascending = !ascending;
			//asc = asc ? false : true;
			toggle = !toggle;
			//let array = [];
			const rowsArray = Array.from(rows).slice(1);

			for (let i = 0; i < rowsArray.length; i++) {
				const cells = rows[i].getElementsByTagName('td');
					 if(index < cells.length){
						const cell = cells[index];
						//console.log(cell.textContent)
						//array.push(cell.textContent)
						
						rowsArray.sort((a,b)=>{
							const cellA = a.cells[index].textContent.trim().toLowerCase();
							const cellB = b.cells[index].textContent.trim().toLowerCase();
							if(toggle){	
								//console.log("toggle true")
								return cellA.toString().localeCompare(cellB)  
							} else {								
								//console.log("toggle false")
								return cellB.toString().localeCompare(cellA)
							}
						});
					 }
					 //console.log(tab)
					//if(x.innerHTML.toLowerCase() )
					 var tab = table.tBodies[0].appendChild(rowsArray[i]);
					 //acs = !asc;
				}	
		} 
		
		/* document.querySelectorAll('th').forEach( th => th.addEventListener('click', (()=>{
				const table = th.closest('table');
				Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
				.sort((a,b)=>)
			}))
		)
		function sortTable(index){
			Array.from(rows).slice(1).
		} */
		
		
		function handleSearch() {
			const tableSearch = document.getElementById('table');
		const inputField = document.getElementById('search');
		const searchFilter = inputField.value.toUpperCase();
		const rowSearch = tableSearch.getElementsByTagName('tr');
		
		for (let i = 1; i < rowSearch.length; i++) {
			const cells = rowSearch[i].getElementsByTagName('td');
			let found = false;

			for (let j = 0; j < cells.length; j++) {
				const cell = cells[j];
				const text = cell.textContent || cell.innerText;
				if (text.toUpperCase().indexOf(searchFilter) > -1) {
					found = true;
					break;
				}
			}
			if (found){
				console.log("found")
				rowSearch[i].style.display = "";
			} else {					
				console.log("not found")
				rowSearch[i].style.display = "none";
			}
		}
	}
	</script>
<script src="/Task3EmployeeCrud/src/main/webapp/js/bootstrap.min.js" ></script>
</body>
</html>