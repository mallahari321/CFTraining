<!---Get page content for fld_pageID = 2---> 
 <cfset rsPage=application.pageService.getPageByID(2) />
<cf_front title='HS STREET - History' >
	<div id="pageBody">
  <cfoutput query="rsPage">
  	<h1>#FLD_PAGETITLE#</h1>
  	#FLD_PAGECONTENT#
  </cfoutput>
</div>
  </cf_front>
