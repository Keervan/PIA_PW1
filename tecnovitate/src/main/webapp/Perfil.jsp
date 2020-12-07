<%-- 
    Document   : Si
    Created on : 29/11/2020, 03:34:50 AM
    Author     : dykeo
--%>

<%@page import="com.mycompany.tecnovitate.Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario sesion = (Usuario) session.getAttribute("logIn");
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Perfil</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <div class="row">
                
                <h1 class="col-12 text-center"><br>Bienvenido<br></h1>
                <div id="carouselExampleControls" class="carousel slide col-12" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%= sesion.getPath()%>" class="rounded mx-auto d-block w-5 h-5" alt="...">
                        </div>
                    </div>
                </div>
                <div class="container-md justify-content-md-center">
                    <h3 class="col-12 text-center"><br>Nombre Usuario: <%= sesion.getNombre_Usua()%></h3>
                    <h3 class="col-12 text-center"><br>Correo: <%= sesion.getEmail()%></h3>
                    <h3 class="col-12 text-center"><br>Redes Sociales: <% if (sesion.getRedes() != null) {%><%= sesion.getRedes()%><% } %></h3>
                    <h3 class="col-12 text-center"><br>Descripción: <% if (sesion.getDescripcion() != null) {%><%= sesion.getDescripcion()%><% }%><br></h3>
                </div>
                
                <div>
                    
                </div>
                    <div class="container px-4">
                        <div class="row justify-content-md-center">
                            <div class="btn-group">
                                <form action="editUsuaController">
                                <input type="submit" class="btn btn-primary " value="Editar Información">
                                </form>
                            </div>
                            <div class="btn-group">
                                <form action="FavoritosController" >
                                    <input type="submit" class="btn btn-info " value="Favoritos ">
                                    <input type="hidden" name="idUser" value="<%= sesion.getIdUsua()%>">
                                </form>
                            </div>
                            <div class="btn-group">
                                <form action="CerrarSesion" method="POST" >
                                    <input type="submit" class="btn btn-danger " value="Cerrar Sesión">
                                </form>
                            </div>
                        
                         </div>
                    </div>
                
            </div>
        </div>
    </body>
</html>
