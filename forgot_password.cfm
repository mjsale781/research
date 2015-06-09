<!--- Forgot Password Page --->

<html>
	<head>
		<title>Login</title>
	</head>
	
	<body
		<cfif isdefined("form.username") and  len(form.username) gt 0>
			<cfinvoke component="security" method="forgotPassword" returnvariable="iResult">
				<cfinvokeargument name="username" value="#form.username#">
			</cfinvoke>
			
			<cfif iResult eq 1>
				<p>Your password was emailed to you at the email address on file.  If you do not receive it, please contact the help desk.</p>
				<p><a href="login.cfm">Return to login.</a></p>
				<cfabort>
			<cfelse>
				<p>We were unable to send you your password.  Please contact the help desk.</p>
				<p><a href="login.cfm">Return to login.</a></p>
				<cfabort>
			</cfif>
		</cfif>
		
	
		<p>Please provide your username.</p>
		<form name="frmlogin" method="post" action="forgot_password.cfm">
			<strong>Username:</strong>
			<input name="username" type="text" maxlength="20" required="yes"><br />
			<input name="submit" type="submit" value="submit">
		</form>
			
		
	</body>
</html>