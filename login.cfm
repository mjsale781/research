<!--- Login Page --->

<html>
	<head>
		<title>Login</title>
	</head>
	
	<body
		<cfif isdefined("form.username") and isdefined("form.userpassword") and  len(form.username) gt 0 and len(form.userpassword) gt 0>
			<cfinvoke component="security" method="verifyLogin" returnvariable="iuserid">
				<cfinvokeargument name="username" value="#form.username#">
				<cfinvokeargument name="userpassword" value="#form.userpassword#">
			</cfinvoke>
			
			<cfif iuserid neq 0>
				<cfset session.userid = iuserid>
				<cflocation url="main_menu.cfm">
			<cfelse>
				<p>Invalid login. Please <a href="login.cfm">try again</a>.</p>
			</cfif>
		</cfif>
		
	
		<p>Please login with your username and password.</p>
		<form name="frmlogin" method="post" action="login.cfm">
			<strong>Username:</strong>
			<input name="username" type="text" maxlength="20" required="yes"><br />
			<strong>Password:</strong>
			<input name="userpassword" type="password" maxlength="20" required="yes"><br />
			<input name="submit" type="submit" value="submit">
		</form>
		
		<p><a href="forgot_password.cfm">I forgot my password.</a></p>
			
		
	</body>
</html>