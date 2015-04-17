// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require functions_helpdesk
//
//= require_tree .

Turbolinks.enableTransitionCache();

//Busco o endereço pelo CEP  
$(document).ready(function(){
  if($("#enterprise_cep").length > 0){
  	$("#enterprise_cep").on('focusout', function() {

  		if($(".cep-error").css('display') == 'inline-block') {
  			$(".cep-error").hide("slow");
  		}

    	var cep = $(this).val().replace(/[^0-9]/, ''); 
     	if(cep != "") {
      	var url = 'http://cep.correiocontrol.com.br/'+cep+'.json';
      	$.getJSON(url, function(json){
        	$("#enterprise_adress").val(json.logradouro);
        	$("#enterprise_district").val(json.bairro);
        	$("#enterprise_city").val(json.localidade);
      	}).fail(function(){
        	$(".cep-error").show("slow");
      	});
    	}
  	});
	}
});