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
		else if(data.time == 'reset')
		{
			clearInterval(timer);
			if(round_counter == 10){
				$.ajax({
                url: "/finalResults",
                type: 'POST'
                });

			}else{


			round_counter++;
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



