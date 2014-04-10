<%@page import="java.util.*"%>
<%
String username=request.getParameter("username");
double latitude=Double.parseDouble(request.getParameter("latitude"));
double longitude=Double.parseDouble(request.getParameter("longitude"));
String requestor = "jason_lim";
String requestorName = "Jason Lim";
if(username.equals("jason_lim")){
	requestor = "marie_wong";
	requestorName = "Marie Wong";
}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>List View</title>

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
    
    <!--libraries for functions-->
     <script src="https://cdn.firebase.com/v0/firebase.js"></script>
     <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
   <script>
   
   var lat = <%=latitude%>;
   var lng = <%=longitude%>;
   var username = '<%=username%>';
   //var centerPoint = new google.maps.LatLng(lat,lng);
   var users;
   var usernames;
   var usersGender;
   var destinations;
   var positives = new Array();
   var neutrals = new Array();
   var negatives = new Array();
   var latitudes = new Array();
   var longitudes = new Array();
   var neighborhoods;

   if(username=="marie_wong"){
   users = [ "Jason Lim", "Linda Chew","John Luke","Joel Fong","Anna Smith",  
            "Bryan Tan","Robert Yiu","Johnthan Song","Justin Lee"];
   usernames = [ "jason_lim","linda_chew","john_luke","joel_fong","anna_smith",
                "bryan_tan","robert_yiu","johnathan_song","justin_lee"];
   usersGender = [	"He","She","He","He","She",             
              	"He","He","He","He"];
   destinations=[  "Changi Business Park",
                   "Ang Mo Kio Street 22",
                   "21 Lower Kent Ridge Road",
                   "Pasir Ris Street 21",
                   "Singapore Management University-Li Ka Shing Library Singapore",
                 "starbucks VivoCity Singapore",
                 "Plaza Singapura Orchard Road Singapore",
                 "35A Duxton Road Singapore",
                 "51 Sims Drive Singapore"];
   positives[0]=22;
   positives[1]=29;
   positives[2]=12;
   positives[3]=10;
   positives[4]=20;
   positives[5]=12;
   positives[6]=4;
   positives[7]=13;
   positives[8]=9;

   neutrals[0]=2;
   neutrals[1]=1;
   neutrals[2]=3;
   neutrals[3]=11;
   neutrals[4]=10;
   neutrals[5]=3;
   neutrals[6]=11;
   neutrals[7]=1;
   neutrals[8]=12;

   negatives[0]=0;
   negatives[1]=0;
   negatives[2]=5;
   negatives[3]=3;
   negatives[4]=4;
   negatives[5]=18;
   negatives[6]=2;
   negatives[7]=1;
   negatives[8]=2;

   latitudes[0]=1.43675;
   latitudes[1]=1.43792;
   latitudes[2]=1.43877;
   latitudes[3]=1.43598;
   latitudes[4]=1.43566;
   latitudes[5]=1.43479;
   latitudes[6]=1.43563;
   latitudes[7]=1.43455;
   latitudes[8]=1.44017;

   longitudes[0]=103.78974;
   longitudes[1]=103.79074;
   longitudes[2]=103.78928;
   longitudes[3]=103.78953;
   longitudes[4]=103.78943;
   longitudes[5]=103.78952;
   longitudes[6]=103.79166;
   longitudes[7]=103.78658;
   longitudes[8]=103.78789;
   }
   
   if(username=="jason_lim"){
   	users = [ "Marie Wong", "Joel Fong","Anna Smith","Linda Chew", "Bryan Tan",
   	          "John Luke", "Robert Yiu","Johnthan Song","Justin Lee"];
   	usernames = [ "marie_wong","joel_fong","anna_smith","linda_chew","bryan_tan",
   	              "john_luke","robert_yiu","johnathan_song","justin_lee"];
   	usersGender = [	"She","He","She","She","He",             
   	           	"He","He","He","He"];
   	destinations=[  "Changi Business Park","Ang Mo Kio Street 22","21 Lower Kent Ridge Road","Pasir Ris Street 21","Singapore Management University-Li Ka Shing Library Singapore",
   	                "starbucks VivoCity Singapore","Plaza Singapura Orchard Road Singapore","35A Duxton Road Singapore","51 Sims Drive Singapore"];
   	destinations=[  "Changi Business Park",
   	                "Pasir Ris Street 21",
   	                "Singapore Management University-Li Ka Shing Library Singapore",
   	                "Ang Mo Kio Street 22",
   	                "starbucks VivoCity Singapore",
   	                "21 Lower Kent Ridge Road",
   	                "Plaza Singapura Orchard Road Singapore",
   	                "35A Duxton Road Singapore",
   	                "51 Sims Drive Singapore"];
   	positives[0]=19;
   	positives[1]=10;
   	positives[2]=20;
   	positives[3]=29;
   	positives[4]=12;
   	positives[5]=12;
   	positives[6]=4;
   	positives[7]=13;
   	positives[8]=9;

   	neutrals[0]=3;
   	neutrals[1]=11;
   	neutrals[2]=10;
   	neutrals[3]=1;
   	neutrals[4]=3;
   	neutrals[5]=3;
   	neutrals[6]=11;
   	neutrals[7]=1;
   	neutrals[8]=12;

   	negatives[0]=1;
   	negatives[1]=3;
   	negatives[2]=4;
   	negatives[3]=0;
   	negatives[4]=18;
   	negatives[5]=5;
   	negatives[6]=2;
   	negatives[7]=1;
   	negatives[8]=2;

   	latitudes[0]=1.437537;
   	latitudes[1]=1.43598;
   	latitudes[2]=1.43566;
   	latitudes[3]=1.43792;
   	latitudes[4]=1.43479;
   	latitudes[5]=1.43877;
   	latitudes[6]=1.43563;
   	latitudes[7]=1.43455;
   	latitudes[8]=1.44017;

   	longitudes[0]=103.7896099999993;
   	longitudes[1]=103.78953;
   	longitudes[2]=103.78943;
   	longitudes[3]=103.79074;
   	longitudes[4]=103.78952;
   	longitudes[5]=103.78928;
   	longitudes[6]=103.79166;
   	longitudes[7]=103.78658;
   	longitudes[8]=103.78789;

 
   }

   var markers = [];
   var iterator = 0;
   var map;
   var distanceFilter = 500;
  
////////////////////////////////////Push Notification////////////////////////////////////////////////////
  <%-- var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/chat");
  var messageIterator = 0;
  chatRef.on('child_added', function(snapshot) {
    var chatData = snapshot.val();
    var from = chatData.from;
    var to = chatData.to;
    var timestamp = chatData.timestamp; 
    var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/users/" +'<%=username%>' + "/userStatus/");
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
/////////////////////////////////Update Distance Filter/////////////////////////////////////
  
  function updateDistanceFilter(){
		var distance = document.getElementById("rangeInput").value;
		if(distance==null || distance==""){
			distanceFilter=500;
		}else{
			distanceFilter = distance;	
		}
		
		//for (var i = 0; i < markers.length; i++) {
		  //  markers[i].setMap(null);
		  //} 
		var el = document.getElementById('myDiv');
		while ( el.firstChild ) el.removeChild( el.firstChild );
		initialize(distanceFilter);
		
	}
   
  function distance(lat1, lon1, lat2, lon2, unit) {
		var radlat1 = Math.PI * lat1/180;
		var radlat2 = Math.PI * lat2/180;
		var radlon1 = Math.PI * lon1/180;
		var radlon2 = Math.PI * lon2/180;
		var theta = lon1-lon2;
		var radtheta = Math.PI * theta/180;
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
		dist = Math.acos(dist);
		dist = dist * 180/Math.PI;
		dist = dist * 60 * 1.1515;
		if (unit=="K") { dist = dist * 1.609344; }
		if (unit=="M") { dist = dist * 1.609344 * 1000; }
		if (unit=="N") { dist = dist * 0.8684; }
		return Math.round(dist);
	} 
 
   
  function initialize(distanceFilter){
	  for(var i=0;i<9;i++){
		  var distance1 = distance(lat, lng,latitudes[i],longitudes[i],"M");
		  if(distance1 <=distanceFilter){
			  var ni = document.getElementById('myDiv');
			  var newdiv = document.createElement('div');
			  var divIdName = 'my'+i+'Div';
			  newdiv.setAttribute('id','div' + i);
			  newdiv.innerHTML = '<div class="ui-grid-a" id="mainProfile">'+
			    '<div class="ui-block-a" id="mainA">'+
			    	'<p>'+users[i] +' is heading to'+'</p>'+
			    	'<p><h3>'+destinations[i] +'</h3></p>'+
			    	'<p>'+usersGender[i]+' is within '+distance1 +'m from your location</p>'+ 
			    	
			    	 '<a data-ajax="false" href="viewprofile.jsp?username=<%=username%>'+ 
			    			 '&requestor=' + usernames[i] + 
			    			 '&requestorName=' + users[i] + 
			    			 '&destination='+ destinations[i] + 
			    			 '&distance='+ distance1 + 
			    			 '&gender='+ usersGender[i] + '">View Profile</a>'+
			    	' &nbsp; <a href="#popupDialog" data-rel="popup" data-position-to="window" data-transition="pop" >Send Request </a>'+
				 '</div>'+
				 '<div class="ui-block-b" id="mainA">'+
				    '<p><img src="images/'+usersGender[i]+'.png" style="width:90%;" ></p>'+
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
			  ni.appendChild(newdiv); 
		  }
		  
	  }
  }

  
//////////////////////////////////////SEND REQUEST///////////////////////////////////////////////
  function sendRequest(){
  	var message = document.getElementById("requestMessage").value;
  	if (message!=null&&message.trim()!=""){
  		var chatRef = new Firebase('https://glaring-fire-5132.firebaseio.com/chat');
  		var timestamp = new Date().getTime();
     	    chatRef.push({from:'<%=username%>',to:'<%=requestor%>',text:message,timestamp:timestamp,status:'unread'});
     	    alert("Your request was successfully sent");
     	    window.location.href="list.jsp?username=<%=username%>&latitude=<%=latitude%>&longitude=<%=longitude%>"; 
     	    return false;
  	}else{
  		  document.getElementById("sendRequestError").textContent="Request message cannot be empty! Please try again";
  	}
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

<style>
#footer .ui-btn{
	font-family: Comic Sans MS; 
	font-weight: bold;
	font-size: 15px;
}
</style>
  </head>
  <body onload="initialize(500)">
  <!-- Start of list view page -->
<div data-role="page" id="list">

	<div data-role="header">
		<% String headerTitle="List View"; %>
   		<%@ include file="header.jsp" %>	

	</div><!-- /header -->

	<div data-role="main" class="ui-content">
	
    	
	<form oninput="amount.value=rangeInput.value">
Search Within(metre)
<input type="range" id="rangeInput" data-show-value="true" name="rangeInput" min="0" max="1000" value="500" onchange="updateDistanceFilter()" data-highlight="true">
    
</form>
	
<div id="myDiv"> </div>

<div data-role="popup" id="popupDialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
    <div data-role="header" data-theme="a" id="header">
    <h1>Send Request</h1>
    </div>
    <div role="main" class="ui-content">
       
    <p>You are about to send this user a share request.</p>
 <form id="sendRequestForm" class="modalForm" onsubmit="sendRequest();return false;" >
  <textarea rows="10" cols="40" id="requestMessage">Hi <%=requestorName%>, I would like to share the cab with you</textarea>
   <button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-transition="flow">Send</button>
        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-rel="back">Cancel</a>       
 </form>
    </div>
</div>
	</div><!-- /content -->
	<%@ include file="pannel.jsp" %>
  	<div data-role="footer" data-position="fixed"  >
       <div data-role="navbar" data-iconpos="left" id="footer">
        <ul>
            <li><a href="map.jsp?username=<%=username%>&latitude=<%=latitude%>&longitude=<%=longitude%>"  data-ajax="false" data-theme="b" data-icon="grid" >Map View</a></li>
            <li><a href="list.jsp?username=<%=username%>&latitude=<%=latitude%>&longitude=<%=longitude%>"  data-ajax="false" data-theme="b" data-icon="bullets" class="ui-btn-active">List View</a></li> 
        </ul>
    </div><!-- /navbar -->
	</div><!-- /footer -->

</div><!-- /page -->
  
   

  </body>
</html>