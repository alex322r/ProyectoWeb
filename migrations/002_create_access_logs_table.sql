
CREATE TABLE access_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    request_method VARCHAR(10),
    request_uri VARCHAR(255),
    response_status INT,
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
