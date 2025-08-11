CREATE DATABASE IF NOT EXISTS random_pictures;

---Users
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50)
);

INSERT INTO users (username)
VALUES 
	('ademola'),
	('azeezat'),
	('hikmah'),
	('rofiat'),
	('mutiyat'),
	('samuel'),
	('ridwan'),
	('adeoti'),
	('adeola'),
	('adebola');

---Photos
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	pics TEXT,
	user_id INT REFERENCES users(id)
);

COPY photos FROM 'C:\psql imports\photos.csv' CSV HEADER DELIMITER ',';

---Comments
CREATE TABLE comnts (
	id SERIAL,
	cmt VARCHAR(200),
	user_id INT REFERENCES users(id),
	photo_id INT REFERENCES photos(id)
);


COPY comnts FROM 'C:\psql imports\comments.csv' CSV HEADER DELIMITER ',';

