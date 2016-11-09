$(document).ready(function () {
	  $("#public").on("click", function(){
		  $("#publicProjects").show();
		  $("#protectedProjects").hide();
		  $(this).prop('disabled', true);
		  $("#protected").prop('disabled', false);
		  //$("#listUsers").attr("disabled", true);
		  //$("#requestsUsers").attr("disabled", false);
		})
		$("#protected").on("click", function(){
		  $("#protectedProjects").show();
		  $("#publicProjects").hide();
		  $(this).prop('disabled', true);
		  $("#public").prop('disabled', false);
		  //$("#listUsers").attr("disabled", false);
		  //$("#requestsUsers").attr("disabled", true);
		})
});