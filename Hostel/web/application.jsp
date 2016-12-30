<%-- 
    Document   : application
    Created on : Dec 21, 2016, 5:24:41 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>

<div class="container">


    <div class="alert alert-success ">Application for new year is <strong>open</strong> now! Click <a href="InsertApplicationServlet">here</a> to apply.</div>     

    <div class="container hidden">
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
    <div class="container" id="roomHistory">
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
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
        $("h2.clickable-header").click(function () {
            if ($(this).children("span").attr("class") === "glyphicon glyphicon-chevron-down") {
                $(this).parents(".container").children("table").slideDown("slow");
                $(this).children("span").removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
            } else {
                $(this).parents(".container").children("table").slideUp("slow");
                $(this).children("span").removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
            }
        });
    });
</script>


<script>

    $("#roomtype").change(function () {
        var roomtype = $("#roomtype").val();

        $.post("PopulateRoomServlet", {type: roomtype}, function () {
            $("#block").load(" #block>*");
        });

        $("#block").removeAttr("disabled");
    });

    $("#block").change(function () {
        var block = $("#block").val();
        var roomtype = $("#roomtype").val();

        $.post("PopulateRoomServlet", {type: roomtype, block: block}, function () {
            $("#room").load(" #room>*");
        });

        $("#room").removeAttr("disabled");
    });

    $(function () {
        setInterval(function () {
            var room = $("#room").val();

            if (room !== null) {
                $("#submit").removeAttr("disabled");
            } else {
                $("#submit").attr("disabled", "disabled");
            }
        }, 2000)
    });

</script>