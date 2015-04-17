// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//
//= require_tree .

Turbolinks.enableTransitionCache();

//Busco o endereço pelo CEP  
if($("#enterprise_cep").length > 0) {
	$("#enterprise_cep").on('focusout', function() {
  	var cep = $("#enterprise_cep").val().replace(/[^0-9]/, ''); 
   	if(cep != "") {
    	var url = 'http://cep.correiocontrol.com.br/'+cep+'.json';
     	$.getJSON(url, function(json) {
       	$("#enterprise_adress").val(json.logradouro);
       	$("#enterprise_district").val(json.bairro);
       	$("#enterprise_city").val(json.localidade);
       	$("#enterprise_number").focus();
     	}).fail(function() {
       	$(".cep-error").show("slow");
       	$("#enterprise_cep").val("").focus();
       	setTimeout(function(){ jQuery(".cep-error").hide("slow"); }, 5000);
     	});
   	}
 	});
}

if($('.contracts-enterprise-button').size() > 0) {
	$('.contracts-enterprise-button').click(function() {
		var element = $(this).siblings('div');
		if($(element).css('display') == 'block') {
			$(element).hide('slow');
		} else {
			$(element).show('slow');
		}
		return false;
	});
}