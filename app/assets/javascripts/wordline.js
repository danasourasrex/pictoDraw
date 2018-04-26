//= require cable
//= require_self
//= require_tree .


App.messages = App.cable.subscriptions.create('RoomChannel',{
	received:function(data){
		
		if((data.word != /[^a-zA-Z0-9]/g && data.word != undefined)&&(data.drawer != /[^a-zA-Z0-9]/g && data.drawer != undefined))
		{
		
		word_to_guess = data.word;
		drawer = data.drawer
		if(document.getElementById('username').value != data.drawer)
		{
		canDraw = false;

		document.getElementById("word").innerHTML = '&nbsp';
		document.getElementById("drawing_user").innerHTML = "Current Drawer: " + data.drawer;
		}
		else{
		canDraw = true;
		document.getElementById("word").innerHTML = "Your Word: " + data.word;	
		document.getElementById("drawing_user").innerHTML = "Current Drawer: " + data.drawer;
		}
		}
		

	}




})