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
            <div class="btn-toolbar pull-right">
                <span style="cursor:pointer;" class="glyphicon glyphicon-plus">
            </div>
            <h2>Current Application</h2>
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
    $(document).ready(function() {
        $("span.glyphicon").click(function(){
            if (this.className === "glyphicon glyphicon-plus"){
                $(this).parents(".container").children("table").slideDown("slow");
                $(this).removeClass('glyphicon-plus').addClass('glyphicon-minus');
            }
            else{
                $(this).parents(".container").children("table").slideUp("slow");
                $(this).removeClass('glyphicon-minus').addClass('glyphicon-plus');
            }
        });
    });
</script>
