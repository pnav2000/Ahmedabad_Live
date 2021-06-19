function validateForm() {
			  var validationName = document.forms["myForm"]["name"].value;
			  if (validationName == "") {
			    alert("Name must be filled out");
	 			return false;
	  			}

			 var validationContact = document.forms["myForm"]["contact"].value;
			 if (validationContact == "") {
			 	alert("Contact Number must be filled out");
			 	return false;
			 }
			
			 var validationContact = document.forms["myForm"]["contact"].value;
			 if (validationContact == "") {
			 	alert("Contact Number must be filled out");
			 	return false;
			 }
			
			 var validationPass = document.forms["myForm"]["password"].value;
			 if (validationPass == "") {
			 	alert("Password must be filled out");
			 	return false;
			 }
			
			 var validationConPass = document.forms["myForm"]["re-password"].value;
			 if (validationConPass == "") {
			 	alert("Confirm Password must be filled out");
			 	return false;
			 }
			
			 var validationDOB = document.forms["myForm"]["dateofbirth"].value;
			 if (validationDOB == "") {
			 	alert("Date of Birth must be Selected out");
			 	return false;
			 }
			
			 var validationGender = document.forms["myForm"]["gender"].value;
			 if (validationGender == "") {
			 	alert("Gender must be Selected out");
			 	return false;
			 }
			
			 var validationCollege = document.forms["myForm"]["college"].value;
			 if (validationCollege == "") {
			 	alert("College Name must be filled out");
			 	return false;
			 }
			
			 var validationAddress = document.forms["myForm"]["address"].value;
			 if (validationAddress == "") {
			 	alert("Address must be filled out");
			 	return false;
			 }
			
			 var validationFile = document.forms["myForm"]["file"].value;
			 if (validationFile == "") {
			 	alert("File must be Uploaded");
			 	return false;
			 }
	}