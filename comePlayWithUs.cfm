<!--- Form processing script here --->
<cfif structkeyexists(form,'fld_newUserSubmit') >
	<cfset aErrorMessages=arrayNew(1) />
	<!--- Validate First Name --->
	<cfif form.fld_userFirstName eq '' >
		<cfset arrayappend(aErrorMessages,'PLS ENTER THE FIRST NAME') />
	</cfif>
	
	<!--- Validate Last Name --->
	<cfif form.fld_userLastName eq '' >
		<cfset arrayappend(aErrorMessages,'PLS ENTER THE LAST NAME') />
	</cfif>
	
	<!--- Validate Email --->
	<cfif form.fld_userEmail eq '' or not isvalid('email',form.fld_userEmail) >
		<cfset arrayappend(aErrorMessages,'PLS ENTER THE EMAIL') />
	</cfif>
	
	<!--- Validate Last Name --->
	<cfif form.fld_userInstrument eq '0' >
		<cfset arrayappend(aErrorMessages,'PLS SELECT THE INSTRUMENT') />
	</cfif>
	<cfif arrayIsEmpty(aErrorMessages) >
		<!--- Generating the Missing filed data --->
		<cfset form.FLD_USERPASSWORD=generateSecretKey('AES') />
		<cfset form.FLD_USERAPPROVED = 0 />
		<cfset form.FLD_USERISACTIVE = 0 />
		<cfset form.FLD_USERROLE = 1 />
		<!--- INserting the data into Database if Errors detected. --->
		<cfquery datasource="cfTraining">
			INSERT INTO TBL_USERS (FLD_USERFIRSTNAME,FLD_USERLASTNAME,FLD_USEREMAIL,FLD_USERPASSWORD,FLD_USERCOMMENT,FLD_USERAPPROVED,FLD_USERISACTIVE,FLD_USERROLE,FLD_USERINSTRUMENT) 
			values ('#form.fld_userFirstName#','#form.fld_userLastName#','#form.fld_userEmail#','#form.FLD_USERPASSWORD#','#form.FLD_USERComment#',#form.FLD_USERAPPROVED#,#form.FLD_USERISACTIVE#,#form.FLD_USERROLE#,#form.FLD_USERINSTRUMENT#)
		</cfquery>
 	 </cfif>
	 
</cfif>
<!---Getting the Instruments List --->
<cfquery datasource="cfTraining"  name='rsInstrumentsList'>
								select * from TBL_INSTRUMENTS order by FLD_INSTRUMENTNAME asc								
							</cfquery>
<!---Get page content for fld_pageID = 4--->
<cfinclude template="includes/myFunctions.cfm"  />
 <cfset rsPage=getPageContent(4) />
 
<cf_front title='HD STREET -COME PLAY WITH US' >
 <div id="pageBody">
  	<div id="calendarContent">
  
 
 
 
  <cfoutput query="rsPage">
  	<h1>#FLD_PAGETITLE#</h1>
  	#FLD_PAGECONTENT#
  </cfoutput>
 
  

	</div>
	<div id="calendarSideBar">
		<h2>Complete the form below to join our band</h2>
		<cfif   isdefined('aErrorMessages') and not arrayIsEmpty(aErrorMessages) >
			<cfoutput >
				<cfloop array="#aErrorMessages#" index="message" >
				<p class='errormessage'>#message#</p>
				</cfloop>
				</cfoutput>
			</cfif>
		<cfform id="frm_newUser"  >
				<fieldset>
					<legend>Join our band</legend>
					<dl>
						<dt><label>First Name</label></dt>
						<dd><cfinput type="text" name="fld_userFirstName" id="fld_userFirstName" required="false" /></dd>
						<dt><label>Last Name</label></dt>
						<dd><cfinput type="text" name="fld_userLastName" id="fld_userLastName" required="false" /></dd>
						<dt><label>E-mail Address</label></dt>
						<dd><cfinput  type="text" name="fld_userEmail" id="fld_userEmail" required="false" validate="email" message="Please eneter the valid mail"  /></dd>
						<dt><label>Instrument</label></dt>
						<dd>
							
							<cfselect name="fld_userInstrument" id="fld_userInstrument" query='rsInstrumentsList' value='FLD_INSTRUMENTID' display='FLD_INSTRUMENTNAME' queryposition='below'  >
								<option value="0">Please choose your instrument</option>
							</cfselect>
						</dd>
						<dt><label>Comment</label></dt>
						<dd><textarea name="fld_userComment" id="fld_userComment"></textarea></dd>
					</dl>
					<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Join the band" />
				</fieldset>
			</cfform>
			
	</div>
	</div>
 </div>
 </cf_front>