<%@page import="hibernate.Usuario"%>
<%@page import="hibernate.Keep"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Keep> lista = (List<Keep>)request.getAttribute("listado");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notas de <%= request.getParameter("login") %></title>
    </head>
    <body>
        <h1>Notas de <%= request.getParameter("login") %></h1>
        <h2><a href="addkeep.jsp?login=<%= request.getParameter("login") %>">Crear nota</a></h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Usuario</th>
                    <th>Contenido</th>
                    <th>Id Android</th>
                    <th>Estado</th>
                    <th>Editar</th>
                    <th>Estado Borrado</th>
                    <th>Estado Estable</th>
                    <th>Borrar definitivo</th>
                </tr>
            </thead>
            <tbody>
                <%
                for(Keep p: lista){
                    String contenido= p.getContenido().replace("|", " ");
                    %>
                    <tr>
                        <td><%= p.getId()%></td>
                        <td><%= p.getUserName()%></td>
                        <td><%= contenido%></td>
                        <td><%= p.getIdAndroid()%></td>
                        <td><%= p.getEstado()%></td>
                        <td><a href="editkeep.jsp?id=<%= p.getId() %>&login=<%= request.getParameter("login") %>&contenido=<%= contenido %>&idAndroid=<%= p.getIdAndroid() %>">Editar</a></td>
                        <td><a href="go?tabla=keep&origen=web&op=delete&accion=&id=<%= p.getId() %>&contenido=<%= contenido %>&idAndroid=<%= p.getIdAndroid() %>&login=<%= request.getParameter("login") %>" class="borrar">Marcar</a></td>
                        <td><a href="go?tabla=keep&origen=web&op=restore&accion=&id=<%= p.getId() %>&contenido=<%= contenido %>&idAndroid=<%= p.getIdAndroid() %>&login=<%= request.getParameter("login") %>" class="borrar">Restaurar</a></td>
                        <td><a href="go?tabla=keep&origen=web&op=truedelete&accion=&id=<%= p.getId() %>&contenido=<%= contenido %>&idAndroid=<%= p.getIdAndroid() %>&login=<%= request.getParameter("login") %>" class="borrar">Borrar</a></td>       
                    </tr>
                    <%
                }
                %>               
            </tbody>
        </table>
    </body>
</html>
