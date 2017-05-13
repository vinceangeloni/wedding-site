var attending = false;
var guest_num = 1;
var rsvp_code = "";
var guest_id;

$(document).ready(function() {
	$("#guest-form").validate();
	
	// RSVP code
	$('.rsvp_char').keyup(function(e) {		
		if (e.which != 8){
			$(this).nextAll('.rsvp_char:first').focus();
		}
		rsvp_code = $('#rsvp_char1').val() + $('#rsvp_char2').val() + $('#rsvp_char3').val() + $('#rsvp_char4').val();
		$('#rsvp_code').val(rsvp_code);
		console.log(rsvp_code);
	});
	
	$('.btn-attending').click(function() {
		var attending = $(this).val();
		$('.btn-attending').removeClass('selected');
		$(this).addClass('selected');
		$('#attending').val(attending);
		if (attending == "true") {
			$('#step2-submit').val('Next');
			$('#guest-select').removeClass('hidden');
			$('#respondForm').attr('action', '/rsvp/respond');
			$('#guest_count').val(guest_num);
		} else {
			$('#step2-submit').val('Send RSVP');
			$('#guest-select').addClass('hidden');
			$('#respondForm').attr('action', '/rsvp/send_rsvp');
			$('#guest_count').val(0);
		}
		$('#guest-email').removeClass('hidden');
		$('#step2-submit').removeClass('disabled');
	});
	$('.btn-guestsnum').click(function() {
		var guest_num = $(this).val();
		$('.btn-guestsnum').removeClass('active');
		$(this).addClass('active');
	});

	$("#guest-select button").click(function() {
		guest_num = $(this).val();
		$("#guest-select button").removeClass('selected');
		$(this).addClass('selected');
		$('#guest_count').val(guest_num);
	})
	// Toggles the dietary textarea for this guest
	$('.guest-dietary').change(function() {
		if ($(this).is(':checked')) {
			guest_id = $(this).attr('data-guest');
			$('.guest#' + guest_id + ' .dietary_text').removeClass('hidden');
		} else {
			$('.guest#' + guest_id + ' .dietary_text').addClass('hidden');
		}
	});
})
