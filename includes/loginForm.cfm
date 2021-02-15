<cfif structkeyexists(url,'logout') >
	<cfset createObject("component",'cfTraining.components.AuthenticationService').userLogout() />
</cfif>

<!---Form Processing Start Here --->
<cfif structkeyexists(form,'fld_submitLogin') >
	<cfset authenticationService =createObject("component",'cfTraining.components.AuthenticationService') />
    <cfset   aErrorMessages=authenticationService.validateUser(form.fld_userEmail,form.fld_userEmail) />
    <cfif arrayisempty(aErrorMessages) >
    	<cfset isUserLoggedIn = authenticationService.userLogin(form.fld_userEmail,form.fld_userPassword) />    	 
    </cfif>


</cfif>
<!--- End Here --->

<cfform id="frmConnexion" preservedata="true">
	
	<fieldset>
    <legend>Login</legend>
      <cfif structkeyexists(variables,'aErrorMessages') and  not  arrayisempty(aErrorMessages) >
		<cfoutput>
			<cfloop  array="#aErrorMessages#" item='message' >
				<p class='errormessage'>#message#</p>
			</cfloop>
		</cfoutput>
	</cfif>

    <cfif structkeyexists(variables,'isUserLoggedIn') and  isUserLoggedIn eq false >
		<p class='errormessage'>User not found. Please try again Later.</p>
	</cfif>
    <cfif structkeyexists(session,'stUserLoggedIn')>
    	<cfoutput>
    		<p> Welcome #session.stLoggedInUser.USERFIRSTNAME# #session.stLoggedInUser.USERLASTNAME#</p>
    		<p><a href='/cfTraining/profile.cfm?userID=#session.stLoggedInUser.USERID#'>My Profile</a></p>
    	<cfif isUserInRole('Adminstrator')>
    		<p><a href='/cfTraining/admin/Administrator.cfm'>Sitr Administrator</a></p>
    	</cfif>
    	</cfoutput>
    	<cfelse>
		<dl>
        	<dt><label for="fld_userEmail">E-mail address</label></dt>
            <dd><cfinput type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="email" validateAt="onSubmit" message="Please enter a valid e-mail Address" /></dd>
    		<dt><label for="fld_userPassword">Password</label></dt>
            <dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword" required="true"  validateAt="onSubmit" message="Please provide a password" /></dd>
        </dl>
        <cfinput type="submit" name="fld_submitLogin" id="fld_submitLogin" value="Login" />
    </cfif>
    </fieldset>
   
</cfform>
