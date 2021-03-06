
//Given a table dimensions, it paints a random cell of that table. 

function paintRandomCircle (boardSize) {
	randomX = Math.floor((Math.random() * (boardSize)));
	randomY = Math.floor((Math.random() * (boardSize)));
	paintCircle(randomX,randomY, ai_id);
}

//Paints a circle (a <td>)

function paintCircle(x,y,id) {
	 var point = $($('#board')[0].rows[y].cells[x]).children().children()  
     point.css('background-color',user_color[id]);
	 point.data('user_id',id)
}

//Calls the above function repeatedly in a specific pace.

function startAi (){
	(function loop() {
	    var rand = Math.round(Math.random() * (100)) + 50;
	    setTimeout(function() {
	            paintRandomCircle(boardSize);
	            if(can_play){
	            	loop(); 
	            }
	    }, rand);
	}());
}
