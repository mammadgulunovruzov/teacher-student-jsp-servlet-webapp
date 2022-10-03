<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10/3/2022
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="bootstrap_style.css">
    <script src="app.js"></script>
</head>
<body class="text-capitalize">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item" onclick="foo()">
                    <a class="nav-link" href="#">Teachers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Students</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<h1>Login</h1>
<%
    final String action = request.getParameter("action");
    if("login".equalsIgnoreCase(action)){
        final String email = request.getParameter("email");
        final String password = request.getParameter("password");

        if(email.equalsIgnoreCase("m@gmail.com") && password.equalsIgnoreCase("111")){
            request.getSession().setAttribute("loggedIn",true);
            response.sendRedirect("/webapp/");
        }
    }
%>
<form id="form" class="col-3 m-lg-3" method="get">
    <div class="mb-3">
        <label class="form-label" for="email">
            email
        </label>

        <input class="form-control" name="email" id="email" type="text"/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="password">
            password
        </label>

        <input class="form-control" name="password" id="password" type="password"/>
    </div>


    <input type="hidden" name="action" value="login">
    <button class="btn btn-primary">LOGIN</button>
</form>

</body>
</html>








