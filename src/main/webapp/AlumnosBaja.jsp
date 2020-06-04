<%-- 
    Document   : AlumnosBaja
    Created on : 26/05/2020, 11:45:40 AM
    Author     : Ricardo
--%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%I_AlumnoRepository ar= new AlumnoRepository(Connector.getConnection());%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja de Alumnos</title>
    </head>
    <body>
        <h1>Baja de Alumnos</h1>
        
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Alumno alumno = ar.getById(id);
            out.println("<h3>Desea borrar el alumno "+alumno.getId()+", "+alumno.getNombre()+", "+
                    alumno.getApellido()+", "+alumno.getEdad()+", "+alumno.getIdCurso()+" ?</h3>");
        %>
        <form action="AlumnosBaja2.jsp">
            <input type="text" name="id" readondy="true" hidden="true"
                   value="<% out.print(id);%>"/>
            <input type="submit" value="borrar"/>
        </form>
            <form action="Alumnos.jsp">
                <input type="submit" value="No Borrar"/>
            </form>    
    </body>
</html>
