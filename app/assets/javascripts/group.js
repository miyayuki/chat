$(function() {
	setInterval(function(){
		console.log("requesting");
		$.get('/groups/20/messages', function(data){
			var list = $('<ul/>');
			$.each(data, function(){
				$('<li/>').text(this['content']).appendTo(list);
			});
			$('#messages').html(list);
		});
	}, 2000);
});
