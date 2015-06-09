<!--- Security --->

<cfcomponent>

	<cffunction name="verifyLogin" access="remote" returnformat="plain">
		<cfargument name="username" type="string" required="yes">
		<cfargument name="userpassword" type="string" required="yes">
		
		<cfif isdefined("arguments.username") and isdefined("arguments.userpassword") and  len(arguments.username) gt 0 and len(arguments.userpassword) gt 0>
			<cfquery datasource="research1" name="qryauth">
				select userid 
				from users
				where username = '#trim(arguments.username)#'
					and userpassword = '#trim(arguments.userpassword)#'
			</cfquery>
			
			<cfif not qryauth.recordcount>
				<cfreturn 0>
			<cfelse>
				<cfreturn qryauth.userid>
			</cfif>
		<cfelse>
			<cfreturn 0>
		</cfif>
	</cffunction>
	
	<cffunction name="forgotPassword" access="remote" returnformat="plain">
		<cfargument name="username" type="string" required="yes">
		
		<cfif isdefined("arguments.username") and len(arguments.username) gt 0>
			<cfquery datasource="research1" name="qrypassword">
				select userpassword, email
				from users
				where username = '#trim(arguments.username)#'
			</cfquery>
			
			<cfif qrypassword.recordcount and len(qrypassword.email) gt 0>
				<cfmail from="admin@porticoconsulting.net" to="#qrypassword.email#" subject="Your password">
					Your password is: #qrypassword.userpassword#
					
					If you did not request to have your password emailed to you, please call the help desk immediately.
				</cfmail>
				
				<cfreturn 1>
			<cfelse>
				<cfreturn 0>
			</cfif>
		</cfif>
	</cffunction>
	
</cfcomponent>