<%
String username=request.getParameter("username");
String requestor = request.getParameter("requestor");
String requestorName = request.getParameter("requestorName");
String destination = request.getParameter("destination");
String requestSent = request.getParameter("requestSent");
String gender = request.getParameter("gender");
String distance = request.getParameter("distance");
%>
<!DOCTYPE html>
<html>
<head>
	<title>View Profile</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">

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
    
    <!--  -->
  <script src="https://cdn.firebase.com/v0/firebase.js"></script>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
  <style>
    .modal {
    background-color:#fff;
    display:none;
    width:70%;
    height: 60%;
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
			document.getElementById('headercount').textContent = messageIterator.toString();
			 document.getElementById('rightPanel').textContent = messageIterator.toString();
	  }
  });
  //alert(lastSeen);
}); --%>

///////////////////////////INITIALIZE DATA//////////////////////////////
function initialize(){
	var userUrl = 'https://glaring-fire-5132.firebaseio.com/users/'+'<%=requestor%>';
	var userRef = new Firebase(userUrl);
	userRef.on('value', function(snapshot) {
	  if(snapshot.val() === null) {
	    alert('User does not exist.');
	  } else {
	    var gender = snapshot.val().gender;
	    var email = snapshot.val().email;
	    var name = snapshot.val().name;
	    var occupation = snapshot.val().occupation;
	    var phoneNumber = snapshot.val().phoneNumber;
	    var positive = snapshot.val().positive;
	    var neutral = snapshot.val().neutral;
	    var negative = snapshot.val().negative;
	    document.getElementById('email').textContent = email;
	    document.getElementById('gender').textContent = gender;
	    document.getElementById('name').textContent = name;
	    document.getElementById('occupation').textContent = occupation;
	    document.getElementById('phoneNumber').textContent = phoneNumber;
	    document.getElementById('positive').textContent = positive;
	    document.getElementById('neutral').textContent = neutral;
	    document.getElementById('negative').textContent = negative;
	  }
	});
	
	var ratingUrl = 'https://glaring-fire-5132.firebaseio.com/users/';
	ratingUrl += '<%=requestor%>';
	ratingUrl += '/rating';
	var ratingRef = new Firebase(ratingUrl);
	ratingRef.startAt().limit(1).on('child_added', function(snapshot) {
	  var ratingData = snapshot.val();
	  document.getElementById('reviewer1').textContent=ratingData.from;
	  document.getElementById('comment1').textContent=ratingData.text;
	  document.getElementById('rating1').textContent=ratingData.rating;
	  
	});
	ratingRef.startAt().limit(2).on('child_added', function(snapshot) {
		  var ratingData = snapshot.val();
		  document.getElementById('reviewer2').textContent=ratingData.from;
		  document.getElementById('comment2').textContent=ratingData.text;
		  document.getElementById('rating2').textContent=ratingData.rating;
		  
	});
	ratingRef.startAt().limit(3).on('child_added', function(snapshot) {
		  var ratingData = snapshot.val();
		  document.getElementById('reviewer3').textContent=ratingData.from;
		  document.getElementById('comment3').textContent=ratingData.text;
		  document.getElementById('rating3').textContent=ratingData.rating;
	});
}
	
	

function sendRequest(){
	var message = document.getElementById("requestMessage").value;
	if (message!=null&&message.trim()!=""){
		var chatRef = new Firebase('https://glaring-fire-5132.firebaseio.com/chat');
		var timestamp = new Date().getTime();
   	    chatRef.push({from:'<%=username%>',to:'<%=requestor%>',text:message,timestamp:timestamp,status:'unread'});
   	    alert("Your request was successfully sent");
   	    window.location.href="viewprofile.jsp?username=<%=username%>&requestor=<%=requestor%>&requestorName=<%=requestorName %>&destination=<%=destination%>&requestSent=true"; 
   	    return false;
	}else{
		  document.getElementById("sendRequestError").textContent="Request message cannot be empty! Please try again";
	}
}
	

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
	
<style>
 .ui-grid-a .ui-block-a {
      float: left;
      width: 60%;
    }
    .ui-grid-a .ui-block-b {
      float: left;
      width: 40%;
    }
</style>

<style>
.ui-btn-icon-notext.ui-corner-all {
	background-color:#FFFFFF;
	
}
</style>


<style>

	#personalInfo.ui-grid-a .ui-block-a {
	      float: left;
	      width: 40%;
	      
	      font-weight:bold;
	      font-size:70%;
	    }
	#personalInfo.ui-grid-a .ui-block-b {
	      float: left;
	       
	      width:55%;
	      font-size:80%;
	    }
</style>

<style>
	#rating.ui-grid-b .ui-block-a {
	      float: left;
	      width: 20%;
	      font-weight:bold;
	      font-size:12px;
	    }
	#rating.ui-grid-b .ui-block-b {
	      float: left;
	      width:60%;
	      
	      padding: 2%;
	      margin-top:3%;
	      background-color:#D8D8D8;
	      text-align:center;
			
			border-radius: 43px 43px 43px 43px;
-moz-border-radius: 43px 43px 43px 43px;
-webkit-border-radius: 43px 43px 43px 43px;
border: 1px solid #D8D8D8;
	      
	      
	    }
	 #rating.ui-grid-b .ui-block-c {
	      float: left;
	      width:20%;
	      font-size:15px;
	    }   
  

</style>

<style>
.ui-content{
width:90%;
display: block;
margin-left:auto;
margin-right:auto;
}

</style>
<style>
#two{
	width:100%;
	margin-right:0px;
	margin-left:0px;
}

#avata{
	width:60%;
}
</style>
<style>

#ratingNo{
	display:block;
	margin-left:12%;
	margin-right:auto;
	font-weight:bold;
	
}
.ui-navbar {
	width: 100%;
}
.ui-navbar li #personalStyle.ui-btn {
	font-size: 12px;
	display: block;
	margin: 0;
	border-right-width: 0;
	width:95px;
	overflow: hidden;
	white-space: nowrap;	
	border-radius: 78px 78px 78px 78px;
-moz-border-radius: 78px 78px 78px 78px;
-webkit-border-radius: 78px 78px 78px 78px;
border: 0px solid #000000;
}

.ui-navbar li #commentStyle.ui-btn {
	font-size: 12px;
	display: block;
	margin-right: auto;
	margin-left: auto;
	border-right-width: 0;
	width:95px;
	overflow: hidden;
	white-space: nowrap;	
	
	border-radius: 78px 78px 78px 78px;
-moz-border-radius: 78px 78px 78px 78px;
-webkit-border-radius: 78px 78px 78px 78px;
border: 0px solid #000000;
}

.modalInput{
	font-size: 12.5px;
	display: block;
	margin: 0;
	padding: 10px 5px 10px 5px;
	border-right-width: 0;
	width:50%;
	
}

#ratingIcon{
	margin:2%;
}
#comment1,#reviewer1,#comment2,#reviewer2{
	font-size:70%;	
}


</style>
</head>
<body onload="initialize()">



<!-- Start of view profile page -->
<div data-role="page" id="profile" >

	<div data-role="header" id="header">
		<% String headerTitle="View Profile"; %>
   		<%@ include file="header.jsp" %>	
      
	</div><!-- /header -->

	<div data-role="main" class="ui-content">
    <div class="ui-grid-a">
      
      
      <div class="ui-block-a" style="border:0px;">
          
        <p><%=requestorName%> is heading to</p>
        <p><strong><%=destination%></strong></p>
        <p>He is within 50m from your location</p>
        
       <!--  <a href="request.html" class="ui-shadow ui-btn ui-corner-all ui-btn-inline" data-transition="pop" >Send Request</a>-->
         <%if(requestSent==null){ %>
	<p>
   <button class="modalInput" data-mini="true" rel="#prompt" id="sendRequest" >Send Request</button> 
</p>

	
<%}else{ %>
	<font color="red">Request Sent!</font>
<%} %>
      </div>
      <div class="ui-block-b" >
          <p><img src="images/male.png" ></p>
          <div class="ui-nodisc-icon ui-alt-icon"><!-- Classes added to the wrapper -->

</div>

         
      </div> <!-- block b -->
    </div> <!-- grid a -->
    <!-- Rating -->
    
    
    
 <div class="ui-grid-b">
    <div class="ui-block-a"><div id="ratingNo"><span id="positive"></span></div></div>
    <div class="ui-block-b"><div id="ratingNo"><span id="neutral"></span></div></div>
    <div class="ui-block-c"><div id="ratingNo"><span id="negative"></span></div></div>
    <div class="ui-block-a"><img src="images/plus.png" style="width:40%;" ></div>
    <div class="ui-block-b"><img src="images/ok.png" style="width:40%;" ></div>
    <div class="ui-block-c"><img src="images/minus.png" style="width:40%;" ></div>
    
</div><!-- /grid-c -->

		<div data-role="tabs" >
		  <div data-role="navbar" class="navtab">
		    <ul>
		      <li><a href="#one" data-ajax="false" class="ui-btn-active" id="personalStyle">Personal Info</a></li>
		      <li><a href="#two" data-ajax="false" class="ui-btn" id="commentStyle">&nbsp;Comments &nbsp;&nbsp;</a></li>
		      
		    </ul>
		  </div>
		  <div id="one" class="ui-body-d ui-content">
		    <p> <h3 id="name"></h3> </p>
		
		    <div class="ui-grid-a" id="personalInfo">
			    <div class="ui-block-a">Occupation: </div>
			    <div class="ui-block-b" id="occupation" ></div>
			    <div class="ui-block-a">Gender:</div>
			    <div class="ui-block-b" id="gender"></div>
			    <div class="ui-block-a"> Email:</div>
			    <div class="ui-block-b" id="email"></div>
			    <div class="ui-block-a"> Phone Number:</div>
			    <div class="ui-block-b" id="phoneNumber"></div>
			</div><!-- /grid-a -->
		  </div>
		  <div id="two" class="ui-body-d ui-content">
		  
			
			
			<div class="ui-grid-b" id="rating">
				<!-- Comment 1 -->
			    <div class="ui-block-a" ><img src="images/He.png" id="avata"><div id="reviewer1">:</div></div>
			    <div class="ui-block-b" ><div id="comment1"></div></div>
			    <div class="ui-block-c" ><br/><img src="images/plus.png" style="width:50%;" id="ratingIcon"></div>
			   
			    <!-- Comment 2 -->
			    <div class="ui-block-a" ><img src="images/He.png" id="avata"><div id="reviewer2">:</div></div>
			    <div class="ui-block-b" ><div id="comment2"></div></div>
			    <div class="ui-block-c" ><br/><img src="images/minus.png" style="width:50%;" id="ratingIcon"></div>
			    
			   
			</div><!-- /grid-b -->
		  </div>
		</div> <!-- End tab -->



    
    
	</div> <!-- /content -->
	
	

<!-- Modal -->
<div class="modal" id="prompt">
  <h2>Send Request</h2>
 <p>You are about to send this user a share request.Click OK to confirm</p>

  <form id="sendRequestForm" class="modalForm" onsubmit="sendRequest();return false;" >
  	<textarea rows="10" cols="40" id="requestMessage">Hi <%=requestorName%>, I would like to share the cab with you</textarea>
    <br/>
    <button type="submit">Send</button>
    <button type="button" class="close">Cancel</button>
  </form>
      <p><font color="red"><a id="sendRequestError"> </a> </font></p>
  <br>
</div>

<div id="exposeMask" style="position: absolute; 
top: 0px; left: 0px; width: 1272px; height: 302px; display: none; opacity: 0.9;
 z-index: 9998; background-color: rgb(235, 236, 255);"></div>
	

	<%@ include file="pannel.jsp" %>
</div><!-- /page -->


</body>
</html>