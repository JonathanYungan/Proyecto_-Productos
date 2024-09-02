<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Producto</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        color: #333;
    }
    .info {
        margin: 20px 0;
        padding: 10px;
        background-color: #e9f5e9;
        border: 1px solid #c7eb7a;
        border-radius: 4px;
    }
    .info strong {
        display: block;
        margin-bottom: 10px;
        font-size: 1.2em;
    }
    button {
        padding: 10px 20px;
        font-size: 1em;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin: 10px;
        transition: background-color 0.3s, transform 0.3s;
    }
    button:hover {
        background-color: #c7eb7a;
        transform: scale(1.05);
    }
    .btn-submit {
        background-color: #ff4d4d;
        color: white;
    }
    .btn-cancel {
        background-color: #4CAF50;
        color: white;
    }
    .btn-cancel:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Eliminar Producto</h1>
    <div class="info">
        <strong>Detalles del Producto:</strong>
        <p><strong>ID de Producto:</strong> ${productos.idProducto}</p>
        <p><strong>Nombre:</strong> ${productos.nombre}</p>
        <p><strong>Descripción:</strong> ${productos.descripcion}</p>
        <p><strong>Precio:</strong> ${productos.precio}</p>
        <p><strong>Stock:</strong> ${productos.stock}</p>
    </div>

    <form action="del" method="get">
        <input type="hidden" id="idProducto" name="idProducto" value="${productos.idProducto}" />
        
        <strong>¿Desea eliminar este dato?</strong>
        <br/>
        
        <button type="submit" class="btn-submit">Eliminar</button>
        
        <button type="button" class="btn-cancel" onclick="window.location.href='/ProyectoWeb/productos/findAll';">Cancelar</button>
    </form>
</div>

</body>
</html>
