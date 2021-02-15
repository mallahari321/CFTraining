<cfcomponent output="false">
<!--- Validating the User with  Email and Password --->
	<cffunction name="userLogin" displayname="User Login" access="public" output="false"
	            returntype="boolean">
		<cfargument name="userEmail" required="true"/>
		<cfargument name="userPassword" required="true"/>
		<cfset var isValidUser=false />
		
		<cfquery name='rsLoginUser' >
			select U.FLD_USERFIRSTNAME,U.FLD_USERLASTNAME,U.FLD_USERID,U.FLD_USEREMAIL,R.FLD_ROLENAME,U.FLD_USERPASSWORD,R.FLD_ROLENAME from tbl_users U inner join TBL_ROLES R on R.FLD_ROLEID = FLD_USERROLE
	   
			where FLD_USEREMAIL='#arguments.userEmail#' and FLD_USERPASSWORD='#arguments.userPassword#' and FLD_USERISACTIVE=1
		</cfquery>
		<cfif rsLoginUser.recordCount eq 1>
			<cflogin >
				<cfloginuser name="#rsLoginUser.FLD_USERFIRSTNAME# #rsLoginUser.FLD_USERLASTNAME#" password="rsLoginUser.FLD_USERPASSWORD" roles="#rsLoginUser.FLD_ROLENAME#" >
			</cflogin>
				<cfset session.stLoggedInUser = {'USERFIRSTNAME'=#rsLoginUser.FLD_USERFIRSTNAME#, 'USERLASTNAME'=#rsLoginUser.FLD_USERLASTNAME#,'USERID'=#rsLoginUser.FLD_USERID#} />
				 <cfset var isValidUser=true />
		</cfif> 
		
		
		<cfreturn isValidUser>
	</cffunction>
	
	<cffunction name="validateUser" description="Validate the User Email and Password" access="public" 
	            output="false" returntype="array">
		<cfargument name="userEmail" displayname="User Email" type="string" required="true"/>
		<cfargument name="userPassword" displayname="Password" type="string" required="true"/>
	<cfset isValidUser = false/>
		<!--- Validate the Email and Password --->
		<cfset aErrorMessages=ArrayNew(1) />
		<cfif userEmail eq '' >
			<cfset arrayAppend(aErrorMessages,'Please provide the Email') />
		</cfif>
		<cfif userPassword eq '' >
			<cfset arrayAppend(aErrorMessages,'Please provide the password') />
		</cfif>
		<cfreturn  aErrorMessages />		 
	</cffunction>
	
	<cffunction name="userLogout" access="public" output="false" >
	<cfset structdelete(session,'stLoggedInUser') />
	<cflogout />
	</cffunction>
	
</cfcomponent>