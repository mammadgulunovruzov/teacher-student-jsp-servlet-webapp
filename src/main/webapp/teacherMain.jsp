<%@ page import="repository.TeacherRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Teacher" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 9/30/2022
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teachers</title>
    <link rel="stylesheet" href="bootstrap_style.css">
    <script src="app.js"></script>
</head>
<%--<%--%>
<%--    final Object loggedIn = request.getSession().getAttribute("loggedIn");--%>
<%--    if(loggedIn==null || ((Boolean)loggedIn)==false){--%>
<%--        response.sendRedirect("/webapp/log_in.jsp");--%>
<%--    }--%>
<%--%>--%>
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
            <form class="d-flex" >
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <form class="d-flex" action="/webapp/logout.jsp">
                <button class="btn btn-outline-success" type="submit">LOGOUT</button>
            </form>
        </div>
    </div>
</nav>
<h1>Teachers</h1>

<form id="form" class="col-3 m-lg-3" method="get">
    <div class="mb-3">
        <label class="form-label" for="name">
            name
        </label>

        <input class="form-control" name="name" id="name" type="text"/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="surname">
            surname
        </label>

        <input class="form-control" name="surname" id="surname" type="text"/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="salary">
            salary
        </label>

        <input class="form-control" name="salary" id="salary" type="text"/>
    </div>

    <button class="btn btn-primary">SEARCH</button>
</form>
<br/>
<br/>
<br/>
<div>
    <table class="table">
        <thead>
        <tr>
            <th>name</th>
            <th>surname</th>
            <th>salary</th>
            <th>university</th>
            <th>actions</th>
        </tr>
        </thead>
        <tbody>

        <%
            final List<Teacher> list = (List<Teacher>) request.getAttribute("teachers");

            for(Teacher teacher:list){


        %>
        <tr>
            <td>
                <%
                    out.print(teacher.getName());
                %>
            </td>
            <td>
                <%
                    out.print(teacher.getSurname());
                %>
            </td>
            <td>
                <%
                    out.print(teacher.getSalary());
                %>
            </td>
            <td>
                <%
                    out.print(teacher.getUniversity().getId());
                %>
            </td>
            <td>
                    <a href="teachers/delete?id=<%=teacher.getId()%>" class="btn btn-danger" >Delete</a>
            </td>
            <td>
                <a href="teachers/update?<%out.print("id="+teacher.getId());%>">
                <button class="btn btn-warning">Update</button>
                </a>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>

</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure to delete?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

