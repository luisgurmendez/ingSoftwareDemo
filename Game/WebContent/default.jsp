<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <meta charset="utf-8">
        <title>Your First WebSocket!</title>
        <script language="javascript" type="text/javascript">
            
            var wsUri = "ws://localhost:8080/Game/gameWS";
            
            function init() {
                output = document.getElementById("output");
            }
            function send_message() {
            	websocket = new WebSocket(wsUri);
                websocket.onopen = function(evt) {
                    onOpen(evt)
                };
                websocket.onmessage = function(evt) {
                    onMessage(evt)
                };
                websocket.onerror = function(evt) {
                    onError(evt)
                };
            }
            function onOpen(evt) {
                writeToScreen("Connected to Endpoint!");
                doSend(textID.value);
            }
            function onMessage(evt) {
                writeToScreen("Message Received: " + evt.data);
            }
            function onError(evt) {
                writeToScreen('ERROR: ' + evt.data);
            }
            function doSend(message) {
                writeToScreen("Message Sent: " + message);
                websocket.send(message);
               // websocket.close();
            }
            function writeToScreen(message) {
                var pre = document.createElement("p");
                pre.style.wordWrap = "break-word";
                pre.innerHTML = message;
                 
                output.appendChild(pre);
            }
            window.addEventListener("load", init, false);
        </script>
        <h1 style="text-align: center;">Hello World WebSocket Client</h2>
        <br>
        <div style="text-align: center;">
            <form action="">
                <input onclick="send_message()" value="Send" type="button">
                <input id="textID" name="message" value="Hello WebSocket!" type="text"><br>
            </form>
        </div>
        <div id="output"></div>
</body>
</html>