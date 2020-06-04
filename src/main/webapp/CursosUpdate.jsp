<%-- 
    Document   : CursosUpdate
    Created on : 25/05/2020, 12:34:46 PM
    Author     : Ricardo
--%>

<%@page import="ar.com.eduit.curso.java.enumerados.Turno"%>
<%@page import="ar.com.eduit.curso.java.enumerados.Semana"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_CursoRepository cr = new CursoRepository(Connector.getConnection()); %> <%-- Tengo el objeto cursos --%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Cursos</title>
    </head>
    <body>
        <h1>Update Cursos</h1>
        <% Curso curso = cr.getById(Integer.parseInt(request.getParameter("id"))); %>
        <table>
            <form action="CursosUpdate2.jsp"> 
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<% out.print(curso.getId()); %>" readonly/></td>
                </tr>
                <tr>
                    <td>Titulo:</td>
                    <td><input type="text" name="titulo" value="<% out.print(curso.getTitulo()); %>"/></td>
                </tr>
                <tr>
                    <td>Profesor:</td>
                    <td><input type="text" name="profesor" value="<% out.print(curso.getProfesor()); %>" /></td>
                </tr>
                <tr>
                    <td>Dia:</td>
                    <td>
                        <select name="dia">
                            <%
                                for (Semana d : Semana.values()) {
                                    if (d == curso.getDia()) {
                                        out.print(
                                                String
                                                        .format("<option value='%s' selected>%s</option>", d.toString(), d.toString().toLowerCase())
                                        );
                                    } else {
                                        out.print(
                                                String
                                                        .format("<option value='%s'>%s</option>", d.toString(), d.toString().toLowerCase())
                                        );
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Turno</td>
                    <td>
                        <select name="turno">
                            <%
                                for (Turno t : Turno.values()) {
                                    if (t == curso.getTurno()) {
                                        out.print(
                                                String
                                                        .format("<option value='%s' selected>%s</option>", t.toString(), t.toString().toLowerCase())
                                        );
                                    } else {
                                        out.print(
                                                String
                                                        .format("<option value='%s'>%s</option>", t.toString(), t.toString().toLowerCase())
                                        );
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Modificar"/></td>
                    <td>

                    </td>
                </tr>
            </form>
        </table>
        <form action="Cursos.jsp">
            <input type="submit" value="Volver"/>                    
        </form>
    </body>
</html>
