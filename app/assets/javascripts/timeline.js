//= require cable
//= require_self
//= require_tree .


App.messages = App.cable.subscriptions.create('RoomChannel',{
	received:function(data){	
		if(data.time != 0 && (data.time<60))
		{
		document.getElementById("time_left").innerHTML = "Time left:";
		document.getElementById("timer").innerHTML = data.time;
		}
		else if(data.time == 0)
		{
		document.getElementById("time_left").innerHTML = "Times up!";
		document.getElementById("timer").innerHTML = "";	
		}

	}




})