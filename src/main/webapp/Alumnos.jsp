<%-- 
    Document   : Alumnos.jsp
    Created on : 26/05/2020, 10:12:00 AM
    Author     : Ricardo
--%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.utils.html.HtmlTable"%>
<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.connector.Connector"%>
<%I_AlumnoRepository ar= new AlumnoRepository(Connector.getConnection());%>
<%I_CursoRepository cr= new CursoRepository(Connector.getConnection());%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styleCursos.css">
        <title>Alumnos</title>
    </head>
    <body>
        <h1>Registro de Alumnos</h1>
        <div id="main-container">
            <form>
                <table>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre"/></td>
                    </tr>
                    <tr>
                        <td>Apellido</td>
                        <td><input type="text" name="apellido"/></td>
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
                                    for(Curso c:cr.getAll()){
                                        out.println("<option value="+c.getId()+">"+c.getId()+", "+c.getTitulo()+", "+
                                                c.getProfesor()+", "+c.getDia()+", "+c.getTurno()+"</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                            <td><input type="reset" value="Borrar" class="button green"/></td>
                            <td><input type="submit" value="Agregar" class="button green"></td>
                    </tr>
                </table>
            </form>
        </div>
        <%
            try {
                    String nombre=request.getParameter("nombre");
                    String apellido=request.getParameter("apellido");
                    int edad=Integer.parseInt(request.getParameter("edad"));
                    int idCurso=Integer.parseInt(request.getParameter("idCurso"));
                    if (nombre!=null && nombre.length()>3 && nombre.length()<20 &&
                        apellido!=null && apellido.length()>3 && apellido.length()<20 &&
                        edad>=18 && edad<=65){
                            Alumno alumno = new Alumno(nombre, apellido, edad, idCurso);
                            ar.save(alumno);
                            out.println("<h3>Se ingreso un alumno id: "+alumno.getId()+"</h3>");
                        }else{
                        out.println("<h3>Falta completar parametros</h3>");
                    }
                
                } catch (Exception e) {
                   out.println("<h3>Falta completar parametros</h3>"); 
                }
        %>    
            
            <form id="form2">
                Buscar Apellido:
                <input type="text" name="buscarApellido"/>
                <input type="submit" values="buscar" class="button green"/>
            </form>
        <%
            String buscarApellido = request.getParameter("buscarApellido");
            if (buscarApellido == null) 
                    out.println(new HtmlTable<Alumno>().getTable(ar.getAll(),"AlumnosBaja.jsp","AlumnosUpdate.jsp"));
                    else
                        out.println(new HtmlTable<Alumno>()
                                .getTable(
                                ar.getLikeApellido(buscarApellido),"AlumnosBaja.jsp","AlumnosUpdate.jsp"));
        %>    
        
    </body>
</html>
