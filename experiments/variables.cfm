<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!--- step 1 - Create 2 variables using cfset--->
	<cfset firstName='Hari' />
	<cfset lastName='Malla' />
	
	<!--- step 2 - Use cfoutput --->
	<cfoutput>
		<p>Full Name is : #firstName# - #lastName#</p>
	</cfoutput>

	<!---Step 3 - experiment with typeless variables--->
	
	<cfset x=5 />
	<cfset y = x+5 />
	<cfoutput>
		<p>Y Value is : #y#</p>
		<p>X Value is After Increment : #x++#</p>
	</cfoutput>
	<!---Step 4 - Copy /paste the above 3 lines below this comment--->
    <!---<cfset x='Ha' />
	<cfset y = x+5 />
	<cfoutput>
		<p>Y Value is : #y#</p>
		<p>X Value is After Increment : #x++#</p>
	</cfoutput>--->

	<!---Step 5 - Experiment with the CGI scope--->
	<cfdump var='#cgi#' label='CGI DESCRIPTION' />
	
	<!---Step 6 - The server scope --->
	<cfdump var='#server#' label='server Description' />
</body>
</html>
