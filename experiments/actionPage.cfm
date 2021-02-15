<cfparam name="form.fld_conditions" default="NO" >
<cfparam name="form.fld_interests" default="NONE" >
<cfif not isdefined('form.fld_conditions') >
	<cfset fld_conditions='NO' />
	</cfif>
<cfdump var='#form#' />