<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teachers</title>
    <link rel="stylesheet" href="bootstrap_style.css">
    <script src="app.js"></script>
</head>
<body>

<%--<%--%>
<%--    final Object loggedIn = request.getSession().getAttribute("loggedIn");--%>
<%--    if (loggedIn == null || ((Boolean) loggedIn) == false) {--%>
<%--        response.sendRedirect("/webapp/log_in.jsp");--%>
<%--    }--%>
<%--%>--%>

<h1>Please Choose</h1>
<form class="d-flex" action="/webapp/logout.jsp">
    <a href="teachers" class="btn btn-primary">Teachers</a>
    <a href="students" class="btn btn-primary">Students</a>
    <button class="btn btn-outline-success" type="submit">LOGOUT</button>
</form>

</body>
</html>
