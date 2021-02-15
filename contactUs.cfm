<!---Get page content for fld_pageID = 6--->
 <cfinclude template="includes/myFunctions.cfm"  />
 <cfset rsPage=getPageContent(6) />
<cf_front title="HD STREET - CONTACT US" >
  <div id="pageBody">
  <cfoutput query="rsPage">
  	<h1>#FLD_PAGETITLE#</h1>
  	#FLD_PAGECONTENT#
  </cfoutput>
</div>
</div>
 </cf_front>
