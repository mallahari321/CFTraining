<html>
<head><title>Arrays</title></head>

<body><body>
	<!---Step 1 - Create an array using explicit notation--->
        <cfset acolors=arrayNew(1) />
        <cfset acolors[1]= "red" />
        <cfset acolors[2]= 'green' />
        <cfset acolors[3]= 'orange' />
        <cfset acolors[4]= 'blue' />
        <p>Dump the explicit array</p>
        <cfdump var='#acolors#' label='Explicit Array' />
        
        
	<!---Step 2 - Create an array using the implicit array notation--->
	    <cfset acolorImplicit=['Green','red'] />
	<p>Dump the implicit array</p>
	 <cfdump var='#acolorImplicit#' label='Implicit Array' />
	 
	 
	<!---Step 3 - use arrayLen()--->
    
	<h1>The aColors array contains <cfoutput>#arrayLen(acolors)#</cfoutput> Elements</h1>
    
	<!---Step 4 - use <cfloop> to loop over the array--->
    <cfoutput>
        <cfloop from='1' to='#arrayLen(acolors)#' index='i' >
            #i#   -->  #acolors[i]# <br />
        </cfloop>
    </cfoutput>

	<!--- Step 5 - Use arrayAppend() and arrayPrepend() --->
	<cfset arrayAppend(acolors,'skyblue') />
		<cfset arrayPrepend(acolors,'skyue') />
	<cfdump var='#acolors#' label='Explicit Array' />
	<br />
	<!---Step 6 - Use arrayDeleteAt() --->
	<!---<cfset arrayDeleteAt(acolors,#arrayLen(acolors) -3 #) />
	<cfdump var='#acolors#' label='After deleteing  Array' />--->

</body>
</html>