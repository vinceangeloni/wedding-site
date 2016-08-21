var attending = false;
var guest_num = 0;


$(document).ready(function() {
	
	$('.btn-attending').click(function() {
		var attending = $(this).val();
		$('.btn-attending').removeClass('active');
		$(this).addClass('active');
		showForm(attending);
	});



	$("#num_attending").change(function() {
		attending = parseInt($(this).val()) + 1;
		$('.guest').remove();
		$("#send_rsvp").attr('disabled', false);

		// Adds the templates to the DOM
		for (i=1;i < attending;i++) {
			var template = '<div class="panel panel-default guest" id="' + i + '"><div class="panel-heading">Guest ' + i + ' </div><div class="panel-body"><div class="form-group"><label>First name</label><input type="text" name="guest[' + i + ']first_name" class="form-control" required></div><div class="form-group"><label>Last name</label><input type="text" name="guest[' + i + ']last_name" class="form-control" required></div><div class="form-group"><label>Entree Preference</label><select name="guest[' + i + ']menu_item" class="form-control" required><option value="" selected>Select an entree...</option><option value="1">Meat and potatoes</option><option value="2">Chicken and lasagna</option><option value="3">Baked beans and stew</option></select></div><div class="checkbox nomargin"><label><input type="checkbox" name="guest[' + i + ']dietary" class="guest_dietary" data-guest="' + i + '">This guest has a dietary restriction</label></div><div class="mt10 dietary_text hidden"><textarea class="form-control" rows="3" name="guest[' + i + ']dietary_text" placeholder="Enter any allergies or dietary preferences you may have..."></textarea></div></div>';
			$('.guests').append(template);
		}
		// Show the guests
		$('.guests').removeClass('hidden');

		// Toggles the dietary textarea for this guest
		$('.guest_dietary').change(function() {
			if ($(this).is(':checked')) {
				var guest = $(this).attr('data-guest');
				$(".guest#" + guest + " .dietary_text").removeClass('hidden');
			} else {
				var guest = $(this).attr('data-guest');
				$(".guest#" + guest + " .dietary_text").addClass('hidden');
			}
		});
	})
})

showForm = function(is_attending) {
	attending = is_attending;

	if (is_attending == true) {
		$("#attend_form").removeClass('hidden');
	} else {
		$("#attend_form").toggleClass('hidden');
	}
}