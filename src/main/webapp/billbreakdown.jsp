<%
String username=request.getParameter("username");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
//String latitude1 = request.getParameter("latitude1");
//String longitude1 = request.getParameter("longitude1");
//String latitude2 = request.getParameter("latitude2");
//String longitude2 = request.getParameter("longitude2");
String user2 = "Jason Lim";
if(username.equals("jason_lim")){
	user2 = "Marie Wong";
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Bill Breakdown</title>

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

<script>
function display()
{
document.getElementById("demo").innerHTML="This Bill Has Been Saved";
}
</script>
<style>
#tripDetails{
 margin:2%;
 color:#ffffff;
background-color:#22AACC;
text-align:center;
width:40%;

	padding: 2%;		
border-radius: 43px 43px 43px 43px;
-moz-border-radius: 43px 43px 43px 43px;
-webkit-border-radius: 43px 43px 43px 43px;
border: 0px solid #D8D8D8;
 }
 </style>
  <style>
  
  .ui-content{
	display:block;
	width:100%;
	margin-left:auto;
	margin-right:auto;
}	

 #address.ui-grid-a .ui-block-a {
      float: left;
      
      width: 30%;
      font-weight:bold;
      font-size:80%;
 }
 
 #address.ui-grid-a .ui-block-b {
      float: left;
      height:30%;
      width: 70%;
      font-size:80%;
      margin:0px;
 }
</style>
 <style>
 #detail.ui-grid-a .ui-block-a {
      float: left;
      width: 70%;
      height:30px;
      font-weight:bold;
      font-size:90%;
 }
 
 #detail.ui-grid-a .ui-block-b {
      float: left;
      width: 30%;
      font-size:85%;
 }
 #text{
 	font-size:80%;
 }
</style>

<style>
#button1.ui-grid-b .ui-block-a{
	float:left;
	width:0%;
}
#button1.ui-grid-b .ui-block-b{
	float:left;
	width:90%;
}
#button1.ui-grid-b .ui-block-c{
	float:left;
	width:0%;
}

</style>

<style>
#button2 a{
	font-weight:bold;
}
#button2.ui-grid-b .ui-block-a{
	float:left;
	width:0%;
}
#button2.ui-grid-b .ui-block-b{
	float:left;
	width:90%;
}
#button2.ui-grid-b .ui-block-c{
	float:left;
	width:0%;
}

</style>
</head>
<body>



<!-- Start of second page -->
<div data-role="page" id="index" data-add-back-btn="true">

	<div data-role="header">
  		<% String headerTitle="Bill Breakdown"; %>
   		<%@ include file="header.jsp" %>	
	</div><!-- /header -->

	<div data-ole="main" class="ui-content">
    
		
		
		<div id="tripDetails" >Trip's details</div>
			<br/>
		<div class="ui-grid-a" id="address">
		    <div class="ui-block-a">FROM</div>
		    <div class="ui-block-b"><%=address1 %></div>
		    
		    <div class="ui-block-a">TO</div>
		    <div class="ui-block-b"><%=address2 %></div>
		</div>
		
		<hr/>
		
		<span id="text">The details of your shared trip is as below: </span> <br/><br/>
		<!-- Trip details -->
		<div class="ui-grid-a" id="detail">
		    <div class="ui-block-a">Estimated total fare</div>
		    <div class="ui-block-b">$ 20.5</div>
		    
		    <div class="ui-block-a">Your fare share</div>
		    <div class="ui-block-b">$ 10.25</div>
		    
		     <div class="ui-block-a"><%=user2 %>'s fare share</div>
		    <div class="ui-block-b">$ 10.25</div>
		</div>
		
	<!-- /Trip details -->
	
	
   <fieldset class="ui-grid-b" id="button1">
   <div class="ui-block-a"></div>
    <div class="ui-block-b"><button type="button" class="ui-btn ui-corner-all " onclick="display()" id="demo"> Save This Bill </button></div>
    <div class="ui-block-c"></div>
</fieldset> 

    <fieldset class="ui-grid-b" id="button2">
   <div class="ui-block-a"></div>
    <div class="ui-block-b"><a href="feedback.jsp?username=<%=username %>" class="ui-btn ui-corner-all" data-ajax="false">Rate Your Cab-sharer(s) </a>
</div>
    <div class="ui-block-c"></div>
</fieldset> 


	</div><!-- /content -->
    
   <%@ include file="pannel.jsp" %>
	
</div><!-- /page -->


</body>
</html>