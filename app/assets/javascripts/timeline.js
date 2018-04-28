//= require cable
//= require_self
//= require_tree .

App.messages = App.cable.subscriptions.create('RoomChannel',{
	received:function(data){

		if(data.time != 0 && (data.time<=200))
		{
		console.log(data.time);
		game_running = true;
		
		document.getElementById("time_left").innerHTML = "Time left:";
		document.getElementById("timer").innerHTML = data.time;
		}
		else if(data.time == 'false')
		{
			clearInterval(timer);
			document.getElementById("word").innerHTML = "&nbsp";
			document.getElementById("drawing_user").innerHTML = "&nbsp";
			document.getElementById("time_left").innerHTML = "&nbsp";
			document.getElementById("timer").innerHTML = "&nbsp";
			game_running = false;
		}
		else if(data.time == 'reset')
		{
			okayToLeave = false;	
			round_counter++;
			if(round_counter == 1){
				clearInterval(timer);
				$.ajax({
                url: "/finalResults",
                type: 'POST'
                });

			}else{


			
			console.log(round_counter);
			clearInterval(timer);
			normalRestetTimer();
		}

		}
		else if(data.time == 0)
		{
		document.getElementById("time_left").innerHTML = "Times up!";
		document.getElementById("timer").innerHTML = "";
		startTimerForEveryone()
		
              
              
              
              
            }
			
		}

	})



