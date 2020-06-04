<%-- 
    Document   : CursosUpdate2
    Created on : 25/05/2020, 12:28:02 PM
    Author     : Ricardo
--%>

<%@page import="ar.com.eduit.curso.java.enumerados.Turno"%>
<%@page import="ar.com.eduit.curso.java.enumerados.Semana"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_CursoRepository cr = new CursoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos Update</title>
    </head>
    <body>
        <h1>Cursos Update</h1>
        <%
            Curso curso=new Curso(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("titulo"),
                    request.getParameter("profesor"),
                    Semana.valueOf(request.getParameter("dia")),
                    Turno.valueOf(request.getParameter("turno"))
            );
            cr.update(curso);
        %>
        <h3>Se actualizo un curso!</h3>
        <form action="Cursos.jsp">
            <input type="submit" value="Volver"/>                    
        </form>
    </body>
</html>
