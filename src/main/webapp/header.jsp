<style>
#headercount.ui-li-count{						
	  color: #FFFFF; /* right: 0.5em; JQM 1.1 removed */ 
	  font-size: 90%; text-shadow: none; 
	  font-weight: bold; 
	  font-family: arial; 
	  -moz-box-shadow: 0 1px 2px #999; -webkit-box-shadow: 0 1px 2px #999; box-shadow: 0 1px 2px #999; /* padding-bottom: 1px; JQM 1.1 removed */ 
	  border: 0px; border-radius: 14px; -moz-border-radius: 14px; -webkit-border-radius: 14px; 
	   background-position: 0 0 !important; background-color:#FF0000;
	  top:25%;
		right:1%; 
	  position: absolute; /* JQM 1.1 added */
	  
	 
	filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#72b0d4', EndColorStr='#4b88b6');
	-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#72b0d4', EndColorStr='#4b88b6')";
}
</style>
<script>
var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/chat");
var messageIterator = 0;
chatRef.on('child_added', function(snapshot) {
  var chatData = snapshot.val();
  var from = chatData.from;
  var to = chatData.to;
  var timestamp = chatData.timestamp; 
  var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/"+ '<%=username%>' + "/userStatus/");
  //var lastSeen;
  chatRef.on('value', function(snapshot) {
	  var lastSeen = snapshot.val().last;
	  //alert(lastSeen);
	   if(to=='<%=username%>' && (lastSeen<timestamp || status=='unread')){
			messageIterator++;   
			//alert("to:" + to + " lastSeen: " + lastSeen + " timestamp: "  + timestamp);
			var headerNotification = document.getElementById("headercount");
			var pannelNotification = document.getElementById("rightPanel");
			if(messageIterator!=0){
				headerNotification.className = "ui-li-count"; 
				pannelNotification.className = "ui-li-count";
			}
			document.getElementById('headercount').textContent = messageIterator.toString();
			 document.getElementById('rightPanel').textContent = messageIterator.toString();
	  }
  });
  //alert(lastSeen);
});
  
</script>

<a href="#" id="backButton" class="ui-nodisc-icon ui-btn ui-corner-all ui-btn-icon-left ui-icon-carat-l" data-rel="back" data-transition="slide">&nbsp;</a>
 		<h1><%=headerTitle %> </span></h1>
	
	<a href="#right-panel"  id="btn2" data-shadow="false" data-iconshadow="false" class="ui-nodisc-icon ui-btn ui-btn-icon-right ui-icon-myicon ui-btn-icon-notext">Panel</a>
	<span id="headercount" ></span>
	