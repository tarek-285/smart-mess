USE smart_mess;

-- =========================
-- USERS
-- =========================

INSERT INTO users (name, email, password) VALUES
('Tarek', 'tarek@example.com', 'hashed_password_1'),
('Rahim', 'rahim@example.com', 'hashed_password_2'),
('Karim', 'karim@example.com', 'hashed_password_3'),
('Hasan', 'hasan@example.com', 'hashed_password_4'),
('Sakib', 'sakib@example.com', 'hashed_password_5'),
('Nayeem', 'nayeem@example.com', 'hashed_password_6');


-- =========================
-- MESSES
-- =========================

INSERT INTO messes (name, created_by) VALUES
('Green View Mess', 1),
('City Mess', 2);


-- =========================
-- MEMBERS
-- =========================

INSERT INTO members (mess_id, user_id, role) VALUES
(1, 1, 'admin'),
(1, 2, 'member'),
(1, 3, 'member'),
(1, 4, 'member'),
(1, 5, 'member'),
(1, 6, 'member'),

(2, 2, 'admin'),
(2, 3, 'member');


-- =========================
-- JOIN REQUESTS
-- =========================

INSERT INTO join_requests (mess_id, user_id, status) VALUES
(1, 2, 'approved'),
(1, 3, 'approved'),
(1, 4, 'approved'),
(1, 5, 'pending'),
(1, 6, 'rejected'),
(2, 1, 'pending');


-- =========================
-- MEAL SESSIONS
-- =========================

INSERT INTO meal_sessions
(mess_id, meal_type, meal_date, cooked_start_time)
VALUES

-- Sep 1
(1, 'lunch',  '2026-09-01', '12:00:00'),
(1, 'dinner', '2026-09-01', '19:00:00'),

-- Sep 2
(1, 'lunch',  '2026-09-02', '12:00:00'),
(1, 'dinner', '2026-09-02', '19:00:00'),

-- Sep 3
(1, 'lunch',  '2026-09-03', '12:00:00'),
(1, 'dinner', '2026-09-03', NULL);


-- =========================
-- MEAL ORDERS
-- =========================

-- Sep 1 lunch starts cooking at 12:00

INSERT INTO meal_orders
(meal_session_id, member_id, quantity, ordered_at)
VALUES

-- Tarek orders 2 on time
(1, 1, 2, '2026-09-01 10:00:00'),

-- Rahim orders 1 on time
(1, 2, 1, '2026-09-01 11:30:00'),

-- Karim orders 1 late
(1, 3, 1, '2026-09-01 12:30:00'),

-- Tarek adds another meal before cooking
(1, 1, 1, '2026-09-01 11:00:00'),

-- Sep 1 dinner
(2, 1, 2, '2026-09-01 17:00:00'),
(2, 2, 1, '2026-09-01 18:30:00'),

-- Sep 2 lunch
(3, 1, 1, '2026-09-02 09:00:00'),
(3, 3, 2, '2026-09-02 10:30:00'),

-- Sep 2 dinner
(4, 4, 1, '2026-09-02 17:30:00'),

-- Sep 3 lunch
(5, 1, 2, '2026-09-03 10:00:00'),
(5, 2, 1, '2026-09-03 11:45:00'),

-- Sep 3 dinner: cooking hasn't started
(6, 3, 2, '2026-09-03 15:00:00');


-- =========================
-- BAZAR DUTY
-- =========================

INSERT INTO bazar_duty
(member_id, start_date, end_date)
VALUES

(1, '2026-09-01', '2026-09-06'),
(2, '2026-09-07', '2026-09-12'),
(3, '2026-09-13', '2026-09-18'),
(4, '2026-09-19', '2026-09-24'),
(5, '2026-09-25', '2026-09-30');


-- =========================
-- BAZAR ITEMS
-- =========================

INSERT INTO bazar_items
(bazar_duty_id, item_name, category, quantity, price, purchased_at)
VALUES

(1, 'Rice',       'rice',      10, 800.00, '2026-09-01 08:00:00'),
(1, 'Chicken',    'meat',       5, 1200.00, '2026-09-01 08:10:00'),
(1, 'Potato',     'potato',     8, 300.00, '2026-09-01 08:20:00'),
(1, 'Oil',        'oil',        3, 600.00, '2026-09-01 08:30:00'),
(1, 'Dal',        'dal',        3, 300.00, '2026-09-01 08:40:00');


-- =========================
-- MENU ITEMS
-- =========================

INSERT INTO menu_items (meal_session_id, item_name) VALUES

(1, 'Rice'),
(1, 'Chicken Curry'),
(1, 'Dal'),

(2, 'Rice'),
(2, 'Fish Curry'),
(2, 'Vegetable'),

(3, 'Rice'),
(3, 'Egg Curry'),
(3, 'Dal'),

(4, 'Rice'),
(4, 'Chicken Curry'),

(5, 'Rice'),
(5, 'Chicken Curry'),
(5, 'Dal'),

(6, 'Rice'),
(6, 'Fish Curry');