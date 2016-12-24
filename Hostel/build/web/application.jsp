<%-- 
    Document   : application
    Created on : Dec 21, 2016, 5:24:41 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>

<div class="container">
    <c:choose>
        <c:when test="${empty application}">
            <h3 class="container"> Application Opens Now. Click to apply.</h3>
        </c:when>
        <c:otherwise>
            <div class="container">
                <div class="page-header">
                    <div class="btn-toolbar pull-right">
                        <span style="cursor:pointer;" class="glyphicon glyphicon-plus">
                    </div>
                    <h2> Current Application </h2>
                </div>
                <table class="table table-responsive table-hover" style="display:none;">
                    <tr>
                        <th>Session</th>
                        <th>Block</th>
                        <th>Room No.</th>
                        <th>Room Type</th>
                        <th>Price/Day</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr> 
                </table>
            </div>
        </c:otherwise>

    </c:choose>
    <div class="container">
        <div class="page-header">
            <div class="btn-toolbar pull-right">
                <span style="cursor:pointer;" class="glyphicon glyphicon-plus">
            </div>
            <h2> Room History </h2>
        </div>
        <table class="table table-responsive table-hover" style="display:none;">
            <tr>
                <th>Session</th>
                <th>Block</th>
                <th>Room No.</th>
                <th>Room Type</th>
                <th>Price/Day</th>
                <th>Total</th>
            </tr> 
        </table>
    </div>
</div>
<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        $("span.glyphicon").click(function () {
            if (this.className === "glyphicon glyphicon-plus") {
                $(this).parents(".container").children("table").slideDown("slow");
                $(this).removeClass('glyphicon-plus').addClass('glyphicon-minus');
            } else {
                $(this).parents(".container").children("table").slideUp("slow");
                $(this).removeClass('glyphicon-minus').addClass('glyphicon-plus');
            }
        });
    });
</script>
