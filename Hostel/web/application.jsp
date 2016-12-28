<%-- 
    Document   : application
    Created on : Dec 21, 2016, 5:24:41 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>

<div class="container">
    <h2>Next-Year Application</h2>
    <form id="form" class="form-group">
        <label for="roomtype" >Room Type</label>

        <select id="roomtype" name="roomtype" class="inline-control">
        </select>

        <label for="block"  >Block </label>
        <select id="block" name="block" class="inline-control">
        </select>

        <label for="room" >Room Number</label>
        <select id="room" name="room" class="inline-control">
        </select>

        <input type="submit" class="inline-control  btn btn-success">

    </form>
    <div class="container">
        <div class="page-header">
            <h2 class="clickable-header" data-toggle="tooltip" title="Click to show more." style="cursor:pointer;">
                Current Application
                <span style="font-size:20px;" class="glyphicon glyphicon-chevron-down">
            </h2>
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
    <div class="container">
        <div class="page-header">
            <h2 class="clickable-header" data-toggle="tooltip" title="Click to show more." style="cursor:pointer;">
                Room History
                <span style="font-size:20px;" class="glyphicon glyphicon-chevron-down">
            </h2>
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
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
        $("h2.clickable-header").click(function(){
            if ($(this).children("span").attr("class") === "glyphicon glyphicon-chevron-down"){
                $(this).parents(".container").children("table").slideDown("slow");
                $(this).children("span").removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
            }
            else{
                $(this).parents(".container").children("table").slideUp("slow");
                $(this).children("span").removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
            }
        });
    });
</script>
