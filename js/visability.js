function show_element(id){
	document.getElementById(id).style.display="inline";
}

function hid_element(id){
	document.getElementById(id).style.display="none";
  $('div.overlay').hide();
}
$(document).ready(function(){
  setTimeout(function(){$('div.overlay').height($(document).height());}, 200);
})