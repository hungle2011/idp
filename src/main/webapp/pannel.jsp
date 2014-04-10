<style>
#rightPanel.ui-li-count{						
border-radius: 200px 200px 200px 200px;
-moz-border-radius: 200px 200px 200px 200px;
-webkit-border-radius: 200px 200px 200px 200px;
border: 0px solid #000000;
background-color:red;

	  
	 
}
</style>


<!-- Panel -->
    <div data-role="panel" id="right-panel" data-display="reveal" data-position="right" data-theme="a">
		<a data-ajax="false" href="mymessages.jsp?username=<%=username%>" id="newMessages" class="ui-btn">My Messages
		<span id="rightPanel"></span></a>
  		<a  data-ajax="false" href="index.jsp?username=<%=username%>" class="ui-btn">Set Up Location</a>
  		<a href="#" class="ui-btn">My Bills</a>
  		<a href="#" class="ui-btn" data-ajax="false">My Profile</a>
   		<a  data-ajax="false" href="login.html" class="ui-btn">Logout</a>
    </div><!-- /panel -->