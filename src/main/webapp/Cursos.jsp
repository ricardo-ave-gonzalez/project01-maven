<%-- 
    Document   : Cursos
    Created on : 20/05/2020, 06:15:14 PM
    Author     : Ricardo
--%>

<%@page import="ar.com.eduit.curso.java.utils.html.HtmlTable"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%@page import="ar.com.eduit.curso.java.enumerados.Turno"%>
<%@page import="ar.com.eduit.curso.java.enumerados.Semana"%>
<%I_CursoRepository cr= new CursoRepository(Connector.getConnection());%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos</title>
        <link rel="stylesheet" type="text/css" href="styleCursos.css">
    </head>
    <body>
        <h1>Mantenimiento de cursos</h1>
        <div id="main-container">
            <form>
                <table>
                    <tr>
                        <td>Titulo:</td>
                        <td><input type="text" name="titulo"/></td>
                    </tr>
                    <tr>
                        <td>Profesor:</td>
                        <td><input type="text" name="profesor"/></td>
                    </tr>
                    <tr>
                        <td>Dia:</td>
                        <td>
                            <select name="dia" class="menu">
                                <%
                                    for(Semana d:Semana.values()){
                                        out.print(
                                                String
                                                        .format("<option  value='%s'>%s</option>", d.toString(), d.toString().toLowerCase())
                                        );
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Turno:</td>
                        <td>
                            <select name="turno" class="menu">
                                <%
                                        for(Turno t:Turno.values()){
                                            out.print(
                                                    String
                                                            .format("<option  value='%s'>%s</option>", t.toString(), t.toString().toLowerCase())
                                            );
                                        }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="Borrar" class="button green"/></td>
                        <td><input type="submit" value="Agregar" class="button green"/></td>
                    </tr>
                </table>
            </form>
        </div>
    <%
        try {
                String titulo=request.getParameter("titulo");
                String profesor=request.getParameter("profesor");
                Semana dia=Semana.valueOf(request.getParameter("dia"));
                Turno turno=Turno.valueOf(request.getParameter("turno"));
                if(titulo!=null  && titulo.length()>=3     && titulo.length()<=20 &&
                profesor!=null   && profesor.length()>=3   && profesor.length()<=20
                ) {
                     
                     Curso curso = new Curso(titulo, profesor, dia, turno);
                     cr.save(curso);
                     out.println("<h3>Se ingreso un curso id: " +curso.getId()+"</h3>");
                }else{
                    out.println("<h3>Falta completar parametros</h3>");
                }
            } catch (Exception e) {
                out.println("<h3>Falta completar parametros</h3>");
            }
    %> 
            <form id="form2">
                Buscar Titulo:
                <input type="text" name="buscarTitulo"/>
                <input type="text" name="buscarProfe"/>
                <input type="submit" values="buscar" class="button green"/>
            </form>
    <%
        String buscarTitulo = request.getParameter("buscarTitulo");
        String buscarProfe = request.getParameter("buscarProfe");
        if (buscarTitulo == null || buscarProfe == null) 
                out.println(new HtmlTable<Curso>().getTable(cr.getAll(),"CursosBaja.jsp","CursosUpdate.jsp"));
                else
                    out.println(new HtmlTable<Curso>()
                            .getTable(
                            cr.getLikeTituloAndProfesor(buscarTitulo, buscarProfe),"CursosBaja.jsp","CursosUpdate.jsp"));
    %>    
    </body>
</html>
