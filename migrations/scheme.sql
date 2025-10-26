CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'user',
    refresh_token VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

-- I added data into table 'users'
INSERT INTO users (username, password, role)
VALUES ('Jimmy', 'jimjim123', 'user');

INSERT INTO users (username, password, role)
VALUES ('Ronie', 'BossRoni2007', 'user');

INSERT INTO users (username, password)
VALUES ('Rommell', 'Debunk2k23');

INSERT INTO users (username, password, role)
VALUES ('jaycee', 'jayc332002', 'admin');

CREATE TABLE positions (
    position_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    position_code VARCHAR(100) NOT NULL,
    position_name VARCHAR(300) NOT NULL,
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

