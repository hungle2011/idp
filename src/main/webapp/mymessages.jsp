<%
String username = request.getParameter("username");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Notifications</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="stylesheet" href="jquery-mobile/jquery.mobile-1.4.2.min.css" /> -->
   <link rel="stylesheet" type="text/css" href="jquery-mobile/jquery.mobile.structure-1.4.2.min.css">
   <!-- Custom theme-->
   <link rel="stylesheet" type="text/css" href="jquery-mobile/themes/custom-theme.css">
   <link rel="stylesheet" type="text/css" href="jquery-mobile/themes/jquery.mobile.icons.min.css">
	  <script src="jquery-mobile/jquery-1.11.0.min.js"></script> 
	<script src="jquery-mobile/jquery.mobile-1.4.2.min.js"></script>

    <link rel="stylesheet" type="text/css" href="jquery-mobile/demos/_assets/css/jqm-demos.css">
	
	<script src="jquery-mobile/demos/js/jquery.js"></script>
	<script src="jquery-mobile/demos/_assets/js/index.js"></script>
    <!-- JS & CSS for swipe menu-->
    <script src="js/swipeMenu.js"></script>

    <!-- css for slider menu and back button-->
    <link rel="stylesheet" type="text/css" href="css/customIcon.css">
    <link rel="stylesheet" type="text/css" href="css/pannel.css">
    <style >
	.ui-btn { border: none !important; }
        
    </style>
    <style>
.ui-block-a, 
.ui-block-b, 
.ui-block-c 
{
background-color: #ffffff;

}
</style>

<script src="https://cdn.firebase.com/v0/firebase.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  <script src="https://www.firebase.com/js/libs/idle.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
  <script>
  
  var m_names = new Array("Jan", "Feb", "Mar", 
		"Apr", "May", "Jun", "Jul", "Aug", "Sep", 
		"Oct", "Nov", "Dec");
  var usernames = ["jason_lim","linda_chew","john_luke","joel_fong","anna_smith",
                "bryan_tan","robert_yiu","johnathan_song","justin_lee","marie_wong"];
  var users = [ "Jason Lim", "Linda Chew","John Luke","Joel Fong","Anna Smith",  
                "Bryan Tan","Robert Yiu","Johnthan Song","Justin Lee","Marie Wong"];
  var genders =  [	"He","She","He","He","She", "He","He","He","He","She"];
  var positives = new Array();
  var neutrals = new Array();
  var negatives = new Array();
  
  positives[0]=22;
  positives[1]=29;
  positives[2]=12;
  positives[3]=10;
  positives[4]=20;
  positives[5]=12;
  positives[6]=4;
  positives[7]=13;
  positives[8]=9;
  positives[9]=19;

  neutrals[0]=2;
  neutrals[1]=1;
  neutrals[2]=3;
  neutrals[3]=11;
  neutrals[4]=10;
  neutrals[5]=3;
  neutrals[6]=11;
  neutrals[7]=1;
  neutrals[8]=12;
  neutrals[9]=3;
  
  negatives[0]=0;
  negatives[1]=0;
  negatives[2]=5;
  negatives[3]=3;
  negatives[4]=4;
  negatives[5]=18;
  negatives[6]=2;
  negatives[7]=1;
  negatives[8]=2;
  negatives[1]=1;
  
////////////////////////////////////Push Notification////////////////////////////////////////////////////
  <%-- var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/chat");
  var messageIterator = 0;
  chatRef.on('child_added', function(snapshot) {
    var chatData = snapshot.val();
    var from = chatData.from;
    var to = chatData.to;
    var timestamp = chatData.timestamp; 
    var status = chatData.status;
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
  });
   --%>
////////////////////////////////////Unread Messages////////////////////////////////////////////////////
  var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/chat");
  var messageIterators = new Array();
  messageIterators[0] = 0;
  messageIterators[1] = 0;
  messageIterators[2] = 0;
  messageIterators[3] = 0;
  messageIterators[4] = 0;
  messageIterators[5] = 0;
  messageIterators[6] = 0;
  messageIterators[7] = 0;
  messageIterators[8] = 0;
  messageIterators[9] = 0;
  chatRef.on('child_added', function(snapshot) {
    var chatData = snapshot.val();
    var from = chatData.from;
    var to = chatData.to;
    var messageStr = chatData.text;
    var timestamp = chatData.timestamp; 
    var status = chatData.status;
    var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/" + '<%=username%>' + "/userStatus/");
    //var lastSeen;
    chatRef.on('value', function(snapshot) {
  	  var lastSeen = snapshot.val().last;
  	  for (var i=0;i<10;i++){
  		  if(usernames[i] != '<%=username%>'){
  			if(to=='<%=username%>' && from==usernames[i])
  		  	  {
		  		  	if(lastSeen<timestamp || status=='unread'){
		  		  	messageIterators[i] ++;
		  			}
	  			   var ni = document.getElementById(usernames[i]);
	  			   
	  			 ni.innerHTML ='<div class="ui-grid-a" id="mainProfile">'+
				   '<div class="ui-block-a" id="mainA">'+
				    	'<h3>'+ users[i] +':</h3>'+ 
				    	'<p>'+messageStr+'</p>'+
				    	'<p>'+formatTimeStr(timestamp)+'</p>'+
				    	'<a data-ajax="false" href="chat.jsp?username='+ '<%=username%>'+
				    			'&requestor='+usernames[i]+'">'+
				    			messageIterators[i].toString() +' new message(s)</a>'+
				    '</div>'+
				    '<div class="ui-block-b" id="mainA">'+
					    '<p><img src="images/'+ genders[i]+'.png" style="width:90%;" ></p>'+
					    '<div class="ui-grid-b" id="rating">'+
						    '<div class="ui-block-a">'+
						    positives[i]+'<img src="images/plus.png" style="width:90%;" >'+
						    '</div>'+
						    '<div class="ui-block-b">'+
						    neutrals[i]+'<img src="images/ok.png" style="width:90%;" >'+
						    '</div>'+
						    '<div class="ui-block-c">'+
						    negatives[i]+'<img src="images/minus.png" style="width:90%;" >'+
						    '</div>'+
						'</div>'+
				    '</div>'+
				'</div>';  
	  			   
	  			   
	  			   
	  				<%--  ni.innerHTML = '<h3>' + users[i] + ':</h3>'+ 
				    "<p>"+ messageStr + "</p>"+
				    "<p>"+ formatTimeStr(timestamp) + "</p>"+
				    '<a data-ajax="false" href="chat.jsp?username=' + '<%=username%>'+
				    '&requestor=' + usernames[i] + '">'+
				    messageIterators[i].toString() +' new message(s)</a>'+ "<br/>"+
				    genders[i] + " has " + 
				    positives[i] + " positive comments " + 
				    neutrals[i] + " neutral comments " + 
				    negatives[i] + " negative comments " + 
	  				 "<hr>";	   --%>
  		  	  }
  		  }
  	  }
  	  /**if((to=="marie_wong" && from=="jason_lim")||
  			(from=="marie_wong" && to=="jason_lim"))
  	  {
  		  	if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorJason ++;
  			}
  			   var ni = document.getElementById('jason');
  				 ni.innerHTML = '<h3>Jason Lim:</h3>'+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=jason_lim">'+
			    messageIteratorJason.toString() +' new message(s)</a>'+
  				 "<hr>";	  
  	  }
  			
  	if(to=="marie_wong" && from=="joel_fong"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorJoel ++;
  		  	}
  			   var ni = document.getElementById('joel');
  				 ni.innerHTML = "<h3>Joel Fong:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=joel_fong">'+
			    messageIteratorJoel.toString() +' new message(s)</a>'+
  				 "<hr>";  
	  }
  	if(to=="marie_wong" && from=="linda_chew"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorLinda ++;
  		  	}
  			   var ni = document.getElementById('linda');
  				 ni.innerHTML = "<h3>Linda Chew:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=linda_chew>'+
			    messageIteratorLinda.toString() +' new message(s)</a>'+
  				 "<hr>";	  
	  }
  	if(to=="marie_wong" && from=="john_luke"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorJohn ++;
  		  	}
  			   var ni = document.getElementById('john');
  				 ni.innerHTML = "<h3>John Luke:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=john_luke">'+
			    messageIteratorJohn.toString() +' new message(s)</a>'+
  				 "<hr>"; 
	  }
  	if(to=="marie_wong" && from=="anna_smith"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorAnna ++;
  		  	}
  			   var ni = document.getElementById('anna');
  				 ni.innerHTML = "<h3>Anna:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=anna_smith">'+
			    messageIteratorAnna.toString() +' new message(s)</a>'+
  				 "<hr>";	  
	  }
  	if(to=="marie_wong"  && from=="bryan_tan"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorBryan ++;
  		  	}
  			   var ni = document.getElementById('bryan');
  				 ni.innerHTML = "<h3>Bryan Tan:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=bryan_tan">'+
			    messageIteratorBryan.toString() +' new message(s)</a>'+
  				 "<hr>";	  
	  }
  	if(to=="marie_wong"  && from=="robert_yiu"){
  		if(lastSeen<timestamp || status=='unread'){
  				messageIteratorRobert ++;
  		  	}
  			   var ni = document.getElementById('robert');
  				 ni.innerHTML = "<h3>Robert Yiu:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=robert_yiu">'+
			    messageIteratorRobert.toString() +' new message(s)</a>'+
  				 "<hr>";  
	  }
  	if(to=="marie_wong" && from=="johnathan_song"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorJohnathan ++;
  		  	}
  			   var ni = document.getElementById('johnathan');
  				 ni.innerHTML = "<h3>Johnathan Song:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=johnathan_song">'+
			    messageIteratorJohnathan.toString() +' new message(s)</a>'+
  				 "<hr>";	  
	  }
  	if(to=="marie_wong" && from=="justin_lee"){
  		if(lastSeen<timestamp || status=='unread'){
  		  	messageIteratorJustin ++;
  		  	}
  			   var ni = document.getElementById('justin');
  				 ni.innerHTML = "<h3>Justin Lee:</h3>"+ 
			    "<p>"+ messageStr + "</p>"+
			    "<p>"+ formatTimeStr(timestamp) + "</p>"+
			    '<a data-ajax="false" href="chat.jsp?username=marie_wong&requestor=justin_lee">'+
			    messageIteratorJustin.toString() +' new message(s)</a>'+
  				 "<hr>";	  
	  }*/
  	
    });
    //alert(lastSeen);
  });
  
  function formatTimeStr(timestamp){
	  var time = new Date(timestamp);
		 var date = time.getDate();
		var month = time.getMonth();
		var year = time.getFullYear();
		var seconds = time.getSeconds();
		var minutes = time.getMinutes();
		var hour = time.getHours();
		var timeStr = "(" + (hour<=9 ? '0' + hour : hour) + ":" + (minutes<=9 ? '0' + minutes : minutes) + " " + date + "-" + m_names[month] + "-" + year + ")";
  		return timeStr;
  }
  
	
  
  </script>
  <style>
#mainProfile.ui-grid-a #mainA.ui-block-a {
      float: left;
      width: 70%;
    }
#mainProfile.ui-grid-a #mainA.ui-block-b {
      float: left;
      width: 30%;
    }
    
    .ui-grid-a{border-bottom:1px solid ; border-color:#A4A4A4;}
 #rating{font-size:15px;text-align:center;}
</style>

<style>
a:link {text-decoration:none;color:#22AACC;}
</style>
</head>
<body>

<!-- Start of second page -->
<div data-role="page" id="index" data-add-back-btn="true">

	<div data-role="header">
  		<% String headerTitle="My Messages"; %>
   		<%@ include file="header.jsp" %>
       
	</div><!-- /header -->

	<div role="main" class="ui-content">
 <b>Messages:</b>
	<div id="messages">
		<div id="jason_lim"></div>
		<div id="marie_wong"></div>	
		<div id="anna_smith"></div>
		<div id="bryan_tan"></div>
		<div id="joel_fong"></div>
		<div id="john_luke"></div>
		<div id="johnathan_song"></div>
		<div id="justin_lee"></div>
		<div id="linda_chew"></div>
		<div id="robert_yiu"></div>
	</div>
   
    
	</div><!-- /content -->
    
   
	<%@ include file="pannel.jsp" %>
</div><!-- /page -->


</body>
</html>