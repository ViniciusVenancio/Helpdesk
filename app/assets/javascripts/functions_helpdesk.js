//Exibindo os contratos das empresas	
if($('.contracts-enterprise-button').size() > 0) {

	setTimeOut(function(){
		$('.contracts-enterprise-button').click(function() {
			
		var element = $(this).siblings('div');

		if($(element).css('display') == 'block') {
			$(element).hide('slow');
		} else {
			$(element).show('slow');
		}

		return false;
		});
	}, 50000);
}