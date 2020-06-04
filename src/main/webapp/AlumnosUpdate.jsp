<%-- 
    Document   : AlumnosUpdate
    Created on : 4/06/2020, 10:42:18 AM
    Author     : Ricardo
--%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%I_AlumnoRepository ar = new AlumnoRepository(Connector.getConnection());%>
<%I_CursoRepository cr = new CursoRepository(Connector.getConnection());%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Alumnos</title>
    </head>
    <body>
        <h1>Update Alumnos</h1>
        <% Alumno alumno = ar.getById(Integer.parseInt(request.getParameter("id")));%> <%-- Tengo el objeto alumno --%>
        <form action="AlumnosUpdate2.jsp">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<% out.print(alumno.getId()); %>" readonly/></td> <%-- readonly es solo lectura --%>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<% out.print(alumno.getNombre()); %>"/></td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td><input type="text" name="apellido" value="<% out.print(alumno.getApellido()); %>"/></td>
                </tr>
                <tr>
                    <td>Edad</td>
                    <td><input type="number" name="edad" value="18"/></td>
                </tr>
                <tr>
                    <td>Curso</td>
                    <td>
                        <select name="idCurso">
                            <%
                                for (Curso c : cr.getAll()) {
                                    out.println("<option value=" + c.getId() + ">" + c.getId() + ", " + c.getTitulo() + ", "
                                            + c.getProfesor() + ", " + c.getDia() + ", " + c.getTurno() + "</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Modificar"/></td>
                    <td></td>
                </tr>
            </table>
        </form>
        <form action="Alumnos.jsp">
            <input type="submit" value="Volver"/>                    
        </form>                
    </body>
</html>
