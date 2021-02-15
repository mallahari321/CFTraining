<!---Form processing begins here--->
<cfif structKeyExists(form, 'form.fld_editUserSubmit')> 
	<cfset aErrorMessages=arrayNew(1) />
	<cfset variables.formSubmitComplete=false />
	<!---First Name --->
	<cfif form.fld_userFirstName eq '' >
		<cfset arrayAppend(aErrorMessages,'Please Enter the First Name') />
	</cfif>
	
	<!---Last Name --->
	<cfif form.fld_userLastName eq '' >
		<cfset arrayAppend(aErrorMessages,'Please Enter the Last Name') />
	</cfif>
	
	<!--- Email--->
	<cfif form.fld_userEmail eq ''  or not isvalid('email',form.fld_userEmail)>
		<cfset arrayAppend(aErrorMessages,'Please Enter the Email') />
	</cfif>
	
	<!---password and confirm password --->
	<cfif form.fld_userPassword eq '' or form.fld_userPasswordConfirm eq '' or form.fld_userPassword neq form.fld_userPasswordConfirm  >
		<cfset arrayAppend(aErrorMessages,'Please Enter the valid password') />
	</cfif>
	
	<!---Instrument --->
	<cfif form.fld_userInstrument eq 0 >
		<cfset arrayAppend(aErrorMessages,'Please Select the Instrument') />
	</cfif>
	<cfdump var='#aErrorMessages#' />
	<cfif arrayIsEmpty(aErrorMessages) >
		Hari
		<!--- Update the data into Database if Errors detected. --->
		 <cfquery datasource="cfTraining">
		   UPDATE TBL_USERS SET FLD_USERFIRSTNAME ='#form.fld_userFirstName#',
								FLD_USERLASTNAME='#form.fld_userLastName#'
								FLD_USEREMAIL='#form.fld_userEmail#',
								FLD_USERPASSWORD='#form.FLD_USERPASSWORD#',
								FLD_USERCOMMENT= '#form.FLD_USERComment#',			
								FLD_USERINSTRUMENT=#form.FLD_USERINSTRUMENT# 
								WHERE FLD_USERID = '#form.FLD_USERid#',
			
		</cfquery>
		<cfset variables.formSubmitComplete=true />
 	  </cfif>
</cfif>


<!---Form processing ends here--->

<!---Get user to update--->
<cfquery datasource="cfTraining" name='rsUserToUpdate' >
	select FLD_USERID,FLD_USERFIRSTNAME,FLD_USERLASTNAME,FLD_USERPASSWORD,FLD_USEREMAIL,FLD_USERCOMMENT,FLD_USERINSTRUMENT
	from TBL_USERS where FLD_USERID = #url.userID#
</cfquery>


<!---Get instruments to feed the form's Drop-Down list--->
<cfquery datasource="cfTraining" name="rsInstrumentsList">
	SELECT FLD_INSTRUMENTID, FLD_INSTRUMENTNAME
	FROM TBL_INSTRUMENTS
	ORDER BY FLD_INSTRUMENTNAME ASC
</cfquery>
<cf_front title='HS STREET - PROFILE' >
	<div id="pageBody">
		<h1>Update your profile</h1>
		<cfform id="frm_editUser">
			<fieldset>
				<legend>Your profile</legend>
				<!---Output error messages if any--->
				<cfif   isdefined('aErrorMessages') and not arrayIsEmpty(aErrorMessages) >
			<cfoutput >
				<cfloop array="#aErrorMessages#" index="message" >
				<p class='errormessage'>#message#</p>
				</cfloop>
				</cfoutput>
			</cfif>
				<!---Output feedback message if form has been successfully submitted--->
				
				<dl>
					<!---First name text field--->
					<dt><label for="fld_userFirstName">First Name</label></dt>
					<dd><cfinput name="fld_userFirstName" id="fld_userFirstName" value='#rsUserToUpdate.FLD_USERFIRSTNAME#' required="false" message="Please provide a valid first name" validateAt="onSubmit" /></dd>
					<!---Last name text field--->
					<dt><label for="fld_userLastName">Last Name</label></dt>
					<dd><cfinput name="fld_userLastName" id="fld_userLastName" value='#rsUserToUpdate.FLD_USERLASTNAME#' required="false" message="Please, provide a valid last name" validateAt="onSubmit" /></dd>
					<!---E-Mail Address text field--->
					<dt><label for="fld_userEmail">E-mail Address</label></dt>
					<dd><cfinput name="fld_userEmail" id="fld_userEmail"  value='#rsUserToUpdate.FLD_USEREMAIL#' required="false" validate="email" message="Please, provide a valid e-mail Address" validateAt="onSubmit" /></dd>
					<!---Password text field--->
					<dt><label for="fld_userPassword">Password</label></dt>
					<dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword"  value='#rsUserToUpdate.FLD_USERPASSWORD#' required="false" message="Please, provide a password" validateAt="onSubmit" /></dd>
					<dt><label for="fld_userPasswordConfirm">Confirm password</label></dt>
					<dd><cfinput type="password" name="fld_userPasswordConfirm" id="fld_userPasswordConfirm"  value='#rsUserToUpdate.FLD_USERPASSWORD#' required="false" message="Please, confirm your password" validateAt="onSubmit" /></dd>
					<!---Instruments drop-down list--->
					<dt><label for="fld_userInstrument">Instrument</label></dt>
					<dd>
						<cfselect name="fld_userInstrument" id="fld_userInstrument" selected="#rsUserToUpdate.FLD_USERINSTRUMENT#"  query="rsInstrumentsList" value="FLD_INSTRUMENTID" display="FLD_INSTRUMENTNAME" queryposition="below" >
							<option value="0">Please choose your instrument</option>
						</cfselect>
					</dd>
					<!---Comment Textarea--->
					<dt><label for="fld_userComment">Comment</label></dt>
					<dd><cftextarea name="fld_userComment" id="fld_userComment"  value='#rsUserToUpdate.FLD_USERCOMMENT#' toolbar="Basic" richtext="true" ></cftextarea></dd>
				<cfinput name='fld_userid' type='hidden'  value='#rsUserToUpdate.FLD_USERID#' />
				</dl>
				<!---Submit button--->
				<input type="submit" name="fld_editUserSubmit" id="fld_editUserSubmit" value="Update my profile" />
			</fieldset>
		</cfform>
	</div>
	</cf_front>