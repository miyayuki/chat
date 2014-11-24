function reload_messages(group_id) {
	setInterval(function(){
		console.log("exec reload_messages()");
		var uri = group_id+"/messages";
		$.get(uri, function(data){
			console.log(data);
			var list = $('<ul/>');
			$.each(data, function(){
				$('<li/>').text(this['content']).appendTo(list);
			});
			$('#messages').html(list);
		});
	}, 2000);
}
