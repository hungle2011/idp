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
	<title>Feedback</title>

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

 <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
  <style>
    .modal {
    background-color:#fff;
    display:none;
    width:350px;
    padding:15px;
    text-align:left;
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
    font-size:20px;
  }
  </style>
  <script>

 
</script>
</head>
<body>



<!-- Start of second page -->
<div data-role="page" id="index" data-add-back-btn="true">

	<div data-role="header" id="header">
	<%String headerTitle = "Feedback"; %>
   		<%@ include file="header.jsp" %>
	</div><!-- /header -->

	<div role="main" class="ui-content">
    
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
	  <div class="ui-nodisc-icon ui-alt-icon"><!-- Classes added to the wrapper -->
    
            <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-plus ui-btn-icon-notext ui-btn-inline">Plus</a>
            <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-check ui-btn-icon-notext ui-btn-inline">Check</a>
            <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-inline">Minus</a>
    <p><strong>Comments:</strong></p>
    <label for="textarea">Textarea:</label>
<textarea cols="40" rows="30" name="textarea" id="textarea" placeholder="(optional)"></textarea>
<button class="modalInput" rel="#prompt" >Submit</button> 




	  </div>
	  
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

<div class="modal" id="prompt2">
  <h2>Thank you</h2>
 <p>Your feedback has been saved successfully</p>

  <form id="sendRequestForm" class="modalForm" action="index.jsp" >
  	
   
    <button type="submit">OK</button>
    
  </form>
      <p><font color="red"><a id="sendRequestError"> </a> </font></p>
  <br>
</div>
<div id="exposeMask" style="position: absolute; 
top: 0px; left: 0px; width: 1272px; height: 302px; display: none; opacity: 0.9;
 z-index: 9998; background-color: rgb(235, 236, 255);"></div>
	  
	</div><!-- /content -->
    
  <%@ include file="pannel.jsp" %>
    </div><!-- /panel -->

	<div data-role="footer">
		
	</div><!-- /footer -->
</div><!-- /page -->


</body>
</html>