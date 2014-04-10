<%
String username=request.getParameter("username");
double latitude=Double.parseDouble(request.getParameter("latitude"));
double longitude=Double.parseDouble(request.getParameter("longitude"));
String requestorName = "Jason Lim";
String requestor = "jason_lim";
if(username.equals("jason_lim")){
	requestorName = "Marie Wong";
	requestor = "marie_wong";
}
//String requestor = request.getParameter("requestor");
//String requestorName = request.getParameter("requestorName");
//String destination = request.getParameter("destination");
//String requestSent = request.getParameter("requestSent");
//String requestSent = request.getParameter("requestSent");
%>


<!DOCTYPE html>
<html>
<head>
	<title>Map View</title>

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
		#map-page { width: 100%; height: 100%; padding: 0; }
		#map-canvas {
		height: 100%;
    padding: 0;
    position : absolute !important; 
    top : 40px !important;  
    right : 0; 
    bottom : 40px !important;  
    left : 0 !important;   
    
}
		#content { width: 100%; height: 100%; padding: 0; }
		
		
	</style>
	
	
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
     <script src="https://cdn.firebase.com/v0/firebase.js"></script>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
  <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
    <style>
    .modal {
    background-color:#fff;
    display:none;
    width:350px;
    padding:15px;
    text-align:left;
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
    font-size:20px;
  }
  </style>
  <script>
  
////////////////////////////DATA INITIALIZATION///////////////////////////////////////// 
//var woodland = new google.maps.LatLng(1.43754,103.78961 );
var lat = <%=latitude%>;
var lng = <%=longitude%>;
var username = '<%=username%>';
var centerPoint = new google.maps.LatLng(lat,lng);
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

neighborhoods = [
   new google.maps.LatLng(1.43675, 103.78974),
   new google.maps.LatLng(1.43792,103.79074 ),
   new google.maps.LatLng(1.43877,103.78928 ),
   new google.maps.LatLng(1.43598, 103.78953),
   new google.maps.LatLng(1.43566,103.78943),
   new google.maps.LatLng(1.43479,103.78952),
   new google.maps.LatLng(1.43563,103.79166),
   new google.maps.LatLng(1.43455,103.78658),
   new google.maps.LatLng(1.44017,103.78789)
];
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

	neighborhoods = [
	   new google.maps.LatLng(1.437537, 103.7896099999993),
	   new google.maps.LatLng(1.43598,103.78953),
	   new google.maps.LatLng(1.43566,103.78943 ),
	   new google.maps.LatLng(1.43792, 103.79074),
	   new google.maps.LatLng(1.43479,103.78952),
	   new google.maps.LatLng(1.43877,103.78928),
	   new google.maps.LatLng(1.43563,103.79166),
	   new google.maps.LatLng(1.43455,103.78658),
	   new google.maps.LatLng(1.44017,103.78789)
	];
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

////////////////////////////////UPDATE DISTANCE FILTER//////////////////////////////////////////////
function updateDistanceFilter(){
	var distance = document.getElementById("rangeInput").value;
	distanceFilter = distance;
	for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);
	  } 
	dropMarkers(distanceFilter);
	
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

////////////////////////////////////MAP INITIALIZATION//////////////////////////////
function initialize() {
  var mapOptions = {
    zoom: 15,
    center: centerPoint
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);
}

function drop() {	  
	var contentString = 
		'<div style="height:150px;width:150px">'+
	      '<div id="siteNotice">'+
	      '</div>'+
	      '<h1 id="firstHeading" class="firstHeading">You Are Here</h1>'+
	      '<div id="bodyContent">'+
	      '<p><a href="index.jsp?username=<%=username%>">'+
	      'Amend Your Search/Request</a> '+
	      '</p>'+
	      '</div>'+
	      '</div>';

var infowindow = new google.maps.InfoWindow({
    content: contentString
});

var image = 'icons/taxi.png';
var currentLocation = new google.maps.Marker({
    position: centerPoint,
    map: map,
    icon: image
});

google.maps.event.addListener(currentLocation, 'click', function() {
  infowindow.open(map,currentLocation);
});
	 
	   
  dropMarkers(distanceFilter);
  
  
}

///////////////////////////////////MARKER DROPPING ANIMATION////////////////////////
function dropMarkers(distanceFilter){
	iterator = 0;
	 for (var i = 0; i < neighborhoods.length; i++) {
		    setTimeout(function() {
		      addMarker(distanceFilter);
		    }, i*100);
	}  
}

function addMarker(distanceFilter) {	
  var distanceBetweenPoints = distance(lat,lng,latitudes[iterator],longitudes[iterator],"M");	
  if(distanceBetweenPoints<=distanceFilter){
	  var image = "icons/number_"+(iterator+1)+".png";	
	  var marker = new google.maps.Marker({
		    position: neighborhoods[iterator],
		    map: map,
		    icon: image,
		    draggable: false,
		    animation: google.maps.Animation.DROP
		  });
	  
	  var contentString = 
		  '<div class="ui-grid-a" id="mainProfile" style="height:160px;width:80%">'+
		    '<div class="ui-block-a" id="mainA">'+
		    	'<p>'+users[iterator]+' is heading to'+'</p>'+
		    	'<p><h3>'+destinations[iterator] +'</h3></p>'+
		    	'<p>'+usersGender[iterator]+' is within '+distanceBetweenPoints+'m from your location</p>'+ 
			 '</div><br/>'+
			 '<div class="ui-block-b" id="mainA">'+
			    '<p><img src="images/He.png" style="width:80%;" ></p>'+
			    '<div class="ui-grid-b" id="rating">'+
				    '<div class="ui-block-a">'+
				    positives[iterator]+'<img src="images/plus.png" style="width:110%;" >'+
				    '</div>'+
				    '<div class="ui-block-b">'+
				    neutrals[iterator]+'<img src="images/ok.png" style="width:110%;" >'+
				    '</div>'+
				    '<div class="ui-block-c">'+
				    negatives[iterator]+'<img src="images/minus.png" style="width:110%;" >'+
				    '</div>'+
				    
				    
				'</div>'+
		    '</div>'+ 
		    '<div class="ui-block-a"><a data-ajax="false" href="viewprofile.jsp?username=<%=username%>'+
	    	'&requestor='+usernames[iterator]+
	    	'&requestorName='+users[iterator]+
	    	'&destination='+destinations[iterator]+'">View Profile </a></div>'+
		    '<div class="ui-block-b"><a href="#popupDialog" data-rel="popup" data-position-to="window" data-transition="pop" >Send Request</a></div>'+
		'</div>';
		
		

	var infowindow = new google.maps.InfoWindow({
	    content: contentString
	});
	  
		google.maps.event.addListener(marker, 'click', function() {
			  infowindow.open(map,marker);
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
	  });
	  markers.push(marker);
  }
  iterator++;
}

google.maps.event.addDomListener(window, 'load', initialize);

//////////////////////////////////////SEND REQUEST///////////////////////////////////////////////
function sendRequest(){
	var message = document.getElementById("requestMessage").value;
	if (message!=null&&message.trim()!=""){
		var chatRef = new Firebase('https://glaring-fire-5132.firebaseio.com/chat');
		var timestamp = new Date().getTime();
   	    chatRef.push({from:'<%=username%>',to:'<%=requestor%>',text:message,timestamp:timestamp,status:'unread'});
   	    alert("Your request was successfully sent");
   	    window.location.href="map.jsp?username=<%=username%>&latitude=<%=latitude%>&longitude=<%=longitude%>"; 
   	    return false;
	}else{
		  document.getElementById("sendRequestError").textContent="Request message cannot be empty! Please try again";
	}
}
</script>
<style>
#slider{
	margin-bottom:96%;
}
</style>
<style>

#mainProfile.ui-grid-a #mainA.ui-block-a {
      float: left;
      width: 70%;
    }
#mainProfile.ui-grid-a #mainA.ui-block-b {
      float: left;
      width: 30%;
    }
    
 .ui-grid-a .ui-block-a .ui-block-b .ui-block-c{margin: 0px 0px 0px 0px;
 			padding: 0px 0px 0px 0px;}
 #rating{font-size:11px;text-align:center;font-weight:bold;}
</style>

<style>
a:link {text-decoration:none;color:#22AACC;}
</style>

<style>
/* content configurations. */
.ui-grid-a,
.ui-grid-b,
.ui-grid-c,
.ui-grid-d,
.ui-grid-solo {
	overflow: hidden;
	border: 0;
	line-height:100%;
	margin-right:auto;
	margin-left:auto;
}


#footer .ui-btn{
	font-family: Comic Sans MS; 
	font-weight: bold;
	font-size: 15px;
}

#slider{
	 position: relative;  
            z-index: 10;
}           
#slider input {
    display: none;
}
</style>
<style>
#searchWithin{
	margin-left:20%;
	font-size:90%;
	font-weight:bold;
	margin-bottom:0px;
	color: #22AACC;
	font-style:italic
}
</style>

</head>
<body  onload="drop()">



<!-- Start of map view page -->
<div data-role="page" id="map-page">

<%@ include file="pannel.jsp" %>	

	<div data-role="header" id="header">
	<% String headerTitle="Map View"; %>
   		<%@ include file="header.jsp" %>	
	

	</div><!-- /header -->

	<div data-role="main" class="ui-content" id="content" >
		<div id="map-canvas" ></div>
<form oninput="amount.value=rangeInput.value" id=slider>
   <div id=slider> 
   <span id="searchWithin">Search Within</span>
    <input type="range" id="rangeInput"  name="rangeInput" min="0" max="1000" value="500" data-show-value="true" onchange="updateDistanceFilter()" data-highlight="true">
	</div>
</form>
<div data-role="popup" id="popupDialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
    <div data-role="header" data-theme="a" id="header">
    <h1>Send Request</h1>
    </div>
    <div role="main" class="ui-content">
       
    <p>You are about to send this user a share request.</p>
 <form id="sendRequestForm" class="modalForm" onsubmit="sendRequest();return false;" >
   <textarea rows="10" cols="40" id="requestMessage">Hi <%=requestorName%>, I would like to share the cab with you</textarea>
   <%-- <p> Hi <%=requestorName%>, I would like to share the cab with you</p> --%>
       <button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-transition="flow">Send</button>
        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-rel="back">Cancel</a>
        
 </form>
 
    </div>
</div>
	</div><!-- /content -->
	
		
	
	<div data-role="footer" data-position="fixed" data-theme="z">
		
		 <div data-role="navbar" data-iconpos="left" id="footer">
        <ul>
            <li><a href="map.jsp?username=<%=username%>&latitude=<%=latitude%>&longitude=<%=longitude%>"  data-ajax="false" data-theme="b" data-icon="grid" class="ui-btn-active">Map View</a></li>
            <li><a href="list.jsp?username=<%=username%>&latitude=<%=latitude%>&longitude=<%=longitude%>"  data-ajax="false" data-theme="b" data-icon="bullets" >List View</a></li> 
        </ul>
    </div><!-- /navbar -->
		
	</div><!-- /footer -->

	
</div><!-- /page -->



</body>
</html>