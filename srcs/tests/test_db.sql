CREATE DATABASE test_db;
CREATE TABLE test_db.42_projects (
	item_id INT AUTO_INCREMENT,
	content VARCHAR(255),
	PRIMARY KEY(item_id)
);

INSERT INTO test_db.42_projects (content) VALUES ("libft");
INSERT INTO test_db.42_projects (content) VALUES ("get_next_line");
INSERT INTO test_db.42_projects (content) VALUES ("ft_printf");
INSERT INTO test_db.42_projects (content) VALUES ("netwhat");
INSERT INTO test_db.42_projects (content) VALUES ("ft_server");
INSERT INTO test_db.42_projects (content) VALUES ("cub3D");
INSERT INTO test_db.42_projects (content) VALUES ("miniRT");
INSERT INTO test_db.42_projects (content) VALUES ("etc...");


SHOW DATABASES;

SELECT * FROM test_db.42_projects;
