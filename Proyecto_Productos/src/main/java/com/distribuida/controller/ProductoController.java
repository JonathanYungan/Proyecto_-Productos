package com.distribuida.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dao.ProductoDAO;
import com.distribuida.entities.Producto;

@Controller
@RequestMapping("/productos") // Path Principal
public class ProductoController {

    @Autowired
    private ProductoDAO productoDAO;

    @GetMapping("/findAll") // Path secundario
    public String findAll(Model model) {
        List<Producto> productos = productoDAO.findAll();
        model.addAttribute("productos", productos);
        return "listar-productos"; // Nombre del formulario listar-productos.jsp
    }

    @GetMapping("/findOne")
    public String findOne(@RequestParam("idProducto") @Nullable Integer idProducto,
                          @RequestParam("opcion") @Nullable Integer opcion,
                          Model model) {
        if (idProducto != null) {
            Producto producto = productoDAO.findOne(idProducto);
            model.addAttribute("producto", producto);
        }
        if (opcion == 1) return "add-producto"; // Actualización
        else return "del-producto"; // Eliminación
    }

    @PostMapping("/add")
    public String add(@RequestParam("idProducto") @Nullable Integer idProducto,
                      @RequestParam("nombre") @Nullable String nombre,
                      @RequestParam("descripcion") @Nullable String descripcion,
                      @RequestParam("precio") @Nullable Double precio,
                      @RequestParam("stock") @Nullable Integer stock,
                      ModelMap modelMap) {
        
        if (idProducto == null) {
            Producto producto = new Producto();
            producto.setNombre(nombre);
            producto.setDescripcion(descripcion);
            producto.setPrecio(precio);
            producto.setStock(stock);
            productoDAO.add(producto);
        } else {
            Producto producto = productoDAO.findOne(idProducto);
            if (producto != null) {
                producto.setNombre(nombre);
                producto.setDescripcion(descripcion);
                producto.setPrecio(precio);
                producto.setStock(stock);
                productoDAO.up(producto);
            }
        }
        return "redirect:/productos/findAll"; // Redirige al formulario web por path o URL
    }

    @GetMapping("/del")
    public String del(@RequestParam("idProducto") @Nullable Integer idProducto) {
        productoDAO.del(idProducto);
        return "redirect:/productos/findAll";
    }
}
