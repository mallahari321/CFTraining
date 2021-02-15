<cffunction name="getPageContent" returntype='query'   >
	<cfargument name="pageID" type="numeric"   />
	<cfset var rspage='' />
	
	<cfquery datasource="cfTraining" name='rsPage' > 
		select * from TBL_PAGES
		 where FLD_PAGEID =#pageID# and FLD_PAGEISACTIVE=1
	</cfquery>
	<cfreturn rsPage>
</cffunction>