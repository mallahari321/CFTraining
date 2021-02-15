<cf_front  >
 
  <!---Last line to be included in header.cfm--->
  <div id="pageBody">
    <div id="homeContent">
    	<cfset rsLatestNews=application.newsService.getLatestNews(1) />
    <cfoutput query='rsLatestNews' maxrows="1" >
    	<h1>#FLD_NEWSTITLE#</h1>
    	<p>Published on #Dateformat(FLD_NEWSCREATIONDATE,'MMM DD YYYY')# by #FLD_USERFIRSTNAME# #FLD_USERLASTNAME#</p>
    	#FLD_NEWSCONTENT#
    </cfoutput>
    </div>
    <div id="homeSideBar">
      <div class="pod">
        <h1 id="nextEventsTitle">Next Events</h1>
        <ul>
        	 	<cfset rsLatestEvents= application.eventsService.getCurrentEvents(3) />
        	<cfoutput query='rsLatestEvents'>
        		<li><a href="agenda.cfm?eventID=#FLD_EVENTID#"><strong>#Dateformat(FLD_EVENTDATETIME,'MMM DD')#</strong> - #FLD_EVENTLOCATION#</a></li>
        	</cfoutput> 
         
        </ul>
      </div>
      <div class="pod">
        <h1 id="latestNewsTitle">latest News</h1>
        <ul>
        	<cfset rsLatestSideNews=application.newsService.getLatestNews(4) />
        	<cfoutput query='rsLatestSideNews' startrow="2">
        		<li><a href="news.cfm?newsID=#FLD_NEWSID#"><strong>#Dateformat(FLD_NEWSCREATIONDATE,'MMM DD')#</strong> - #left(FLD_NEWSTITLE,20)# ...</a></li>
        	</cfoutput> 
        </ul>
      </div>
    </div>
  </div>
  <!---First line to be included in footer.cfm--->
   
</cf_front>