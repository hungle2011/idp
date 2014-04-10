<%
String username=request.getParameter("username");

%>

<!DOCTYPE html>
<html>
  <head>
    <title>Set Up Location</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
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
	
    <!-- Script for function -->
     <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
     <script src="https://cdn.firebase.com/v0/firebase.js"></script>

    <script>
    
////////////////////////////Push Notification////////////////////////////////////////////////
 <%--  var chatRef = new Firebase("https://glaring-fire-5132.firebaseio.com/chat");
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
 }); --%>
   
 
 ////////////////////////////////Form Field for Search/Post Requests////////////////////////////////////
 
 function showLocation(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  //alert("Latitude : " + latitude + " Longitude: " + longitude);
  
  //var latitude = 1.280095;
  //var longitude = 103.850949;
  	
  // The Google Geocoding API url used to get the JSON data
  var geocodingAPI = "http://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=true";
  var geocodingAPI = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+ latitude +","+ longitude + "&sensor=true";

  $.getJSON(geocodingAPI, function (json) {

      // Set the variables from the results array
      var address = json.results[0].formatted_address;
      console.log('Address : ', address);
      
      var latitude = json.results[0].geometry.location.lat;
      console.log('Latitude : ', latitude);
      
      var longitude = json.results[0].geometry.location.lng;
      console.log('Longitude : ', longitude);

      // Set the table td text
      //$('#address').text(address);
      //$('#latitude').text(latitude);
      //$('#longitude').text(longitude);
      document.getElementById('pac-input1').value = address; 
  });

  // Caching the link jquery object
  var $myLink = $('a.myLink');

  // Set the links properties
  $myLink.prop({
      href: geocodingAPI,
      title: 'Click on this link to open in a new window.'
  }).click(function (e) {
      e.preventDefault();
      window.open(this.href, '_blank');
  });
}

function errorHandler(err) {
  if(err.code == 1) {
    alert("Error: Access is denied!");
  }else if( err.code == 2) {
    alert("Error: Position is unavailable!");
  }
}

function currentLocation(){

   if(navigator.geolocation){
      // timeout at 60000 milliseconds (60 seconds)
      var options = {timeout:60000};
      navigator.geolocation.getCurrentPosition(showLocation, 
                                               errorHandler,
                                               options);
   }else{
      alert("Sorry, browser does not support geolocation!");
   }
}

function switchLocations(){
	 var temp1 = document.getElementById('pac-input1').value;
	 var temp2 = document.getElementById('pac-input2').value;
	 document.getElementById('pac-input1').value = temp2;
	 document.getElementById('pac-input2').value = temp1;
}

function initialize() {

  var markers = [];
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-33.8902, 151.1759),
      new google.maps.LatLng(-33.8474, 151.2631));
  map.fitBounds(defaultBounds);

  // Create the search box and link it to the UI element.
  var input1 = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input1'));
  var input2 = /** @type {HTMLInputElement} */(
	      document.getElementById('pac-input2'));
  //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox1 = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input1));
  var searchBox2 = new google.maps.places.SearchBox(
		    /** @type {HTMLInputElement} */(input2));

  // [START region_getplaces]
  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox1, 'places_changed', function() {
    var places = searchBox1.getPlaces();

    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });
  // [END region_getplaces]
  
   google.maps.event.addListener(searchBox2, 'places_changed', function() {
    var places = searchBox2.getPlaces();

    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox1.setBounds(bounds);
    searchBox2.setBounds(bounds);
  });
}

///////////////////////////////SEND FORM/////////////////////////////////////
var geocoder;

function sendForm() {
	  geocoder = new google.maps.Geocoder();
	  //var latlng = new google.maps.LatLng(40.730885,-73.997383);
	  //var latitude;
	  //var longitude;
	  //var url = "";
	  latitude = getLatLng(function(latLng){
	    //alert(latLng);
	    window.location.href ="map.jsp?username="+'<%=username%>' + "&" + latLng;
	    //latitude = lat;
	    //url = url + lat;
	  });
	  return false;
}

function getLatLng(callback) {
	  //var latlng = new google.maps.LatLng(40.730885,-73.997383);
	   //var address= "Smugglers Notch, Cambridge, VT, United States";
	  var address = document.getElementById('pac-input1').value;
	  if (geocoder) {
	    geocoder.geocode({'address': address}, function(results, status) {
	      if (status == google.maps.GeocoderStatus.OK) {
	        if (results[0]) {
	          callback("latitude=" + results[0].geometry.location.lat()
	        		  + "&longitude=" + results[0].geometry.location.lng());
	        } else {
	          alert("This location is not available. Please enter a valid location!");
	        }
	      } else {
	        alert("This location is not available. Please enter a valid location!");
	      }
	    });
	  }
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  
<style>
#switch{
display:block;
margin-left: 75%;
margin-right: 10%;
}


</style>

<style>
 #to.ui-grid-a .ui-block-a {
 	
      float: left;
      width: 0%;
 }
 #to.ui-grid-a .ui-block-b {
      float: left;
      width: 100%;
 }
 #link{
 	font-size:90%;
 }
</style>
</head>
<body>

  
<!-- Start of  page -->
<div data-role="page" id="index" data-add-back-btn="true">

	<div data-role="header" id="header">
	<%String headerTitle = "Set Up Location"; %>
   		<%@ include file="header.jsp" %>
	</div><!-- /header -->

	<div data-role="main" class="ui-content">
    
	<br/><br/>
		
    <form method="post" action="" name="form1" onsubmit="sendForm();return false;">
        <div id="to" class="ui-grid-a">  
           <div class="ui-block-a"><br/><label for="textinput-s"><strong> </strong></label></div>
			<div class="ui-block-b">
			<input id="pac-input1" class="controls" type="text" placeholder="Choose starting point..." data-clear-btn="true">
			</div>
		</div>
		
       <!-- Current and switch -->
         <div id="current-switch" class="ui-grid-a">
		    <div class="ui-block-b" >
		    <div  style="height:40px"><a href="#" id="link" onclick="currentLocation()" ><span id="currentLoc">Use current location</span></a>
		    </div>
		    </div>
		    <div class="ui-block-b">
		    <div  style="height:40px"><a href="#" id="link" onclick="switchLocations()" ><img src="images/switch_icon.png" id="switch" height="40px"/></a>
		    </div>
		    </div>
		</div>
    	
    	<div id="to" class="ui-grid-a">
    		 <div class="ui-block-a"><br/><label for="textinput-s"><strong> </strong></label></div>
		    <div class="ui-block-b">
		    <input id="pac-input2" class="controls" type="text" placeholder="Choose destination..." data-clear-btn="true">
		    </div>
		</div>
    	<br/><br/><br/>
    	<input type="submit" class="ui-btn ui-corner-all" value="Post a New Request">
        <br/><br/>
        <input type="submit" class="ui-btn ui-corner-all" value="Browse Nearby Requests">
   </form>
		
		
		<!-- Testing:
	<br/>Marie Wong: FROM 892B Woodlands Drive 50 Singapore 731892 TO Changi Business Park
	<br/>Jason Lim: FROM 893B Woodlands Drive 50 Singapore 731893 TO Changi Business Park -->
	</div><!-- /content -->
	
	<%@ include file="pannel.jsp" %>
	
</div><!-- /page -->
    <div id="map-canvas" style="display: none;"></div>
    
  </body>
</html>