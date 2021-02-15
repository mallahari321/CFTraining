<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!---Step 1 - Create a structure using the structNew() function--->
	
	<cfset stuser=structNew() />
	<cfset stuser.name='hari' />
	<cfset stuser.age=26 />
	<cfset stuser.dob='06-03-1995' />
	<cfset stuser.address='Guntur' />
	
	<p>Dumping the explicit Structure</p>
	
	<cfdump var='#stuser#' label='User Information' />
	
	<!---Step 2 - Create the same structure using implicit notation--->
	
	<cfset implicitstuser={name='Hari',age=26,dob='06-03-1995',address='Guntur'} />
	
	<p>Dumping the implicit structure</p>
	
	<cfdump var='#implicitstuser#' label='Implicit User Information' />
	
	<!---Step 3 - use structDelete() --->
	
	<cfset structDelete(stuser,'age') />
	
	<p>Dumping stUser after the deletion of the 'age' key'</p>
	
	<cfdump var='#stuser#' label='After deletion age User Information' />
	
	<!---Step 4 - use structClear() --->
	
	<cfset structClear(implicitstuser) />
	
	<p>Dumping stUser after using structClear()</p>
	
	<cfdump var='#implicitstuser#' label='after Delete Implicit User Information' />
	
	<!---Step 5 - use structCount()--->
	
	<p>stUserImplicit holds <cfoutput>#structCount(stuser)#</cfoutput> elements</p>
</body>
</html>









