<%-- 
    Document   : CursosBaja2
    Created on : 25/05/2020, 12:00:52 PM
    Author     : admin
--%>

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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja de cursos</title>
    </head>
    <body>
        <h1>Baja de cursos</h1>
        <%

            int id=Integer.parseInt(request.getParameter("id")); 
            Curso curso=cr.getById(id);
            if(ar.getByCurso(curso).isEmpty()){
                cr.remove(curso);
                out.print("<h3>Se borro el curso!</h3>");
            }else{
                out.print("<h3>No se puede borrar el curso por que contiene Alumnos</h3>");
            }

        %>

        <form action="Cursos.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
