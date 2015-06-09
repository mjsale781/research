<!--- Utility --->

<cfcomponent>

	<cffunction name="getUserInfo" access="remote" returnformat="plain">
		<cfargument name="userid" type="numeric" required="yes">
		
		<cfquery datasource="research1" name="qryuserinfo">
			select username, firstname, lastname
			from users
			where userid = #arguments.userid#
		</cfquery>
		
		<cfset r =  "#qryuserinfo.username#,#qryuserinfo.firstname#,#qryuserinfo.lastname#">
		
		<cfreturn r>
	</cffunction>


</cfcomponent>