$(function(){
	$(document).on(
			'change',
			'.btn-file :file',
			function() {
				var input = $(this), label = input.val()
						.replace(/\\/g, '/')
						.replace(/.*\//, '');
				input.trigger('fileselect', [ label ]);
			});
	$('.btn-file :file').on(
			'fileselect',
			function(event, label) {

				var input = $(this).parents('.input-group')
						.find(':text'), log = label;

				if (input.length) {
					input.val(log);
				} else {
					if (log)
						alert(log);
				}

			});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img-upload').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imgInp").change(function() {
		readURL(this);
	});
	
	
	$("#regButton").on("click",function(e){
		e.preventDefault();
		var fName = $("#fName").val();
		var lName = $("#lName").val();
		var regNo = $("#regNo").val();
		
		var check = true;
		console.log(fName + " "+ lName);
		
		if ( fName== "" || lName== "" || regNo=="") {
			alert("Please fill in all fields..");
			check=false;
		}else if(regNo.length != 12){
			alert("Invalid length of registration number..");
			check=false;
		}else{ 
		}
			var hasNumber = /\d/;
			
			if (hasNumber.test(fName)) {
				alert("first name can't contain a number..");
				check=false;
			} else if(hasNumber.test(lName)){
				alert("last name can't contain a number..");
				check=false;
			}
		
		if(check==true){
			$("#regForm").submit();
		}
		
		
	});
	
	$("#searchButton").on("click",function(e){
		e.preventDefault();
		var check = true;
		var regNo = $("#regNo").val();
		var regLength = regNo.length;
		if(regNo == ""){
			alert("Please enter a registration number..");
			check=false;
		}else if(regLength != 12){
			alert("Invalid length of registration number..");
			console.log(regNo.length);
			check=false;
		}else{
			$("#searchForm").submit();
		}
	});
	
	
});