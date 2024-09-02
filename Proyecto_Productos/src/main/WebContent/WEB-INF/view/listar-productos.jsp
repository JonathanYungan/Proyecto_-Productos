<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Georgia', serif;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #fff;
            background: linear-gradient(90deg, #8fd3c1, #81c3d7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 128, 0, 0.5);
            animation: fadeIn 1s ease-in-out, bounce 1.5s infinite;
            font-family: 'Georgia', serif;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        .search-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
        }
        .search-container input {
            width: 300px;
            margin-right: 10px;
            transition: all 0.3s ease;
            font-family: 'Georgia', serif;
        }
        .search-container input:focus {
            box-shadow: 0px 0px 10px #007bff;
        }
        .table-container {
            background: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }
        .table-scroll {
            max-height: 400px;
            overflow-y: auto;
        }
        .table-striped tbody tr:hover {
            background-color: #c7eb7a !important;
        }
        .btn-primary, .btn-success, .btn-danger {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .btn-primary:hover, .btn-success:hover, .btn-danger:hover {
            transform: scale(1.05);
        }
        .btn-primary {
            background-color: #007bff;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-danger {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<section class="px-5 py-5">
    <div class="container">
        <h1>Productos</h1>
        <div class="search-container">
            <input type="text" id="searchInput" class="form-control" placeholder="Buscar en la tabla...">
            <button class="btn btn-primary" onclick="window.location.href='/ProyectoWeb/productos/findOne?opcion=1'; return false;">
                <i class="fa-solid fa-plus"></i> Agregar
            </button>
        </div>
     
        <div class="table-container">
            <div class="table-scroll">
                <table id="tablaProductos" 
                       class="table table-striped table-sm"
                       data-pagination="true"
                       data-page-list="[5, 10, 20, 50]">
                    <thead>
                        <tr>
                            <th data-field="idProducto" data-sortable="true">Id Producto</th>
                            <th data-field="nombre" data-sortable="true">Nombre</th>
                            <th data-field="descripcion" data-sortable="true">Descripción</th>
                            <th data-field="precio" data-sortable="true">Precio</th>
                            <th data-field="stock" data-sortable="true">Stock</th>
                            <th data-field="acciones">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${productos}">
                            <tr>
                                <td>${item.idProducto}</td>
                                <td>${item.nombre}</td>
                                <td>${item.descripcion}</td>
                                <td>${item.precio}</td>
                                <td>${item.stock}</td>
                                <td>
                                    <button class="btn btn-success" onclick="window.location.href='/ProyectoWeb/productos/findOne?idProducto=${item.idProducto}&opcion=1'; return false;">
                                        <i class="fa-solid fa-pen-to-square"></i> Actualizar
                                    </button>
                                    <button class="btn btn-danger" onclick="window.location.href='/ProyectoWeb/productos/findOne?idProducto=${item.idProducto}&opcion=2'; return false;">
                                        <i class="fa-solid fa-trash"></i> Eliminar
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table-es-MX.min.js"></script>
<script type="text/javascript">
    $(function() {
        $('#tablaProductos').bootstrapTable({ sortReset: true });
    });

    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#tablaProductos').bootstrapTable('resetSearch', value);
    });
</script>

</body>
</html>
