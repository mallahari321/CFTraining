<cf_front title='HD STREET - AGENDA' >
<div id="pageBody">
    <div id="calendarContent">
    	<cfif isDefined('url.eventID')>
    		<cfquery datasource="cfTraining" name='rsCurrentEvents'>
    			Select * from TBL_EVENTS where FLD_EVENTID=#eventID# order by FLD_EVENTDATETIME 
    		</cfquery>
    		<cfoutput query="rsCurrentEvents">
    			<h1>#FLD_EVENTNAME#</h1>
    			#FLD_EVENTDESCRIPTION#
    			
    			<a href="agenda.cfm">Back to the Agenda</a>
    		</cfoutput>
    		<cfelse>
    		
<h1> Agenda</h1>
      <!---Chapter 4 - Delete From HERE--->
      <cfquery  name='rsCurrentEvents'>
      	select * from TBL_EVENTS
      <!--- where FLD_EVENTDATETIME =  #now()# --->	
      	order by FLD_EVENTDATETIME asc
      </cfquery>
      
      <p>&nbsp;</p>
     <table class='table'>
      	<cfif rsCurrentEvents.RecordCount gt 0>
      	<cfoutput query='rsCurrentEvents'>
       	<tr>
       		<th> #Dateformat(FLD_EVENTDATETIME,'MMM DD YYYY')#</th>
       		<td> #FLD_EVENTNAME# - #FLD_EVENTLOCATION# (#FLD_EVENTVENUE#) </td>
       		<td><a href='agenda.cfm?eventID=#FLD_EVENTID#'>Read More </a></td>
       	</tr>
       </cfoutput>
        <cfelse>
        <cfoutput >
        	<tr> No Events Found.</tr>
        </cfoutput>
       </cfif>
      </table>
       
       <p>&nbsp;</p>
      <!---Chapter 4 - To HERE--->
      	</cfif>
</div>
    <div id="calendarSideBar">
    	<cfif rsCurrentEvents.recordCount EQ 0>
    		<p> Sorry, There is no events to display.</p>
    		<cfelse>
    		<cfoutput> 
     <h1>Next Event</h1>
      <div id="EventDetails">
        <p id="eventDate">
        	<span id="month">#lsDateformat(rsCurrentEvents.FLD_EVENTDATETIME,'MMM')#</span>
        	 <span id="days">#lsDateformat(rsCurrentEvents.FLD_EVENTDATETIME,'DD')#</span></p>
        <h2>#rsCurrentEvents.FLD_EVENTNAME# - #rsCurrentEvents.FLD_EVENTLOCATION#</h2>
      </div>
      <p>#rsCurrentEvents.FLD_EVENTDESCRIPTION# </p>
      <p class="alignRight"><a href="agenda.cfm?eventID=#rsCurrentEvents.FLD_EVENTID#">Read More</a></p>
      </cfoutput>
      </cfif>
</div>
  </div>
   </cf_front>
