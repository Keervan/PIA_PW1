<%-- 
    Document   : Registrar
    Created on : 28/11/2020, 11:33:48 PM
    Author     : dykeo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Registrarse</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container-sm">
            <div class="row">
                
                <form class="col-12" action="RegistrarController" method="POST">
                    <div class="form-group">
                        <label for="nombUsua">Nombre de usuario</label>
                        <input type="text" class="form-control" name="nombUsua" id="nombUsua" 
                               placeholder="Ingrese un nombre de usuario" required>
                        <small class="form-text text-muted">De 3 a 25 caracteres.</small>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo electrónico</label>
                        <input type="email" class="form-control" name="correo" id="correo" 
                               placeholder="Ingrese un correo electrónico" required>
                    </div>
                    <div class="form-group">
                        <label for="contra">Contraseña</label>
                        <input type="password" class="form-control" name="contra" id="contra"
                               placeholder="Ingrese una contraseña" required>
                    </div>
                    <button class="btn btn-primary btn-sm btn-rounded" type="submit">Registrarse</button>
                </form>
                
            </div>
        </div>
    </body>
</html>
