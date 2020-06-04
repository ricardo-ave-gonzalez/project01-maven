<%-- 
    Document   : AlumnosBaja2
    Created on : 26/05/2020, 12:06:09 PM
    Author     : Ricardo
--%>
<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
<%I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja de alumnos</title>
    </head>
    <body>
        <h1>Baja de alumnos</h1>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            ar.remove(ar.getById(id));
            out.println("<h3>Se borro un alumno!</h3>");
        %>
        
        <form action="Alumnos.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
