//= require cable
//= require_self
//= require_tree .
//this.App = {};
//App.cable = ActionCable.createConsumer();


App.messages = App.cable.subscriptions.create('RoomChannel', {
  received: function(data) {
  	if (data.fromx == -69.42){
  		canvas = $('#paper');
  		ctx = canvas[0].getContext('2d');
  		ctx.clearRect(0,0,document.getElementById('paper').width,document.getElementById('paper').height);
  	} else {
    drawLine(data.fromx, data.fromy, data.tox, data.toy, data.color)
}
  }
});