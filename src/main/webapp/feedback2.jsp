<%
String username = request.getParameter("username");
String user2 = "Jason Lim";
if(username.equals("jason_lim")){
	user2 = "Marie Wong";
}
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
    border:2px solid #333;

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
	



</head>
<body >



<!-- Start of view profile page -->
<div data-role="page" id="profile" >

	<div data-role="header" id="header">
		<% String headerTitle="View Profile"; %>
   		<%@ include file="header.jsp" %>	
      
	</div><!-- /header -->

	<div data-role="main" class="ui-content">
     <div class="ui-grid-a">
      <div class="ui-block-a">
       
          Give rating for :
      </div> <!-- block a-->
      
       <div class="ui-block-b">
        <form>
            <fieldset data-role="controlgroup" data-type="horizontal" >
                
                
                <label for="select-native-16">Select User</label>
                <select name="select-native-16" id="select-native-16">
                    <option value="#"><%=user2 %></option>
                    
                </select>
            </fieldset>
        </form>
       </div> <!-- block b-->
    </div><!-- grid -->
	  
      
	  <p>Click on the icon to give rating to your cab-sharer(s)</p>
	  
	  <div class="ui-grid-b">
	    <div class="ui-block-a">Positive</div>
	    <div class="ui-block-b">Neutral</div>
	    <div class="ui-block-c">Negative</div>
	    
	    <div class="ui-block-a"><img alt="" src="images/plus.png"></div>
	    <div class="ui-block-b"><img alt="" src="images/ok.png"></div>
	    <div class="ui-block-c"><img alt="" src="images/minus.png"></div>
	</div>
      
 
    
    <p><strong>Comments:</strong></p>
    <label for="textarea">Textarea:</label>
<textarea cols="40" rows="30" name="textarea" id="textarea" placeholder="(optional)"></textarea>


<button class="modalInput" rel="#prompt" >Submit</button> 

         
  
    
    
    


		
    
	</div> <!-- /content -->
	
	

<!-- Modal -->
<div class="modal" id="prompt">
  <h2>Confirmation</h2>
 <p>Please click OK to confirm submiting your feedback</p>

  <form id="sendRequestForm" class="modalForm" onsubmit="sendRequest();return false;" >
    <button class="modalInput" rel="#prompt2">OK</button>	
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