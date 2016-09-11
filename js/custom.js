// branches in which there are only less than 3 (<3) sections
var excluded_branches = [2,5,6,7];

// checks if the "element" is present inside "array" or not 
function isArray(array, element) {
    return array.indexOf(element) > -1;
}


function addFields(flag, div){
	if(flag){
		div.html('<input class="form-control input-sm subject" placeholder="subject"><input class="form-control input-sm prof_FH" placeholder="professor FH"><input class="form-control input-sm room_FH" placeholder="room FH"><input class="form-control input-sm prof_SH" placeholder="professor SH"><input class="form-control input-sm room_SH" placeholder="room SH">');
	} else {
		div.html('<input class="form-control input-sm subject" placeholder="subject"><input class="form-control input-sm prof" placeholder="professor code"><input class="form-control input-sm room" placeholder="room">');
	}
}




function showMessage(status, message){
	var html_code = '<div class="alert alert-'
		+ status
		+ ' alert-dismissible fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>'
		+ message
		+ '</div>';

	$("#submit_message").html(html_code);
}


function sendData(json){
	var table = $('body').find('table');
    $.ajax({
        type : 'POST',
        data : {
            json : JSON.stringify(json)
        },
        url : config_api_url + "save-response.php",
        success: function(data) {                    
			var response = jQuery.parseJSON(data);

			// API returns a "success" flag to check if the data was successfully saved or not
			if(response.success){
				showMessage("success", "Your response has been successfully saved, good job. <strong>Go ahead have a cookie!</strong>");
			} else {
				showMessage("danger", "There was some technical high level error, try again after sometime.<br><strong>If the problem continues, ask some senior to look into the same</strong>");
			}
        },

        // add a blur effect while submitting
        // just to be cool in front of non-technical people
        beforeSend: function() {
            table.css({'opacity' : '0.4'});
            $("#submit-button").attr("disabled", "disabled");
        },
        complete: function() {
            table.css({'opacity' : '1.0'});
            $("#submit-button").removeAttr("disabled");
        }
    });
}

function stripHTML(dirtyString) {
	var container = document.createElement('div');
	var text = document.createTextNode(dirtyString);
	container.appendChild(text);
	return container.innerHTML; // innerHTML will be a xss safe string
}

$(document).ready(function(){


	
	$("#branch_select, #semester_select, #section_select").change(function() {


		var reqObj = new Object();
		reqObj.branch = parseInt($('#branch_select').val());
		reqObj.semester = parseInt($('#semester_select').val());
		reqObj.section = parseInt($('#section_select').val());
		reqObj = $.param(reqObj);
		var url = config_api_url + "get-data.php?" + reqObj;
		

		$.ajax({url: url ,
		 success: function(result){
        	

		 	result = JSON.parse(result);
		 	
		 	var timetable = result.timetable;
		 	var day = 0;
		 	var slot = 0;
		 	$("td").each(function(){

		 		if (slot==10) {
		 			slot = 0;
		 			day++;
		 		}
		 		
		 		$(this).children("select").val(timetable[day][slot].value).change();
		 		switch(timetable[day][slot].value){
					
					case "theory" : 
						
						$(this).children().children('.subject').val(timetable[day][slot].subject);
						$(this).children().children('.prof').val(timetable[day][slot].prof);
						$(this).children().children('.room').val(timetable[day][slot].room);
						break;
					
					case "lab" :

						$(this).children().children('.subject').val(timetable[day][slot].subject);
						$(this).children().children('.prof_FH').val(timetable[day][slot].prof_FH);
						$(this).children().children('.room_FH').val(timetable[day][slot].room_FH);
						$(this).children().children('.prof_SH').val(timetable[day][slot].prof_SH);
						$(this).children().children('.room_SH').val(timetable[day][slot].room_SH);
						
						break;
				}
		 		slot++;

		 	});


   		}});

}	);




	// when the user changes any slot type
	// possible slot types are "theory", "lab" and "break" or "lunch break"
	// "break" and "lunch break" serve same purpose except in the android app they are highlighted differently
	$(".js-example-basic-single").change(function() {
		var select_tag = $(this),
			selected_div = select_tag.parent('td').children('div'),
			value = select_tag.val().toLowerCase();

		switch(value){
			case "theory" : 
				selected_div.html('');
				addFields(false, selected_div);
				break;

			case "lab" :
				selected_div.html('');
				addFields(true, selected_div);
				break;
			case "break" : case "lunch break" :
				selected_div.html('');
				break;
		}
	});

	$("#refresh-button").click(function(){
		location.reload();
	});

	// when the user clicks on submit button
	$("#submit-button").click(function(){
		var error_flag = false,
			table = $('body').find('table'),
			sendJSON = {},
			branch = parseInt($('#branch_select').val()),
			semester = parseInt($('#semester_select').val()),
			section = parseInt($('#section_select').val());

		// check if someone selected an "excluded_branch" and section 3
		if(isArray(excluded_branches, branch) && section == 3)
			error_flag = true;

		// check if someone selected branch "BT" and section 2
		// because BT has only 1 section
		if(branch == 6 && (semester == 1 || section == 2))
			error_flag = true;
		

		if(error_flag){
			alert("Incorrect entries");
		} else {
			sendJSON.branch = branch;
			sendJSON.semester = semester;
			sendJSON.section = section;
			sendJSON.data = [];

			var send_flag = true,
				row_count = 1,
				day_count = 0,
				temp_row = [];

			// iterates over all the periods
			// it goes Monday 1st period to Monday 10th period, then Tuesday and so on
			// each day is divided in 10 slots and total 7 days, so this loop goes 70 times
			$('td').each(function(){
				var selected_div = $(this),
					value = selected_div.children('select').val().toLowerCase(),
					temp_object = {},

					f$ = function(selector) {
			            return selected_div.find("input[placeholder='" + selector + "']").val();
			        };

				temp_object.value = value.replace(/(<([^>]+)>)/ig,"");

				// temp_row represnts one day
				// temp_object represtns one slot

				$('input').each(function () {
    				if ($.trim($(this).val()) == '') {
        				isValid = false;
       					$(this).addClass('empty');

    				} else{
    					$(this).removeClass('empty');
    				}
				});
				$('input').focus(function () {
   
        			$(this).removeClass('empty');
      
				});
				
				switch(value){
					// there is only one prof and one room
					case "theory" : 
						temp_object.subject = f$('subject');
						temp_object.prof 	= f$('professor code');
						temp_object.room 	= f$('room');;

						if(temp_object.room == '' || temp_object.prof == '' || temp_object.subject == ''){
							send_flag = false;

						}

						break;

					// there are 2 subjects, 2 profs and 2 rooms
					// subject is to entered in the single field only as (subj1 + subj2)
					case "lab" :
						temp_object.subject = f$('subject');
						temp_object.prof_FH = f$('professor FH');
						temp_object.room_FH = f$('room FH');
						temp_object.prof_SH = f$('professor SH');
						temp_object.room_SH = f$('room SH');
						
						if(temp_object.subject == '' || temp_object.prof_FH == '' || temp_object.room_FH == '' || temp_object.prof_SH == '' || temp_object.room_SH == '')
							send_flag = false;
						
						break;

					// simple things
					case "break" : case "lunch break" :
						break;
				}
				temp_row.push(temp_object);
				
				// checks if a day ended or not
				if(row_count % 10 == 0){
					sendJSON.data.push(temp_row);
					temp_row = [];
					day_count++;
				}

				row_count++;
			});
	
			// if there is some field which is left blank "send_flag" would be set to false 
			if(!send_flag){
				alert("Fields not complete");
			} else {
				sendData(sendJSON);
			}
		}
	});
});