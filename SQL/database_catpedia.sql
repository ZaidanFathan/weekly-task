CREATE DATABASE catpedia;

USE catpedia;

-- Perancangan database dan Scripting dengan DDL (Data Definition Language)
CREATE TABLE cats
(
    id int PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL UNIQUE,
    image_path VARCHAR(255)
)

CREATE TABLE cat_types
(
    id int PRIMARY KEY AUTO_INCREMENT,
    tipe VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE articles
(
    id int PRIMARY KEY AUTO_INCREMENT,
    judul VARCHAR(50) NOT NULL,
    deskripsi VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
)

ALTER TABLE cats
DROP COLUMN nama;

RENAME TABLE cat_types TO cat_breed;
RENAME TABLE cat_breed TO cat_breeds;


ALTER TABLE cats
add column cat_breed_id int null,
add constraint cats_to_cat_breeds foreign key(cat_breed_id) references cat_breeds(id) on delete cascade;

ALTER TABLE articles
add column cat_id int null,
add constraint articles_to_cat foreign key(cat_id) references cats(id) ON DELETE SET null;



CREATE TABLE testing
(
    id int PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255)
)


INSERT INTO testing(nama) 
VALUES ("Alex"), ("Udin"), ("Alexander"), ("Ucok")

RENAME TABLE testing TO not_testing;

TRUNCATE TABLE not_testing;
DROP TABLE not_testing;

-- Scripting dengan DML (Data Manipulation Language)
INSERT INTO cat_breeds(tipe) VALUES ("Persian"), ("Maine Coon"), ("Russian Blue");

INSERT INTO cat_breeds(tipe)
VALUES ("Persian"), ("Korat"), ("Devon Rex")

INSERT INTO cats(cat_breed_id) VALUES (2), (3), (4), (5);

INSERT INTO articles(judul, deskripsi,)


UPDATE cat_breeds 
SET tipe = "Bombay Cat" WHERE id = 1;

DELETE FROM cat_breeds WHERE id = 1;

SELECT * FROM cat_breeds WHERE id = 2;
SELECT * FROM cat_breeds ORDER BY id ASC;
SELECT * FROM cat_breeds ORDER BY id DESC;
SELECT * FROM cat_breeds LIMIT 4;
SELECT * FROM cat_breeds ORDER BY id ASC LIMIT 3;

-- Scripting dengan DCL (Data Control Language)
CREATE USER 'zaidan'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON cats TO 'zaidan'@'localhost';
GRANT SELECT ON cat_breeds TO 'zaidan'@'localhost';

CREATE USER 'author_zaidan'@'localhost' IDENTIFIED BY 'author_zaidan123';
GRANT SELECT ON articles  TO 'author_zaidan'@'localhost';

-- Advanced SQL (Optional Challenge)
SELECT * FROM cats
INNER JOIN cat_breeds ON cats.cat_breed_id = cat_breeds.id; 


CREATE PROCEDURE collect_all_cat_data(IN id_cat INT)
BEGIN
    SELECT cat_breeds.tipe AS ras_kucing, cats.id as cat_id FROM cats INNER JOIN cat_breeds ON id_cat = cat_breeds.id;
END;

CALL collect_all_cat_data(2);

CREATE FUNCTION count_all_cats()
RETURNS INT 
DETERMINISTIC 
BEGIN 
    DECLARE total_cats INT;
    SELECT COUNT(*) INTO total_cats FROM cats;
    RETURN total_cats;
END;

SELECT count_all_cats();


CREATE TABLE loggings(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama ENUM("INSERT", "UPDATE", "DELETE"),
    waktu DATETIME DEFAULT NOW()
);

CREATE TRIGGER after_insert
AFTER INSERT ON cats
FOR EACH ROW
BEGIN 
    INSERT INTO loggings(nama, waktu) VALUES ("INSERT", NOW());
END;

INSERT INTO cats(cat_breed_id) VALUES (2);


CREATE VIEW cat_and_cat_breeds AS
SELECT 
    cats.id AS cat_id,
    cats.image_path,
    cat_breeds.id AS breed_id,
    cat_breeds.tipe AS breed_name
FROM cats
LEFT JOIN cat_breeds 
    ON cats.cat_breed_id = cat_breeds.id;

SELECT * FROM cat_and_cat_breeds;