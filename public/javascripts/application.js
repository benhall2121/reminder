
$(document).ready(function(){
	
  var oldMessage = '';

  $('#apn_message').click(function(){
    $('#sent_message').html('');

    var newMessage = $('#message').val();
    
    if(newMessage != '' && newMessage != oldMessage){
      $.post('/send_apn',{ 'message': newMessage });
      $('#sent_message').html('Your message will be delivered shortly');
      oldMessage = newMessage;
    } else {
      alert('Come on!!!, I am not sending the same exact message twice in a row or a blank message. Maybe you should try again.');
    }
  });

});