<style>
label {
	font-weight: bold;
}
</style>
<div class="container px-3 py-3">
	<h3>Personal Information</h3>
	<form id="update-user" action="/uteshop/user/profile/update" method="post" enctype="multipart/form-data"> <!-- update user here -->
		<input type="hidden" name="operation" value="updateUser">
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Your name</label> <input type="text"
					name="name" class="form-control" placeholder="First and last name"
					value="${sessionScope.activeUser.fullname }">
			</div>
			<div class="col-md-6 mt-2">
				<label class="form-label">Email</label> <input type="email"
					name="email" placeholder="Email address" class="form-control"
					value="${sessionScope.activeUser.email }">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Mobile number</label> <input type="number"
					name="mobile_no" placeholder="Mobile number" class="form-control"
					value="${sessionScope.activeUser.phoneNumber }">
			</div>
			<div class="col-md-6 mt-2">
                    <label class="form-label">Date of Birth</label>
                            <input type="date" name="dateOfBirth" class="form-control" value="${sessionScope.activeUser.dateOfBirth }"required>
           </div>
		</div>
		<div class="mt-2">
			<label class="form-label">Address</label> <input type="text"
				name="address" placeholder="Enter Address(Area and Street))"
				class="form-control" value="${sessionScope.activeUser.address }">
		</div>
		
		   <c:if test="${sessionScope.activeUser.image != ''}">
                 
                          <c:if test ="${sessionScope.activeUser.image.substring(0,5) != 'https' }">
                         
                           <c:url value="/image?fname=${sessionScope.activeUser.image}" var="imgUrl"></c:url>
                        </c:if>

                       <c:if test ="${sessionScope.activeUser.image.substring(0,5) == 'https' }">
                            <c:url value="${sessionScope.activeUser.image}" var="imgUrl"></c:url>
                       </c:if>
                 </c:if>      
		 <label for="images">Images:</label><br>
         <input type="file" id="images" name="fileimage" onchange="chooseFile(this)" value ="${imgUrl }"><br>
	     <img id="imagess" src="${imgUrl }" width="80" height="70" /><br> 

		<div id="submit-btn" class="container text-center mt-3">
			<button type="submit" class="btn btn-outline-primary me-3">Update</button>
			<button type="reset" class="btn btn-outline-primary">Reset</button>
		</div>
	</form>
</div>
<script >
function chooseFile(fileInput) {
    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            // Update the image source to the uploaded file's data URL
            $('#imagess').attr('src', e.target.result);
        }
        reader.readAsDataURL(fileInput.files[0]);
    }
}
</script>
