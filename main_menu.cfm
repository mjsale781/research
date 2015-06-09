<!--- Main Menu --->

<html>
	<head>
		<title>Login</title>
	</head>

	<body>
	<h2>Welcome to the System</h2>
	<hr>
		<cfinvoke component="utility" method="getUserInfo" returnvariable="txtUserInfo">
			<cfinvokeargument name="userid" value="#session.userid#">
		</cfinvoke>
		<cfoutput>
	<p align="right">Hello, #listgetat(txtUserInfo,2)# #listgetat(txtUserInfo,3)#.  Today is #dateformat(now(), "ddd")#, #dateformat(now(), "mm/dd/yyyy")# </p>
		</cfoutput>
	<hr>
	
	<p>This is the main menu.</p>

	</body>
</html>