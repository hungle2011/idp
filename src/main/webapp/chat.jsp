<%
String username=request.getParameter("username");
String requestor = request.getParameter("requestor");
String requestorName = "Jason Lim";
if(username.equals("jason_lim")){
	requestorName = "Marie Wong";
}
out.println("Welcome back " + username + "<br/>");
%>
<html>
<head>

	<title>Chat</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <link rel="stylesheet" href="jquery-mobile/jquery.mobile-1.4.2.min.css" /> -->
   <link rel="stylesheet" type="text/css" href="jquery-mobile/jquery.mobile.structure-1.4.2.min.css">
   
   <!-- Custom theme-->
   <link rel="stylesheet" type="text/css" href="jquery-mobile/themes/custom-theme.css">
   <link rel="stylesheet" type="text/css" href="jquery-mobile/themes/jquery.mobile.icons.min.css">
   <script src="jquery-mobile/jquery-1.11.0.min.js"></script> 
	<script src="jquery-mobile/jquery.mobile-1.4.2.min.js"></script>
	
	<!-- JS & CSS for swipe menu-->
    <script src="js/swipeMenu.js"></script>

    <!-- css for slider menu and back button-->
    <link rel="stylesheet" type="text/css" href="css/customIcon.css">
    <link rel="stylesheet" type="text/css" href="css/pannel.css">
    <style >
		.ui-btn { border: none !important; }    
    </style>
	
  <script src="https://cdn.firebase.com/v0/firebase.js"></script>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
  <link rel="stylesheet" type="text/css" href="css/chat.css">


<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
<style>
    .modal {
    background-color:#fff;
    display:none;
    width:70%;
    height: 40%;
    padding:15px;
    text-align:left;
    font-size: 15px;
    border:2px solid #D8D8D8;

    opacity:0.8;
    -moz-border-radius:6px;
    -webkit-border-radius:6px;
    -moz-box-shadow: 0 0 50px #ccc;
    -webkit-box-shadow: 0 0 50px #ccc;
  }

  .modal h2 {
    background:url(/media/img/global/info.png) 0 50% no-repeat;
    margin:0px;
    padding:10px 0 10px 45px;
    border-bottom:1px solid #333;
    font-size:12px;
  }
  </style>

<script>
$(document).ready(function() {
    var triggers = $(".modalInput").overlay({

      // some mask tweaks suitable for modal dialogs
      mask: {
        color: '#ebecff',
        loadSpeed: 200,
        opacity: 0.9
      },

      closeOnClick: true
  });

    $("#prompt form").submit(function(e) {
  });
  }); 
</script>
<script>
////////////////////////////////////Push Notification////////////////////////////////////////////////////
 <%-- var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/chat");
  var messageIterator = 0;
  chatRef.on('child_added', function(snapshot) {
    var chatData = snapshot.val();
    var from = chatData.from;
    var to = chatData.to;
    var timestamp = chatData.timestamp; 
    var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/" + '<%=username%>' + "/userStatus/");
    //var lastSeen;
    chatRef.on('value', function(snapshot) {
  	  var lastSeen = snapshot.val().last;
  	  //alert(lastSeen);
  	   if(to=='<%=username%>' && (lastSeen<timestamp || status=='unread')){
  			messageIterator++;   
  			//alert("to:" + to + " lastSeen: " + lastSeen + " timestamp: "  + timestamp);
  			document.getElementById('headercount').textContent = messageIterator.toString();
			 document.getElementById('rightPanel').textContent = messageIterator.toString();
  	  }
    });
    //alert(lastSeen);
  }); --%>
  
//////////////////////////////UPDATE USER STATUS (BOTH USERS)////////////////////////////
var user2 = '<%=requestor%>';  
var user1 = '<%=username%>';
currentStatus = "online";
currentStatus2 = "online";
var m_names = new Array("Jan", "Feb", "Mar", 
			"Apr", "May", "Jun", "Jul", "Aug", "Sep", 
			"Oct", "Nov", "Dec");

// Get a reference to the presence data in Firebase.
var user2ListRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/"+user2+"/userStatus");
var user2ListParentRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/"+user2);
var user1ListRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/"+user1+"/userStatus");
var user1ListParentRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/"+user1);

// Get information for user2
user2ListParentRef.on('value',function(snapshot){
	var user2Data = snapshot.val();
	if(snapshot.val()===null){
		alert('User does not exist.');
	}else{
		var user2Gender = user2Data.gender;
		document.getElementById('user2Name').textContent = user2Data.name;
		document.getElementById('positive').textContent = user2Data.positive;
		document.getElementById('neutral').textContent = user2Data.negative;
		document.getElementById('negative').textContent = user2Data.neutral;
		if(user2Gender=='Male'){
			document.getElementById('user2Image').src = "images/male.png";
		}else{
			document.getElementById('user2Image').src = "images/female.png" ;
		}
	}	
});

// Get a reference to my own presence status.
var connectedRef = new Firebase("https://glaring-fire-5132.firebaseio.com/.info/connected");
connectedRef.on("value", function(isOnline) {
  if (isOnline.val()) {
    // If we lose our internet connection, update our last online time.
    user1ListRef.onDisconnect().set({
      status: "offline", name: user1, last: Firebase.ServerValue.TIMESTAMP
    });
    // Set our initial online status.
    setUserStatus("online");
  } else {
    // We need to catch anytime we are marked as offline and then set
    // the correct status. We could be marked as offline 1) on page load
    // or 2) when we lose our internet connection temporarily.
    setUserStatus(currentStatus);
  }
});

// A helper function to let us set our own state.
function setUserStatus(status) {
  // Set our status in the list of online users.
  currentStatus = status;
  user1ListRef.set({ name: user1, status: status });
}

// Update our GUI to show someone"s online status.
user2ListParentRef.on("child_added", function(snapshot) {
  var user = snapshot.val();
  var name = user.name;
  var status = user.status;
  currentStatus2 = status;
  if(name!=null & status!=null){
  	$("#presenceDiv").append($("<div/>").attr("id", snapshot.name()));
      $("#" + snapshot.name()).text(user.name + " is currently " + user.status);
         // If offline, show last time user was online.
         if (user.status == "offline") {  	   
           var ts = user.last;
           var time = new Date(ts);
           var date = time.getDate();
   		var month = time.getMonth();
   		var year = time.getFullYear();
   		var seconds = time.getSeconds();
   		var minutes = time.getMinutes();
   		var hour = time.getHours();
   	    var ls = "last seen at " + hour + ":" + + minutes + " " + date + " " + m_names[month] + " " + year;
           $("#" + snapshot.name()).append($("<br>")).append($("<p>").text(ls));
         }
  }
});

// Update our GUI to remove the status of a user who has left.
user2ListParentRef.on("child_removed", function(snapshot) {
  $("#" + snapshot.name()).remove();
});

// Update our GUI to change a user"s status.
user2ListParentRef.on("child_changed", function(snapshot) {
  var user = snapshot.val();
  currentStatus2 = user.status;
  $("#" + snapshot.name()).text(user.name + " is currently " + user.status);
  if (user.status == "offline") {	
      var ts = user.last;
      var time = new Date(ts);
      var date = time.getDate();
		var month = time.getMonth();
		var year = time.getFullYear();
		var seconds = time.getSeconds();
		var minutes = time.getMinutes();
		var hour = time.getHours();
	    var ls = "last seen at " + hour + ":" + + minutes + " " + date + " " + m_names[month] + " " + year;
      $("#" + snapshot.name()).append($("<br>")).append($("<p>").text(ls));
    }
});

function declineRequest(){
	var r=confirm("You will be removed from the chat window after declining the request. Are you sure you want to decline this request?");
}
</script>
 <style>

#top .ui-grid-c .ui-block-a {
      float: left;
      width: 40%;
}

#top .ui-grid-c .ui-block-b .ui-block-c .ui-block-d  {
      float: left;
      width: 40%;
}
    
    #user2Name {
      font-size:80%;
      text-decoration: none;
      font-weight:bold;
      color:#22AACC;
      
    }
    
#groupbtn {
    font-size: 70%; /* Play with font size of the text */
    
}
#presenceDiv{
	font-size:80%;
	padding:0px;
	margin:0px;
	font-style:italic;
}

    
</style>
</head>
<body>
<!-- Start of view profile page -->
<div data-role="page" id="index" data-add-back-btn="true">

	<div data-role="header" id="header">
  		<% String headerTitle="Chat"; %>
   		<%@ include file="header.jsp" %>
       
	</div><!-- /header -->

	<div data-role="main" class="ui-content">
 <!--  <img src="#" id="user2Image" alt="" />
  <a href="#" class="ui-btn ui-shadow  ui-btn-inline" id="user2Name"></a> -->
  
<!--   <a id="positive"> </a> <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-plus ui-btn-icon-notext ui-btn-inline">Plus</a>
  <a id="neutral"> </a>  <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-check ui-btn-icon-notext ui-btn-inline">Check</a>
  <a id="negative"> </a> <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-inline">Minus</a> -->

    <div class="ui-grid-c" id="top">
	    <div class="ui-block-a"> <img src="#" id="user2Image" alt="" style="width:100%;"/>
	    <a href="#"  id="user2Name"></a>
	    </div>
	    
	    <div class="ui-block-b"><br/><span id="positive"></span><br/><img src="images/plus.png" style="width:40%;" ></div>
	    <div class="ui-block-c"><br/><span id="neutral"></span><br/><img src="images/ok.png" style="width:40%;" ></div>
	    <div class="ui-block-d"><br/><span id="negative"></span><br/><img src="images/minus.png" style="width:40%;" ></div>
</div><!-- /grid-d -->
<hr/>

<fieldset class="ui-grid-b" id="groupbtn">
    <div class="ui-block-a"><input data-icon="delete" type="button"  value="Decline" onclick="declineRequest()"/></div>
    <div class="ui-block-b"><input data-icon="plus" type="button"   value="Add" onclick=""/></div>
     <div class="ui-block-c"> <button class="modalInput" rel="#prompt">Accept</button></div>
</fieldset>

  <!-- <input data-icon="delete" type="button" data-inline="true" value="Decline" onclick="declineRequest()"/>
  <input data-icon="plus" type="button" data-inline="true"  value="Add" onclick=""/>
    
    <button class="modalInput" rel="#prompt">Accept</button> -->
    
<div id="presenceDiv"></div>
<hr/>
<div id='messagesDiv'></div>
<input type='hidden' id='nameInput' value=<%=username%>>
<input type='text' id='messageInput' placeholder='Message...'>
<script>
////////////////////////////RETRIEVE AND UPDATE CHAT DATA///////////////////////////////////////
var m_names = new Array("Jan", "Feb", "Mar", 
		"Apr", "May", "Jun", "Jul", "Aug", "Sep", 
		"Oct", "Nov", "Dec");

  // Get a reference to the root of the chat data.
  var messagesRef = new Firebase('https://glaring-fire-5132.firebaseio.com/chat');

  // When the user presses enter on the message input, write the message to firebase.
  $('#messageInput').keypress(function (e) {
    if (e.keyCode == 13) {
      var from = '<%=username%>';
      var to = '<%=requestor%>';
      var text = $('#messageInput').val();
      var timestamp = new Date().getTime();
      //var messageStatus = 'unread';
      //if(currentStatus2=="online"){
    	//  messageStatus = 'read';
      //}
      messagesRef.push({from:from,to:to, text:text,timestamp:timestamp,status:'unread'});	    
      $('#messageInput').val('');
    }
  });

  // Add a callback that is triggered for each chat message.
  messagesRef.on('child_added', function (snapshot) {
    var message = snapshot.val();
    var from = message.from;
    var to = message.to;
    var status = message.status;
    if(to=='<%=username%>' && from=='<%=requestor%>'&& status=='unread'){
    	 var aMessageRef = new Firebase('https://glaring-fire-5132.firebaseio.com/chat/'+snapshot.name());
    	aMessageRef.child('status').set('read');
    	status = 'read';
    }
    if((to=='<%=username%>' && from=='<%=requestor%>')||
    	(to=='<%=requestor%>' && from=='<%=username%>')){
    	var messageTime = message.timestamp;
        var time = new Date(messageTime);
   		var date = time.getDate();
   		var month = time.getMonth();
   		var year = time.getFullYear();
   		var seconds = time.getSeconds();
   		var minutes = time.getMinutes();
   		var hour = time.getHours();
   		if(from =='<%=username%>'){
   			from = "You";
   		}
   	    var timeString = "("+ (hour<=9 ? '0' + hour : hour) + ":" + + (minutes<=9 ? '0' + minutes : minutes) + " " + date + "-" + m_names[month] + ")";
      	  $('<div id="abc"/>')
      	  //.text(" (" + status + ")").prepend($('<em/>')
      	   .text(message.text)
          .prepend($('<em/>').text(from+': '))
          .prepend($('<em/>').text(timeString + " "))
            .appendTo($('#messagesDiv'));
          $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
    }
  });
</script>
<div class="modal" id="prompt">
  <h2>Congratulations!</h2>
 <p>You have successfully selected <%=requestorName %> to share the cab</p>  	
    <a href="fareshare.jsp?username=<%=username%>" class="ui-btn">Split the Bill Now</a>
    <button type="button" class="close">Cancel</button>
      <p><font color="red"><a id="sendRequestError"> </a> </font></p>
  <br>
</div>
<div id="exposeMask" style="position: absolute; 
top: 0px; left: 0px; width: 1272px; height: 302px; display: none; opacity: 0.9;
 z-index: 9998; background-color: rgb(235, 236, 255);"></div>

	</div>
	<!-- /content -->

	
	<%@ include file="pannel.jsp" %>
</div><!-- /page -->


</body>
</html>