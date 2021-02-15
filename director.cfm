
  <!---Get page content --->
 <cfinclude template="includes/myFunctions.cfm"  />
 <cfset rsPage=getPageContent(1) />
<cf_front title='HS STREET - DIRECTOR' >
	<div id="pageBody">
  <cfoutput query="rsPage">
  	<h1>#FLD_PAGETITLE#</h1>
  	#FLD_PAGECONTENT#
  </cfoutput>
</div>
  </cf_front>

