//= require cable
//= require_self
//= require_tree .
//this.App = {};
//App.cable = ActionCable.createConsumer();


App.messages = App.cable.subscriptions.create('RoomChannel', {
  received: function(data) {
  	if (data.fromx == -1001.42){
  		canvas = $('#paper');
  		ctx = canvas[0].getContext('2d');
  		ctx.clearRect(0,0,document.getElementById('paper').width,document.getElementById('paper').height);
  	}else if (data.fromx == -1000.42){
  		
  		
  		var timeLeft = 10;
  		var secondslabel = "";
  		 clearInterval(timer);

		timer = setInterval(function(){
		document.getElementById("time_left").innerHTML = "Time left:";
		var secondslabel = document.getElementById("timer").value = 0 + --timeLeft;
		document.getElementById("timer").innerHTML = secondslabel;
		
		if(timeLeft <= 0)
		{
  			clearInterval(timer);
  			document.getElementById("time_left").innerHTML = "Time is up!";
  			document.getElementById("timer").innerHTML = "";
		}

		}, 1000);

  	}
  	 else{
  	
    	drawLine(data.fromx, data.fromy, data.tox, data.toy, data.color)
	}
}
  }
);