function add_fields(flag, div){
	if(flag){
		div.html('<input><br><input><br><input>');
	}
}

$(document).ready(function(){
	$(".js-example-basic-single").change(function() {
		var select_tag = $(this),
			selected_div = select_tag.parent('td').children('div'),
			code = select_tag.data('field-name'),
			value = select_tag.val().toLowerCase();

		switch(value){
			case "theory" : 
				selected_div.html('');
				add_fields(false, selected_div);
				break;

			case "lab" :
				selected_div.html('');
				add_fields(true, selected_div);
				break;
		}
	});
});