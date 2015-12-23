function add_fields(flag, div){
	if(flag){
		div.html('<input class="form-control input-sm" placeholder="subject"><input class="form-control input-sm" placeholder="professor FH"><input class="form-control input-sm" placeholder="room FH"><input class="form-control input-sm" placeholder="professor SH"><input class="form-control input-sm" placeholder="room SH">');
	} else {
		div.html('<input class="form-control input-sm" placeholder="subject"><input class="form-control input-sm" placeholder="professor code"><input class="form-control input-sm" placeholder="room">');
	}
}

$(document).ready(function(){
	$(".js-example-basic-single").change(function() {
		var select_tag = $(this),
			selected_div = select_tag.parent('td').children('div'),
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

	$("#refresh-button").click(function(){
		location.reload();
	});

	$("#submit-button").click(function(){
		var table = $('body').find('table');

		$('td').each(function() {
			var select_tag = $(this).children('select'),
				code = select_tag.data('field-name'),
				value = select_tag.val().toLowerCase();

			console.log(value);
			console.log(code);
		});
	});


});