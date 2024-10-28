DROP DATABASE IF EXISTS db_security;
CREATE DATABASE db_security;
USE db_security;

-- Tabla: person
CREATE TABLE person (
    id BIGINT PRIMARY KEY,
    document_number VARCHAR(15),
    document_type VARCHAR(20),
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_name VARCHAR(50),
    phone VARCHAR(15),
    second_last_name VARCHAR(50),
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT
);

-- Tabla: user
CREATE TABLE user (
    id BIGINT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(255),
    person_id BIGINT,
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT,
    FOREIGN KEY (person_id) REFERENCES person(id)
);

-- Tabla: role
CREATE TABLE role (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT
);

-- Tabla: user_role
CREATE TABLE user_role (
    id BIGINT PRIMARY KEY,
    role_id BIGINT,
    user_id BIGINT,
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Tabla: module
CREATE TABLE module (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    path VARCHAR(255),
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT
);

-- Tabla: view
CREATE TABLE view (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    path VARCHAR(255),
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT
);

-- Tabla: module_view
CREATE TABLE module_view (
    id BIGINT PRIMARY KEY,
    module_id BIGINT,
    view_id BIGINT,
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT,
    FOREIGN KEY (module_id) REFERENCES module(id),
    FOREIGN KEY (view_id) REFERENCES view(id)
);

-- Tabla: role_module
CREATE TABLE role_module (
    id BIGINT PRIMARY KEY,
    module_id BIGINT,
    role_id BIGINT,
    created_at DATETIME,
    created_by BIGINT,
    deleted_at DATETIME,
    deleted_by BIGINT,
    state BIT,
    updated_at DATETIME,
    updated_by BIGINT,
    FOREIGN KEY (module_id) REFERENCES module(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);



-- Registros para la tabla: person
INSERT INTO person (id, document_number, document_type, email, first_name, last_name, middle_name, phone, second_last_name, created_at, created_by, state)
VALUES 
(1, '12345678', 'DNI', 'john.doe@example.com', 'John', 'Doe', 'Michael', '123456789', 'Smith', NOW(), 1, 1),
(2, '87654321', 'DNI', 'jane.smith@example.com', 'Jane', 'Smith', 'Alice', '987654321', 'Brown', NOW(), 1, 1),
(3, '11111111', 'DNI', 'michael.jordan@example.com', 'Michael', 'Jordan', 'James', '555555555', 'Anderson', NOW(), 1, 1),
(4, '22222222', 'DNI', 'susan.brown@example.com', 'Susan', 'Brown', 'Eve', '444444444', 'Clark', NOW(), 1, 1),
(5, '33333333', 'DNI', 'robert.lee@example.com', 'Robert', 'Lee', 'George', '333333333', 'Wong', NOW(), 1, 1),
(6, '44444444', 'DNI', 'nancy.davis@example.com', 'Nancy', 'Davis', 'Laura', '222222222', 'Nguyen', NOW(), 1, 1),
(7, '55555555', 'DNI', 'david.harris@example.com', 'David', 'Harris', 'Paul', '111111111', 'Robinson', NOW(), 1, 1),
(8, '66666666', 'DNI', 'emily.taylor@example.com', 'Emily', 'Taylor', 'Grace', '777777777', 'Lopez', NOW(), 1, 1),
(9, '77777777', 'DNI', 'brian.moore@example.com', 'Brian', 'Moore', 'Henry', '888888888', 'Perez', NOW(), 1, 1),
(10, '88888888', 'DNI', 'lisa.lee@example.com', 'Lisa', 'Lee', 'Marie', '999999999', 'Wilson', NOW(), 1, 1),
(11, '99999999', 'DNI', 'kevin.white@example.com', 'Kevin', 'White', 'David', '666666666', 'Young', NOW(), 1, 1),
(12, '10101010', 'DNI', 'laura.king@example.com', 'Laura', 'King', 'Sophia', '444333222', 'Scott', NOW(), 1, 1),
(13, '12121212', 'DNI', 'richard.baker@example.com', 'Richard', 'Baker', 'Lucas', '222333111', 'Green', NOW(), 1, 1),
(14, '13131313', 'DNI', 'jessica.wood@example.com', 'Jessica', 'Wood', 'Emma', '333222111', 'Hill', NOW(), 1, 1),
(15, '14141414', 'DNI', 'mark.jones@example.com', 'Mark', 'Jones', 'Nathan', '111222333', 'Adams', NOW(), 1, 1);

-- Registros para la tabla: user
INSERT INTO user (id, username, password, person_id, created_at, created_by, state)
VALUES 
(1, 'jdoe', 'password123', 1, NOW(), 1, 1),
(2, 'jsmith', 'password123', 2, NOW(), 1, 1),
(3, 'mjordan', 'password123', 3, NOW(), 1, 1),
(4, 'sbrown', 'password123', 4, NOW(), 1, 1),
(5, 'rlee', 'password123', 5, NOW(), 1, 1),
(6, 'ndavis', 'password123', 6, NOW(), 1, 1),
(7, 'dharris', 'password123', 7, NOW(), 1, 1),
(8, 'etaylor', 'password123', 8, NOW(), 1, 1),
(9, 'bmoore', 'password123', 9, NOW(), 1, 1),
(10, 'llee', 'password123', 10, NOW(), 1, 1),
(11, 'kwhite', 'password123', 11, NOW(), 1, 1),
(12, 'lking', 'password123', 12, NOW(), 1, 1),
(13, 'rbaker', 'password123', 13, NOW(), 1, 1),
(14, 'jwood', 'password123', 14, NOW(), 1, 1),
(15, 'mjones', 'password123', 15, NOW(), 1, 1);

-- Registros para la tabla: role
INSERT INTO role (id, code, description, name, created_at, created_by, state)
VALUES 
(1, 'ADMIN', 'Administrator role', 'Admin', NOW(), 1, 1),
(2, 'USER', 'Regular user role', 'User', NOW(), 1, 1),
(3, 'MOD', 'Moderator role', 'Moderator', NOW(), 1, 1),
(4, 'GUEST', 'Guest role', 'Guest', NOW(), 1, 1),
(5, 'SUPPORT', 'Support role', 'Support', NOW(), 1, 1),
(6, 'DEV', 'Developer role', 'Developer', NOW(), 1, 1),
(7, 'SALES', 'Sales role', 'Sales', NOW(), 1, 1),
(8, 'HR', 'Human Resources role', 'HR', NOW(), 1, 1),
(9, 'FINANCE', 'Finance role', 'Finance', NOW(), 1, 1),
(10, 'IT', 'IT role', 'IT', NOW(), 1, 1),
(11, 'SECURITY', 'Security role', 'Security', NOW(), 1, 1),
(12, 'OPS', 'Operations role', 'Operations', NOW(), 1, 1),
(13, 'MARKETING', 'Marketing role', 'Marketing', NOW(), 1, 1),
(14, 'LEGAL', 'Legal role', 'Legal', NOW(), 1, 1),
(15, 'QA', 'Quality Assurance role', 'QA', NOW(), 1, 1);

-- Registros para la tabla: user_role
INSERT INTO user_role (id, role_id, user_id, created_at, created_by, state)
VALUES 
(1, 1, 1, NOW(), 1, 1),
(2, 2, 2, NOW(), 1, 1),
(3, 3, 3, NOW(), 1, 1),
(4, 4, 4, NOW(), 1, 1),
(5, 5, 5, NOW(), 1, 1),
(6, 6, 6, NOW(), 1, 1),
(7, 7, 7, NOW(), 1, 1),
(8, 8, 8, NOW(), 1, 1),
(9, 9, 9, NOW(), 1, 1),
(10, 10, 10, NOW(), 1, 1),
(11, 11, 11, NOW(), 1, 1),
(12, 12, 12, NOW(), 1, 1),
(13, 13, 13, NOW(), 1, 1),
(14, 14, 14, NOW(), 1, 1),
(15, 15, 15, NOW(), 1, 1);


-- Registros para la tabla: module
INSERT INTO module (id, code, description, name, path, created_at, created_by, state)
VALUES 
(1, 'MOD1', 'Module 1 description', 'Module 1', '/module1', NOW(), 1, 1),
(2, 'MOD2', 'Module 2 description', 'Module 2', '/module2', NOW(), 1, 1),
(3, 'MOD3', 'Module 3 description', 'Module 3', '/module3', NOW(), 1, 1),
(4, 'MOD4', 'Module 4 description', 'Module 4', '/module4', NOW(), 1, 1),
(5, 'MOD5', 'Module 5 description', 'Module 5', '/module5', NOW(), 1, 1),
(6, 'MOD6', 'Module 6 description', 'Module 6', '/module6', NOW(), 1, 1),
(7, 'MOD7', 'Module 7 description', 'Module 7', '/module7', NOW(), 1, 1),
(8, 'MOD8', 'Module 8 description', 'Module 8', '/module8', NOW(), 1, 1),
(9, 'MOD9', 'Module 9 description', 'Module 9', '/module9', NOW(), 1, 1),
(10, 'MOD10', 'Module 10 description', 'Module 10', '/module10', NOW(), 1, 1),
(11, 'MOD11', 'Module 11 description', 'Module 11', '/module11', NOW(), 1, 1),
(12, 'MOD12', 'Module 12 description', 'Module 12', '/module12', NOW(), 1, 1),
(13, 'MOD13', 'Module 13 description', 'Module 13', '/module13', NOW(), 1, 1),
(14, 'MOD14', 'Module 14 description', 'Module 14', '/module14', NOW(), 1, 1),
(15, 'MOD15', 'Module 15 description', 'Module 15', '/module15', NOW(), 1, 1);

-- Registros para la tabla: view
INSERT INTO view (id, code, description, name, path, created_at, created_by, state)
VALUES 
(1, 'VIEW1', 'View 1 description', 'View 1', '/view1', NOW(), 1, 1),
(2, 'VIEW2', 'View 2 description', 'View 2', '/view2', NOW(), 1, 1),
(3, 'VIEW3', 'View 3 description', 'View 3', '/view3', NOW(), 1, 1),
(4, 'VIEW4', 'View 4 description', 'View 4', '/view4', NOW(), 1, 1),
(5, 'VIEW5', 'View 5 description', 'View 5', '/view5', NOW(), 1, 1),
(6, 'VIEW6', 'View 6 description', 'View 6', '/view6', NOW(), 1, 1),
(7, 'VIEW7', 'View 7 description', 'View 7', '/view7', NOW(), 1, 1),
(8, 'VIEW8', 'View 8 description', 'View 8', '/view8', NOW(), 1, 1),
(9, 'VIEW9', 'View 9 description', 'View 9', '/view9', NOW(), 1, 1),
(10, 'VIEW10', 'View 10 description', 'View 10', '/view10', NOW(), 1, 1),
(11, 'VIEW11', 'View 11 description', 'View 11', '/view11', NOW(), 1, 1),
(12, 'VIEW12', 'View 12 description', 'View 12', '/view12', NOW(), 1, 1),
(13, 'VIEW13', 'View 13 description', 'View 13', '/view13', NOW(), 1, 1),
(14, 'VIEW14', 'View 14 description', 'View 14', '/view14', NOW(), 1, 1),
(15, 'VIEW15', 'View 15 description', 'View 15', '/view15', NOW(), 1, 1);

-- Registros para la tabla: module_view
INSERT INTO module_view (id, module_id, view_id, created_at, created_by, state)
VALUES 
(1, 1, 1, NOW(), 1, 1),
(2, 2, 2, NOW(), 1, 1),
(3, 3, 3, NOW(), 1, 1),
(4, 4, 4, NOW(), 1, 1),
(5, 5, 5, NOW(), 1, 1),
(6, 6, 6, NOW(), 1, 1),
(7, 7, 7, NOW(), 1, 1),
(8, 8, 8, NOW(), 1, 1),
(9, 9, 9, NOW(), 1, 1),
(10, 10, 10, NOW(), 1, 1),
(11, 11, 11, NOW(), 1, 1),
(12, 12, 12, NOW(), 1, 1),
(13, 13, 13, NOW(), 1, 1),
(14, 14, 14, NOW(), 1, 1),
(15, 15, 15, NOW(), 1, 1);

-- Registros para la tabla: role_module
INSERT INTO role_module (id, module_id, role_id, created_at, created_by, state)
VALUES 
(1, 1, 1, null, 1, 1),
(2, 2, 2, null, 1, 1),
(3, 3, 3, null, 1, 1),
(4, 4, 4, null, 1, 1);


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
