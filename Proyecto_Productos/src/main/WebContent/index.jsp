<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Página de Inicio</title>
    <style>
        body {
            background-color: #e6e6fa; /* Color de fondo lavanda */
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #4682b4; /* Azul más oscuro */
            font-size: 3.5em; /* Tamaño de fuente más grande */
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5); /* Sombra pronunciada */
            margin: 20px; /* Margen llamativo */
            animation: bounce 2s infinite;
            cursor: default; /* No cambia el cursor */
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-30px);
            }
            60% {
                transform: translateY(-15px);
            }
        }

        .button-container {
            display: flex;
            gap: 20px; /* Espacio entre los botones */
            margin-top: 40px; /* Separación respecto al título */
        }

        .button {
            background-color: #4682b4; /* Color azul oscuro */
            color: white;
            font-size: 1.5em;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .button:hover {
            background-color: #5a9bd4; /* Azul más claro al hacer hover */
            transform: translateY(-5px);
        }

        .button:active {
            transform: translateY(2px);
        }

        /* Animación de entrada de los botones */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .button {
            animation: fadeIn 1s ease-in-out;
        }
    </style>
</head>
<body>
    <h1>BIENVENIDO AL CAMALEÓN SABROSO</h1>
    <div class="button-container">
        <button class="button" onclick="window.location.href='http://localhost:8080/ProyectoWeb/devoluciones/findAll'">DEVOLUCIONES</button>
        <button class="button" onclick="window.location.href='http://localhost:8080/ProyectoWeb/detallesdevoluciones/findAll'">DETALLES DEVOLUCIONES</button>
        <button class="button" onclick="window.location.href='http://localhost:8080/ProyectoWeb/inventarios/findAll'">INVENTARIOS</button>
    </div>
</body>
</html>
