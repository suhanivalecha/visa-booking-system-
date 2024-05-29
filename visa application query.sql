create database visa ;
drop database visa ;
use visa ;
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_address VARCHAR(255) NOT NULL,
    user_contact INT
);

CREATE TABLE visa_application (
    application_id INT PRIMARY KEY,
    user_id INT,  -- Assuming this is the foreign key to user_id in the user table
    application_date DATE NOT NULL,
    visa_type VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
CREATE TABLE visa_renewal_application (
    reference_number INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE web_portal (
    portal_id INT PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    description TEXT
);

INSERT INTO user (user_id, user_name, user_address,user_contact)
VALUES
(3, 'suhani', 'gurgaon', 23),
(4, 'saksham', 'delhi', 34),
(5, 'ansh', 'pune', 45),
(6, 'nikki', 'bombay', 56);

INSERT INTO visa_application (application_id, application_date, visa_type)
VALUES (45, '2021-09-27', 'Business'),
       (55, '2020-10-15', 'Transit'),
       (65, '2019-05-04', 'Family'),
       (75, '2018-02-07', 'Work');
       
INSERT INTO web_portal (portal_id, url)
VALUES (40, 'https://example-four.com'),
       (50, 'https://example-five.com'),
       (60, 'https://example-six.com');
       
INSERT INTO visa_renewal_application (reference_number, start_date, end_date)
VALUES (1, '2023-01-01', '2023-06-30'),
       (2, '2023-02-15', '2023-08-15'),
       (3, '2023-03-30', '2023-09-30'),
       (4, '2023-04-10', '2023-10-10');
       
       
SELECT u.user_id, u.user_name, u.user_address, u.user_contact, va.application_id, va.application_date, va.visa_type
FROM user u
JOIN visa_application va ON u.user_id = va.user_id;

-- Joining visa_application and web_portal tables to get visa application details along with web portal information
SELECT va.application_id, va.application_date, va.visa_type, wp.portal_id, wp.url, wp.description
FROM visa_application va
JOIN web_portal wp ON va.application_id = wp.portal_id;

ALTER TABLE user
ADD COLUMN user_city VARCHAR(255) NOT NULL;
CREATE TABLE user_location (
    location_id INT PRIMARY KEY,
    user_address VARCHAR(255) NOT NULL,
    user_city VARCHAR(255) NOT NULL
);

-- Remove user_city from user
ALTER TABLE user
DROP COLUMN user_address,
DROP COLUMN user_city;




