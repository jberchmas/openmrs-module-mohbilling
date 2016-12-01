<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>

<openmrs:htmlInclude
	file="/moduleResources/@MODULE_ID@/scripts/jquery-1.3.2.js" />
<openmrs:htmlInclude file="/scripts/calendar/calendar.js" />
<%@ include file="templates/mohBillingLocalHeader.jsp"%>
<%@ include file="templates/mohBillingReportHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	var $bill = jQuery.noConflict();
	$bill(document).ready(function(){
		$bill('.meta').hide();
		$bill('#submitId').click(function() {
			$bill('#formStatusId').val("clicked");
		});
		$bill("input#print_button").click(function() {
			$bill('.meta').show();
			$bill("div.printarea").printArea();
			$bill('.meta').hide();
		});

	});
</script>


<style>
.insurances, .thirdParties,.time,.billCreator,.billStatus,.services,.deposit {
    display: none;
}
a.print {
    border: 2px solid #009900;
    background-color: #aabbcc;
    color: #ffffff;
    text-decoration: none;
}
</style>

<h2>
	Cashier Daily Report
</h2>

<c:import url="mohBillingReportParameters.jsp" />

<c:if test="${empty paidServiceRevenues }">
 <div style="text-align: center;color: red;"><p>No payments found!</p></div>
</c:if>

<c:if test="${not empty paidServiceRevenues }">
<br/>
<b class="boxHeader">
${reportMsg} : <b style="color: black;font: bold;"><fmt:formatNumber value="${totalReceivedAmount}" type="number" pattern="#.##"/> FRW</b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<a href="#" class="print">PDF</a></b>
<div class="box">
<table style="width:70%">
	<tr>
		<th class="columnHeader">#.</th>
		<th class="columnHeader">Service Name</th>	
		<th class="columnHeader">Due Amount</th>
	</tr>

	<c:forEach items="${paidServiceRevenues}" var="psr" varStatus="status">
	<c:if test="${psr.paidAmount != 0 }">
	<tr>
	<td class="rowValue ${(status.count%2!=0)?'even':''}">${status.count}.</td>
	<td class="rowValue ${(status.count%2!=0)?'even':''}"> ${psr.service }</td>
	<td class="rowValue ${(status.count%2!=0)?'even':''}"><fmt:formatNumber value="${psr.paidAmount}" type="number" pattern="#.##"/></td>
	</tr>
	</c:if>
	</c:forEach>
</table>
</div>
</c:if>


<%@ include file="/WEB-INF/template/footer.jsp"%>