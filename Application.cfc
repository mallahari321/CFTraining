<cfcomponent output="false">
	<cfset this.name = 'hdStreetWebsite' />
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />
	<cfset this.datasource = 'cfTraining' />
	<cfset this.customTagPaths = expandPath('/cfTraining/custom Tags') />
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />
	
	<!---OnApplicationStart() method--->
	<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.pageService = createObject("component",'cfTraining.components.pageService') />
		<cfset application.eventsService = createObject("component",'cfTraining.components.eventsService') />
		<cfset application.newsService = createObject("component",'cfTraining.components.newsService') />
		<cfset application.userService = createObject("component",'cfTraining.components.userService') />
		<!---<cfset application.commentsService = createObject("component",'cfTraining.components.commentsService') />
		<cfset application.utils = createObject("component",'cfTraining.components.utils') />--->
		<cfreturn true />
	</cffunction>
	<!---onRequestStart() method--->
	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />
		<!---handle some special URL parameters--->
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>
		<!---Implement ressource Access control for the 'admin' folder--->
		<cfif listFind(arguments.targetPage,'admin', '/') AND (NOT isUserLoggedIn() OR NOT isUserInRole('Administrator'))>
			<cflocation url="/cfTraining/index.cfm?noaccess" />
			
		</cfif>
		<cfreturn true />
	</cffunction>
</cfcomponent>