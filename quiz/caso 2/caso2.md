
# Mostar la lista de vistas a las que tiene acceso un rol.
 Enviar como condición el nombre del rol [role](name)
[role] rol(name)
[module] modulo(name)
[view] vista[name]


```sql

SELECT 
    r.name AS rol,
    m.name AS modulo,
    v.name AS vista
FROM 
    role r
inner JOIN    role_module rm ON r.id = rm.role_id
inner JOIN    module m ON rm.module_id = m.id
inner JOIN    module_view mv ON m.id = mv.module_id
inner JOIN    view v ON mv.view_id = v.id
WHERE
    r.name = 'ADMIN';

```

# Resultado

![Consulta con filtro](img/imagencaso2.png)