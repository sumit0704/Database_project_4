$(document).ready(function () {
	  
	  var countRequest1 = document.getElementById('countRequest').value;
	  
	  var countApproved1 = document.getElementById('countApproved').value;
	  
	  var total = countRequest1+countApproved1;
		var reqPrcnt = ((countRequest1/total)*100);
		var approvePrcnt = ((countApproved1/total)*100);
		if(chart!=null){
	        chart.destroy();
	    }
	  var chart = new CanvasJS.Chart("chartContainer",
				
				
		{
			title:{
				text: "",
				fontFamily: "Impact",
				fontWeight: "normal"
			},
			
			legend:{
				verticalAlign: "bottom",
				horizontalAlign: "center"
			},
			data: [
			{
				//startAngle: 45,
				indexLabelFontSize: 20,
				indexLabelFontFamily: "Garamond",
				indexLabelFontColor: "darkgrey",
				indexLabelLineColor: "darkgrey",
				type: "doughnut",
				showInLegend: false,
				dataPoints: [
				    {  y: approvePrcnt, legendText:"", indexLabel: "Approved "+countApproved1},
					{  y: reqPrcnt, legendText:"", indexLabel: "Awaiting "+countRequest1 }
					
				]
			}
			]
		});

		chart.render();
	
});
$(document).ready(function () {
	  $("#listUsers").on("click", function(){
		  $("#showListApproved").show();
		  $("#showRequests").hide();
		  $(this).prop('disabled', true);
		  $("#requestsUsers").prop('disabled', false);
		  //$("#listUsers").attr("disabled", true);
		  //$("#requestsUsers").attr("disabled", false);
		})
		$("#requestsUsers").on("click", function(){
		  $("#showRequests").show();
		  $("#showListApproved").hide();
		  $(this).prop('disabled', true);
		  $("#listUsers").prop('disabled', false);
		  //$("#listUsers").attr("disabled", false);
		  //$("#requestsUsers").attr("disabled", true);
		})
});