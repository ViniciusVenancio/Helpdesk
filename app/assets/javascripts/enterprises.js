// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//Busco o endereço pelo CEP  
$(document).ready(function(){
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
});