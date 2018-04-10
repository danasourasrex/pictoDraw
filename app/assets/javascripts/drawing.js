
$(function(){
  //vars that should be globally accessed, the document, the canvas, and the canvas context.
  document.getElementById('paper').width = 600;
  document.getElementById('paper').height = 400;
  doc = $(document);


  canvas = $('#paper');
  ctx = canvas[0].getContext('2d');

  //local vars, previous coords for the client, a random color, a boolean stating if the client is drawing or not, and the time since we last told the server we were drawing.
  var prev = {};
  var color = '#'+(Math.random()*0xFFFFFF<<0).toString(16);
  var drawing = false;
  var timeSinceLastSend = $.now();
  //event to fire if mouse down or touch on canvas element
  canvas.on("mousedown touchstart", function(e){
    var rect = this.getBoundingClientRect();

    e.preventDefault();
    //get coords if mouse down
    var x = e.pageX;
    var y = e.pageY;
    //get coords if touch
    if ( e.originalEvent.changedTouches ) {
      e = e.originalEvent.changedTouches[0];
      x = e.pageX;
      y = e.pageY;
    }
    //set drawing to true and the coordinates for the prev object
    //the prev object is used for the start of the drawing line
    drawing = true;
    prev.x = x;
    prev.y = y;
  });
  //event to fire if the mouse is released/left or touched up
  doc.bind('mouseup mouseleave touchend',function(){
    drawing = false;
  });
  //event to fire as the mouse moves or finger is dragged
  doc.on('mousemove touchmove',function(e){

    //if we are drawing, and its been over 10ms since last update
    if(drawing && $.now() - timeSinceLastSend > 10){

      //get mouse coords
      var x = e.pageX;
      var y = e.pageY;
      //if touching, get touch coords
      if ( e.originalEvent.changedTouches ) {
        e = e.originalEvent.changedTouches[0];
        x = e.pageX;
        y = e.pageY;
      }
      //create ajax request to /updateline
      //data is prev coordinates and current coordinates and color
      $.ajax({
        method: "POST",
        url: "/updateline",
        data: {
          'fromx': prev.x,
          'fromy': prev.y,
          'tox': x,
          'toy': y,
          'color': color
        }
      });
      //reset time since last send
      timeSinceLastSend = $.now();
    }
    //draw the line and reset prev
    if(drawing && x && y){
      drawLine(prev.x, prev.y, x, y, color);

      prev.x = x;
      prev.y = y;
    }
  });
});
//function to draw a line
function drawLine(fromx, fromy, tox, toy, color){
 ctx.beginPath();
 ctx.strokeStyle = color
 ctx.moveTo(fromx-30, fromy-205);
 ctx.lineTo(tox-30, toy-205);
 ctx.stroke();
}
//function to clear the canvas for all subscribers
function clearCanvas() { 
  $.ajax({
        method: "POST",
        url: "/updateline",
        data: {
          'fromx': -69.42,
          'fromy': 0,
          'tox': 0,
          'toy': 0,
          'color': 0
        }
      });

}



