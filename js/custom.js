var excluded_branches = [2,5,6,7];

function isArray(array, element) {
    return array.indexOf(element) > -1;
}

function addFields(flag, div){
	if(flag){
		div.html('<input class="form-control input-sm" placeholder="subject"><input class="form-control input-sm" placeholder="professor FH"><input class="form-control input-sm" placeholder="room FH"><input class="form-control input-sm" placeholder="professor SH"><input class="form-control input-sm" placeholder="room SH">');
	} else {
		div.html('<input class="form-control input-sm" placeholder="subject"><input class="form-control input-sm" placeholder="professor code"><input class="form-control input-sm" placeholder="room">');
	}
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
            alert("success");
			
			console.log(JSON.stringify(data));
            
            // console.log(data);
            // location.reload();
        },
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

$(document).ready(function(){
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

	$("#submit-button").click(function(){
		var error_flag = false,
			table = $('body').find('table'),
			sendJSON = {},
			branch = parseInt($('#branch_select').val()),
			semester = parseInt($('#semester_select').val()),
			section = parseInt($('#section_select').val());

		if(isArray(excluded_branches, branch) && section == 3)
			error_flag = true;

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
				temp_row = [];

			$('td').each(function(){
				var select_tag = $(this).children('select'),
					code = select_tag.data('field-name').split('/'),
					value = select_tag.val().toLowerCase(),
					temp_object = {};

				temp_object.value = value;
				// temp_object.day = parseInt(code[0]);
				// temp_object.timeslot = parseInt(code[1]) + 1;

				switch(value){
					case "theory" : 
						temp_object.subject = $("input[placeholder='subject']").val();
						temp_object.prof = $("input[placeholder='professor code']").val();
						temp_object.room = $("input[placeholder='room']").val();

						if(temp_object.room == '' || temp_object.prof == '' || temp_object.subject == '')
							send_flag = false;
						
						break;
					case "lab" :
						temp_object.subject = $("input[placeholder='subject']").val();
						temp_object.prof_FH = $("input[placeholder='professor FH']").val();
						temp_object.room_FH = $("input[placeholder='room FH']").val();
						temp_object.prof_SH = $("input[placeholder='professor SH']").val();
						temp_object.room_SH = $("input[placeholder='room SH']").val();
						
						if(temp_object.subject == '' || temp_object.prof_FH == '' || temp_object.room_FH == '' || temp_object.prof_SH == '' || temp_object.room_SH == '')
							send_flag = false;
						
						break;
					case "break" : case "lunch break" :
						break;
				}
				temp_row.push(temp_object);
				
				if(row_count % 10 == 0){
					sendJSON.data.push(temp_row);
					temp_row = [];
				}

				row_count++;
			});
	
			if(!send_flag){
				alert("Fields not complete");
			} else {
				// console.log(JSON.stringify(sendJSON));
				sendData(sendJSON);
			}
		}
	});
});