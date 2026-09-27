-- Решил несколько задач по SQL:
-- фильтрация, сортировка,  группировка и объединение таблиц через JOIN



CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL
);


CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    total NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL
);


INSERT INTO users (id, name, email, city, age)
VALUES
    (1, 'Abylay', 'abylay@mail.com', 'Almaty', 23),
    (2, 'Anna', 'anna@mail.com', 'Astana', 27),
    (3, 'Daniyar', NULL, 'Almaty', 19),
    (4, 'Maria', 'maria@mail.com', 'Shymkent', 31),
    (5, 'Timur', 'timur@mail.com', 'Astana', 25);


INSERT INTO orders (id, user_id, total, status)
VALUES
    (101, 1, 15000, 'completed'),
    (102, 2, 8000, 'cancelled'),
    (103, 1, 25000, 'completed'),
    (104, 3, 12000, 'pending'),
    (105, 4, 30000, 'completed'),
    (106, 2, 5000, 'completed');




--  1) Вывести всех пользователей
SELECT *
FROM users;

-- 2) Вывести только имена и email
SELECT name, email
FROM users;

-- 3) Найти пользователей из Almaty
SELECT *
FROM users
WHERE city = 'Almaty';

-- 4) Найти пользователей старше 25 лет
SELECT *
FROM users
WHERE age > 25;

-- 5) Найти пользователей из Astana старше 25 лет
SELECT *
FROM users
WHERE city = 'Astana' AND age > 25;

-- 6) Найти пользователей без email
SELECT *
FROM users
WHERE email IS NULL;

-- 7) Вывести пользователей от старшего к младшему
SELECT *
FROM users
ORDER BY age DESC;

-- 8) Найти два самых дорогих заказа
SELECT *
FROM orders
ORDER BY total DESC
LIMIT 2;

-- 9) Посчитать всех пользователей
SELECT COUNT(*)
FROM users;

-- 10) Посчитать пользователей в каждом городе
SELECT city, COUNT(*)
FROM users
GROUP BY city;

-- 11) Посчитать сумму завершённых заказов
SELECT SUM(total)
FROM orders
WHERE status = 'completed';

-- 12) Найти пользователей, у которых больше одного заказа
SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1;

-- 13) Вывести заказы вместе с именами пользователей
SELECT orders.id, users.name, orders.total, orders.status
FROM orders
JOIN users ON orders.user_id = users.id;

-- 14) Найти пользователей без заказов
SELECT users.id, users.name
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- 15) Посчитать заказы каждого пользователя, включая пользователей без заказов
SELECT users.id, users.name, COUNT(orders.id)
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.id, users.name;
