<cfapplication  
    name = "porticoresearch" 
    sessionManagement = "yes" 
    sessionTimeout = #CreateTimeSpan(0, 2, 0, 0)# >
	
<cferror  
    template = "errorpage.cfm" 
    type = "exception">