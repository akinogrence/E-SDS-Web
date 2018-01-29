<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Admin Panel</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid">
            <jsp:include page="personnels.jsp"/>
            <jsp:include page="customers.jsp"/>
            <jsp:include page="visits.jsp"/>
            <jsp:include page="orders.jsp"/>

            <c:if test="${not empty personnelList}">
                <button class="btn btn-info pull-right" style="cursor: pointer;" data-toggle="modal" data-target="#modalAddPersonnel"><i class="fa fa-plus" aria-hidden="true"></i></button>
                </c:if>

            <c:if test="${not empty customerList}">
                <button class="btn btn-info pull-right" style="cursor: pointer;" data-toggle="modal" data-target="#modalAddCustomer"><i class="fa fa-plus" aria-hidden="true"></i></button>
                </c:if>

            <c:if test="${not empty visitList}">
                <button class="btn btn-info pull-right" style="cursor: pointer;" data-toggle="modal" data-target="#modalAddVisit"><i class="fa fa-plus" aria-hidden="true"></i></button>
                </c:if>

            <c:if test="${(empty personnelList) and (empty customerList) and (empty visitList) and (empty orderList)}">
                <div id="donutchart" style="margin: auto; width: 900px; height: 500px;"></div>
            </c:if>
        </div>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            var arr = [];
            $.post("chart",
                    {
                        id: 1
                    },
                    function (data, status) {
                        arr = JSON.parse(data);
                        console.log(arr);
                    });

            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable(arr);

                var options = {
                    title: 'En Yüksek Sipariş Alan 10 Personel',
                    pieHole: 0.3
                };

                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);
            }
        </script>
    </body>
</html>
