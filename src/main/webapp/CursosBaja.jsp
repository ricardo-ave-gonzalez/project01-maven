<%-- 
    Document   : CursosBaja
    Created on : 25/05/2020, 11:42:36 AM
    Author     : admin
--%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
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
            out.println("<h3>Desea borrar el curso "+curso.getId()+", "+curso.getTitulo()+", "+
                    curso.getProfesor()+", "+curso.getDia()+", "+curso.getTurno()+" ?</h3>");
        %>
        <form action="CursosBaja2.jsp">
            <input type="text" name="id" readonly="true" hidden="true" 
                   value="<% out.print(id); %>" />
            <input type="submit" value="Borrar"/>
        </form>
        <form action="Cursos.jsp">
            <input type="submit" value="No Borrar"/>
        </form>
    </body>
</html>
