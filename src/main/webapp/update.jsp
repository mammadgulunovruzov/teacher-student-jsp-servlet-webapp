<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 9/30/2022
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="repository.TeacherRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Teacher" %>
<%@ page import="java.math.BigDecimal" %><%--
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
<h1>Teachers Update</h1>
<%
  TeacherRepository teacherRepository = new TeacherRepository();
  final String action = request.getParameter("action");
  final Integer id = Integer.parseInt(request.getParameter("id"));
  if("update".equalsIgnoreCase(action)){
    final String name = request.getParameter("name");
    final String surname = request.getParameter("surname");
    final String salary = request.getParameter("salary");


    teacherRepository.update(new Teacher()
            .setId(id)
            .setName(name)
            .setSurname(surname)
            .setSalary(new BigDecimal(salary)));


    response.sendRedirect("teachers");


  }
  final Teacher teacher = teacherRepository.getById(id);
%>
<form id="form" class="col-3 m-lg-3" action="update.jsp" method="post">
  <div class="mb-3">
    <label class="form-label" for="name">
      name
    </label>

    <input class="form-control" name="name" id="name" type="text" value="<%=teacher.getName() %>"/>
  </div>
  <div class="mb-3">
    <label class="form-label" for="surname">
      surname
    </label>

    <input class="form-control" name="surname" id="surname" type="text"  value="<%=teacher.getSurname() %>"/>
  </div>
  <div class="mb-3">
    <label class="form-label" for="salary">
      salary
    </label>

    <input class="form-control" name="salary" id="salary" type="text"  value="<%=teacher.getSalary() %>"/>
  </div>

  <input type="hidden" name="action" value="update"/>
  <input type="hidden" name="id" value="<%=id%>"/>
  <button class="btn btn-primary">UPDATE</button>
</form>
<br/>
<br/>
<br/>

</body>
</html>

