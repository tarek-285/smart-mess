create table users(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL ,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
create table messes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    created_by BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE       
);
create table members(
    id BIGINT PRIMARY KEY AUTO_INCREMENT ,
    mess_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    role ENUM('admin', 'member')NOT NULL DEFAULT 'member',
    joined_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_member (mess_id, user_id),
    FOREIGN KEY (mess_id) REFERENCES messes(id) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
create table join_requests(
    id BIGINT PRIMARY KEY AUTO_INCREMENT ,
    mess_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    status ENUM('pending','approved', 'rejected') NOT NULL DEFAULT 'pending',
    requested_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (mess_id) REFERENCES messes(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE   
    ON UPDATE CASCADE

);
create table meal_sessions(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    mess_id BIGINT NOT NULL,
    meal_type ENUM('breakfast', 'lunch', 'dinner') NOT NULL ,
    meal_date DATE NOT NULL,
    cooked_start_time TIME NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_meal_session (mess_id, meal_type, meal_date),
    FOREIGN KEY (mess_id) REFERENCES messes(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    

);

create table meal_orders(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    meal_session_id BIGINT NOT NULL,
    member_id BIGINT NOT NULL,
    quantity INT NOT NULL check (quantity > 0),
    ordered_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (meal_session_id) REFERENCES meal_sessions(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE   
)