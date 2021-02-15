<!--- Declare the array --->
<cfset arrayIntElements =[1,2,4,3,3] />
<cfset  arrayStringElements=["first", "SECOND"] />

<!--- ARRAY APPEND ---> 
<p>ARRAY APPEND Element</p>
<cfset arrayAppend(arrayIntElements,0 )/>
<cfdump var='#arrayIntElements#' />
<!--- ARRAY APPEND INSIDE OF THE ARRAY --->
<p>ARRAY APPEND INSIDE OF THE ARRAY Elements</p>
<cfset ArrayAppend(arrayIntElements,[6,7,9,8,5],true) />
<cfdump var='#arrayIntElements#' label='ARRAY APPEND' />

<!--- average of array elements --->
<p>average of array elements</p>
<cfset average=arrayAvg(arrayIntElements) />
<cfdump var='#average#' label='average of array elements' />
</br>

<!--- Array Contains ---> 
<p>Array Contains Element</p>
<cfdump var='#arrayContains(arrayIntElements,2)#' label='Array Contains' />
<cfdump var='#arrayIntElements.contains(2)#' label='Array Contains' />
</br>
<!--- Array Contains NO Case---> 
<p>Array Contains NO Case </p>
<cfdump var='#arrayContains(arrayStringElements,'FIRST')#' label='Array Contains NO Case' />
<cfdump var='#arrayStringElements.contains("First")#' label='Array Contains NOcase' />
</br>

<!--- Array Delete Element---> 
<p>Array Delete Element</p>
<cfdump var='#arraydelete(arrayIntElements,3)#' label='Array Delete Element' />
<cfdump var='#arrayStringElements.delete("LAST")#' label='Array Contains NOcase' />
</br>


<!--- Clear the array --->
<p> Clear the array</p>
<cfset arrayClear(arrayIntElements) />
<cfdump var='#arrayIntElements#' label='Clear the array ' />