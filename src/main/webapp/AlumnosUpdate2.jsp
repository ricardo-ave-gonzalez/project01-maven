<%-- 
    Document   : AlumnosUpdate2
    Created on : 4/06/2020, 11:33:36 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alumnos Update</title>
    </head>
    <body>
        <h1>Alumnos Update</h1>
        <%
            Alumno alumno=new Alumno(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("nombre"),
                    request.getParameter("apellido"),
                    Integer.parseInt(request.getParameter("edad")),
                    Integer.parseInt(request.getParameter("idCurso")));
                    
            ar.update(alumno);
        %>
        <h3>Se actualizo un alumno!</h3>
        <form action="Alumnos.jsp">
            <input type="submit" value="Volver"/>                    
        </form>         
    </body>
</html>
