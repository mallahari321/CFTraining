<!---Get page content for fld_pageID = 3--->
 <cfinclude template="includes/myFunctions.cfm"  />
 <cfset rsPage=getPageContent(3) />
<cf_front title='HS STREET - PLAY FOR YOU' >
	<div id="pageBody">
  <cfoutput query="rsPage">
  	<h1>#FLD_PAGETITLE#</h1>
  	#FLD_PAGECONTENT#
  </cfoutput>
</div>
  </cf_front>
