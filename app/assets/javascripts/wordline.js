//= require cable
//= require_self
//= require_tree .


App.messages = App.cable.subscriptions.create('RoomChannel',{
	received:function(data){
		
		if(data.word != /[^a-zA-Z0-9]/g && data.word != undefined)
		{
		console.log(data.word + " in timeline");
		document.getElementById("theWordToGuessForUsers").innerHTML = data.word;
		
		}
		

	}




})