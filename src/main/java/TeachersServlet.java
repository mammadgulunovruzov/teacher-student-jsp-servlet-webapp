import entity.Teacher;
import repository.TeacherRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(urlPatterns = "/teachers",name = "TeachersServlet")
public class TeachersServlet extends HttpServlet {
    private final TeacherRepository teacherRepository=  new TeacherRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        final int id = Integer.parseInt(request.getParameter("id"));

        final String action = request.getParameter("action");
        if("delete".equalsIgnoreCase(action)){

            teacherRepository.delete(id);


        } else if ("update".equalsIgnoreCase(action)) {
            final String name = request.getParameter("name");
            final String surname = request.getParameter("surname");
            final String salary = request.getParameter("salary");


            teacherRepository.update(new Teacher()
                    .setId(id)
                    .setName(name)
                    .setSurname(surname)
                    .setSalary(new BigDecimal(salary)));



        }
        response.sendRedirect("teachers");


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String name = request.getParameter("name");
        final String surname = request.getParameter("surname");
        final String salaryStr = request.getParameter("salary");
        final BigDecimal salary = salaryStr!=null && salaryStr.trim().length()>0?new BigDecimal(salaryStr):null;

        final List<Teacher> list = teacherRepository.getList(name, surname, salary);


        request.setAttribute("teachers", list);


        request.getRequestDispatcher("teacherMain.jsp").forward(request,response);

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
