<!---Get page content for fld_pageID = 5--->
<cf_front title='HS STREET - SITEMAP' >
   
 <cfinclude template="includes/myFunctions.cfm"  />
 <cfset rsPage=getPageContent(4) />
 <div id="pageBody">
  <cfoutput query="rsPage">
  	<h1>#FLD_PAGETITLE#</h1>
  	#FLD_PAGECONTENT#
  </cfoutput>
</div>
 </cf_front>