<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="js/bootstrap.min.js" rel="stylesheet"> -->
<style>
.outer {
	display: flex;
	/* background-color: rebeccapurple; */
}

.inner {
	/* background-color: red; */
	/* height: 100px; */
	flex-direction: row;
	justify-content: space-between;
	width: 100%;
}

.inner2 {
	flex-direction: row;
	justify-content: space-between;
	align-items: end;
}

.invalid {
	border: 3px solid red;
}

.custom-border-bottom {
	border: 0;
	border-bottom: 1px solid #000;
	border-radius: 0;
}

.vis {
	visibility: hidden;
	/* display: none; */
	color: red;
	height: 10px;
}

.background {
	height: 100%;
	/* background-image: linear-gradient(to bottom right, rgb(43, 175, 146),
		rgb(7, 19, 15) 75%); */
		background-color=green;
}

.link {
	height:
}

/* .formClass{
    background-color: red;
} */
</style>
</head>
<body>

	<!-- <div class="mt-0 h-5 bg-dark text-light navbar">
	<div>Logo</div>
	<div class="nav-item">
		<a class="nav-link" href="login.jsp">Home</a>
		<a class="nav-link" href="login.jsp">Login</a>
		<a class="nav-link" href="register.jsp">Register</a>
	</div>
</div> -->
<!-- <script>
	const updateForm = document.getElementById('updateForm');
	const inputField = updateForm.getElementsByTagName('input');
	const btn = document.getElementById('updateBtn');
	btn.addEventListener('click',()=>{
		inputField.value="";
	})
	inputField.classList.replace('text-dark', 'text-dark');
</script> -->

	<div class='row p-5 background'>
		<div class='col-md-6 col-lg-6 col-sm-6'>
					<%--  <c:forEach items="${list}" var="l">
					 	<c:out value="${l.getEmployeeName()}"></c:out>
					 	<c:out value="${l.getDesignation()}"></c:out>
					 </c:forEach> --%>
			<%-- 	<ul class="dropdown-menu" >
				<c:forEach items="${list}" var="l">
					<li><a class="dropdown-item" href="view">${l.getEmployeeID()}</a></li>
				</c:forEach>
				</ul> --%>
				<h1 class="text-uppercase">Update Employee</h1>
			<br>
				<div class="d-flex flex-row align-items-center" >
					<form action="view" method="post">
						<input type="text" name="identity"
						placeholder="Enter the ID to search"
						class="dark form-control custom-border-bottom border-success bg-transparent" />
						<button type="submit" class="btn btn-primary mt-3">Search</button>
					</form>
					
					<form action="register">
						<button type="submit" class="mt-5 btn btn-secondary">View all</button>
					</form>
				</div>
				
				<form name="form" id="myForm" action="update" method="POST">
				<table>
					<tr>
						<!-- <td><label>Employee ID</label></td> -->
						<td>
						<input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="hidden" name="identity" placeholder="Enter your Employee Id"
							id="identity" style="width: 100%;"
							value="${employee.getEmployeeID()}" 
							 /> <!-- <span id="error1" class="vis text-danger">Name should start with a block letter and only contain alphabets</span> -->
						<!-- ${employee.getEmployeeID()}-->
						</td>
					</tr>
					<tr>
						<td><label>Employee Name</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="employeeName" placeholder="Enter your name"
							id="empName" data-error="error11" style="width: 100%;"
							value="${employee.getEmployeeName()}"
							 /> <span
							id="error11" class="vis text-danger">Name should start with
								a block letter and only contain alphabets</span></td>
					</tr>
					<tr>
						<td><label>Designation</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="designation"
							placeholder="Enter the designation" id="lastName"
							data-error="error12" style="width: 100%;"
							value="${employee.getDesignation()}"							
							 /> <span id="error12"
							class="vis text-danger"
							>designation can contain letters
								and numbers</span></td>
					</tr>
					<tr>
						<td><label>Department</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="department" placeholder="Enter your department"
							id="department" data-error="error15" style="width: 100%;"
							value="${employee.getDepartment()}"
							 /> <span
							id="error15" class="vis text-danger"
							>department can only
								contain letters and numbers</span></td>
					</tr>
					<tr>
						<td><label>Date of birth</label></td>
						<td><input
						class="border-success custom-border-bottom"
						type="date" name="dob" id="dob" data-error="doj-error-u"
						value="${employee.getDateOfBirth()}"
						 />
						 <span id="doj-error-u" class="vis text-danger">
							Date can't be older than today</span>
						</td>
					</tr>
					<tr>
						<td><label>Date of joining</label></td>
						<td><input 
						class="border-success custom-border-bottom"
						type="date" name="doj" id="doj" data-error="dob-error-u"
						value="${employee.getDateOfJoining()}"
						 />
						 <span id="dob-error-u" class="vis text-danger">
							Date can't be older than today</span>
						 </td>
						 
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><textarea
								class="text-dark form-control custom-border-bottom border-success bg-transparent"
								name="address" cols="80" rows="2" id="address"
								placeholder="Enter your address"
								>${employee.getAddress()}</textarea></td>
					</tr>
					<tr>
						<td><label>Contact No</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="contact"
							placeholder="Enter your contact number" id="contact"
							style="width: 100%;" data-error="error16"
							maxlength="10"
							value="${employee.getContact()}"
							 /> <span id="error16"
							class="vis text-danger">Please enter a valid contact
								number. It can only contain 10 digits starting with digits 6 to
								9.</span></td>
					</tr>
					<tr>
						<td><label>Email</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="email" name="email" placeholder="Enter your email"
							id="email" style="width: 100%;" data-error="error17" 
							value="${employee.getEmail()}"							
							/> <span
							id="error17" class="vis text-danger"
							>Please enter a valid
								email</span></td>
					</tr>
					<tr>
						<td colspan="2"><br>
							<button class="btn btn-success" style="width: 100%" id="updateBtn"
								type="submit">Submit</button></td>
					</tr>
				</table>
			</form>
				
			
		
		</div>
		<div class='col-md-6 col-lg-6 col-sm-6'>
			<h1 class="text-uppercase">Registration Page</h1>
			<br>
			<span class="text-danger" id="existing">${exists}</span>
			<form name="form" id="regForm" action="register" method="POST" class="" style="marginTop:10px">
				<table>
					<tr>
						<td><label>Employee Name</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="employeeName" placeholder="Enter your name"
							id="empName" data-error="error1" style="width: 100%;" /> 
							<span
							id="error1" class="vis text-danger">Name should start with
								a block letter and only contain alphabets</span></td>
					</tr>
					<tr>
						<td><label>Employee ID</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="identity" placeholder="Enter your Employee Id"
							id="identity" style="width: 100%;" /> <!-- <span id="error1" class="vis text-danger">Name should start with a block letter and only contain alphabets</span> -->
						</td>
					</tr>
					<tr>
						<td><label>Designation</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="designation"
							placeholder="Enter the designation" id="lastName"
							data-error="error2" style="width: 100%;" /> 
							<span id="error2"
							class="vis text-danger">designation can contain letters
								and numbers</span></td>
					</tr>
					<tr>
						<td><label>Department</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="department" placeholder="Enter your department"
							id="department" data-error="error5" style="width: 100%;" /> <span
							id="error5" class="vis text-danger">department can only
								contain letters and numbers</span></td>
					</tr>
					<tr>
						<td><label>Date of birth</label></td>
						<td><input 
						class="border-success custom-border-bottom"
						type="date" name="dob" id="dob" data-error="dob-error" value=""/>
						<span id="dob-error" class="vis text-danger">
							Date can't be older than today</span>
						</td>
					</tr>
					<tr>
						<td><label>Date of joining</label></td>
						<td><input
						class="border-success custom-border-bottom"
						type="date" name="doj" id="doj" data-error="doj-error" value="" />
						<span
							id="doj-error" class="vis text-danger">Date can't be older than today</span>
						</td>
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><textarea
								class="text-dark form-control custom-border-bottom border-success bg-transparent"
								name="address" cols="80" rows="2" id="address"
								placeholder="Enter your address"></textarea></td>
					</tr>
					<tr>
						<td><label>Contact No</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="contact"
							placeholder="Enter your contact number" id="contact"
							maxlength="10"
							style="width: 100%;" data-error="error6" /> <span id="error6"
							class="vis text-danger">Please enter a valid contact
								number. It can only contain 10 digits starting with digits 6 to
								9.</span></td>
					</tr>
					<tr>
						<td><label>Email</label></td>
						<td><input
							class="text-dark form-control custom-border-bottom border-success bg-transparent"
							type="text" name="email" placeholder="Enter your email"
							id="email" style="width: 100%;" data-error="error7" /> <span
							id="error7" class="vis text-danger">Please enter a valid
								email</span></td>
					</tr>
					<tr>
						<td colspan="2"><br>
							<button class="btn btn-success" style="width: 100%" id="btn"
								type="submit">Submit</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
        /* function handleSubmit(e){
    	e.preventDefault();
    } */
	const existing = document.getElementById("existing");
    setTimeout(()=>{
    	
    },2000);
    
    	const dates = document.querySelectorAll('input[type="date"]');
	    /* dates.addEventListener('input', ()=>{
	    	console.log(dates.value)
	    }) */
	    dates.forEach(date => {
	    	date.addEventListener('input', ()=>{
				const inputDate = new Date(date.value);
				const currentDate = new Date();
				/* const year = currentDate.getFullYear();
				const month = String(currentDate.getMonth()+1).padStart(2, "0");
				const dateOne = String(currentDate.getDate()).padStart(2, "0");
				const dateString = `${year}-${month}-${dateOne}`; */
				console.log(inputDate," cur ", currentDate)
				const errorId = date.getAttribute('data-error');
				const error = document.getElementById(errorId);
				if(inputDate > currentDate){
					//console.log("low")
					error.style.visibility='visible';
					date.classList.replace('border-success', 'border-danger');
				} else {
					//console.log("high")
					error.style.visibility = 'hidden';
	                date.classList.replace ('border-danger', 'border-success'); 
				}
			});
	    });
/* 	   document.getElementById('dc').addEventListener('click', (e)=>{
	    	e.preventDefault();
	    	console.log(dates.value,"sdf");		    	
	    }) 
	    
 */		
 		

        const form = document.getElementById("myForm");
        if(form){
        	
        const textFields = form.querySelectorAll('input[type="text"]');
         textFields.forEach((textField) => {
            // const firstName = document.getElementById('firstName') 
            textField.addEventListener('input', () => {
                // const error1 = document.getElementById('error1');
                //console.log('entered',textField.value)
                const errorId = textField.getAttribute('data-error');
                const error = document.getElementById(errorId);
                //console.log(typeof(errorId));
                // const error2 = document.getElementById('error2');
                let regName = /^[A-Za-z][A-Za-z\s]+[^0-9\W]+$/g;
                
                if (!regName.test(textField.value)) {
                	console.log(errorId)
                    error.style.visibility = 'visible';
                    textField.classList.replace ('border-success','border-danger');
                } else {
                    // fnameInput.classList.remove('vis');
                    error.style.visibility = 'hidden';
                    //textField.style.border = '2px solid green';
	                textField.classList.replace ('border-danger', 'border-success'); 
                }
            });
        });
         
        //const contactField = document.getElementById('contact');
        const contactField = form.querySelector('#contact');
        const errorIdContact = contactField.getAttribute('data-error');
        const errorContact = document.getElementById(errorIdContact);
        let regNum = /^[6-9]\d{9}$/;
        contactField.addEventListener('input', ()=>{
            if (contactField.value.length != 10 || !regNum.test(contactField.value)) {
        //         if (!regNum.test(contact)) {
                    /* alert("Please enter a valid contact number"); */
                    errorContact.style.visibility = 'visible';
                    //contactField.style.border = 'red solid 3px';
                    contactField.classList.replace('border-success','border-danger');
                } else {
                    errorContact.style.visibility = 'hidden';
                    //contactField.style.border = '2px solid green';
                    contactField.classList.replace ('border-danger', 'border-success'); 
                }
        });

        //const emailField = document.getElementById('email');
        const emailField = form.querySelector('#email');
        const errorIdEmail = emailField.getAttribute('data-error');
        const errorEmail = document.getElementById(errorIdEmail);
        let regEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{1,}$/g;
        emailField.addEventListener('input', ()=>{
            if (!regEmail.test(emailField.value)) {
				errorEmail.style.visibility = 'visible';
                //emailField.style.border = '2px solid red';
                emailField.classList.replace('border-success','border-danger');
            } else {
				errorEmail.style.visibility = 'hidden';
               // emailField.style.border = '2px solid green';
                emailField.classList.replace ('border-danger', 'border-success'); 
            }
        });
        }

        
        const regForm = document.getElementById("regForm");
        if(regForm){
        const textFields = regForm.querySelectorAll('input[type="text"]');
         textFields.forEach((textField) => {
            // const firstName = document.getElementById('firstName') 
            textField.addEventListener('input', () => {
                // const error1 = document.getElementById('error1');
                //console.log('entered',textField.value)
                const errorId = textField.getAttribute('data-error');
                const error = document.getElementById(errorId);
                //console.log(typeof(errorId));
                // const error2 = document.getElementById('error2');
                let regName = /^[A-Za-z][A-Za-z\s]+[^0-9\W]+$/g;
                
                if (!regName.test(textField.value)) {
                	console.log(errorId)
                    error.style.visibility = 'visible';
                    textField.classList.replace ('border-success','border-danger');
                } else {
                    // fnameInput.classList.remove('vis');
                    error.style.visibility = 'hidden';
                    //textField.style.border = '2px solid green';
	                textField.classList.replace ('border-danger', 'border-success'); 
                }
            });
        });
         
        //const contactField = document.getElementById('contact');
        const contactField = regForm.querySelector('#contact');
        const errorIdContact = contactField.getAttribute('data-error');
        const errorContact = document.getElementById(errorIdContact);
        let regNum = /^[6-9]\d{9}$/;
        contactField.addEventListener('input', ()=>{
            if (contactField.value.length != 10 || !regNum.test(contactField.value)) {
        //         if (!regNum.test(contact)) {
                    /* alert("Please enter a valid contact number"); */
                    errorContact.style.visibility = 'visible';
                    //contactField.style.border = 'red solid 3px';
                    contactField.classList.replace('border-success','border-danger');
                } else {
                    errorContact.style.visibility = 'hidden';
                    //contactField.style.border = '2px solid green';
                    contactField.classList.replace ('border-danger', 'border-success'); 
                }
        });

        //const emailField = document.getElementById('email');
        const emailField = regForm.querySelector('#email');
        const errorIdEmail = emailField.getAttribute('data-error');
        const errorEmail = document.getElementById(errorIdEmail);
        let regEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{1,}$/g;
        emailField.addEventListener('input', ()=>{
            if (!regEmail.test(emailField.value)) {
				errorEmail.style.visibility = 'visible';
                //emailField.style.border = '2px solid red';
                emailField.classList.replace('border-success','border-danger');
            } else {
				errorEmail.style.visibility = 'hidden';
               // emailField.style.border = '2px solid green';
                emailField.classList.replace ('border-danger', 'border-success'); 
            }
        });
        }

        </script>

	<script src="js/bootstrap.min.js"></script>
</body>
</html>