

# Mostar la lista roles a los que tiene una persona tiene acceso. Recordar que cada rol tiene una lista de modulos asociados, y a su vez, un modulo puede tener varias vistas.

  Para mostrar dicha información, se requiere enviar [user](username, password). En caso que el usuario y la contraseña no coinsida, no se muestra la información.

[user] usuario(username)
[role] rol(name)
[module] modulo(name)
[view] vista[name]


```sql

SELECT 
    r.name AS rol,
    m.name AS modulo,
    v.name AS vista
FROM 
    user u
inner JOIN  person p ON u.person_id = p.id
inner JOIN  user_role ur ON u.id = ur.user_id
inner JOIN  role r ON ur.role_id = r.id
inner JOIN  role_module rm ON r.id = rm.role_id
inner JOIN  module m ON rm.module_id = m.id
inner JOIN  module_view mv ON m.id = mv.module_id
inner JOIN  view v ON mv.view_id = v.id
WHERE 
    u.username = 'jdoe'
    AND u.password = 'password123' 
    AND u.state = 1;

```

# Resultado

![Consulta con filtro](img/imagencaso3.png)