DROP DATABASE IF EXISTS library_db;
CREATE DATABASE library_db;
USE library_db;

CREATE TABLE roles
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	role_name ENUM('student', 'regular')
);

CREATE TABLE users
(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(100) NOT NULL, 
    egn VARCHAR(10) NOT NULL,
    pass VARCHAR(100) NOT NULL,
    phone VARCHAR(10) DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE publishers
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);
   
CREATE TABLE books
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    b_desc VARCHAR(255) DEFAULT NULL,
    pub_id INT NOT NULL,
    FOREIGN KEY(pub_id) REFERENCES publishers(id)
    );
    
    CREATE TABLE users_books
(
    res_date TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(book_id) REFERENCES books(id),
    PRIMARY KEY(user_id, book_id)
);

CREATE TABLE genres
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    genre ENUM('fantasy', 'thriller', 'autobiography', 'textbook', 'sci-fi', 'story')
);

CREATE TABLE books_genres
(
	book_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY(book_id) REFERENCES books(id),
    FOREIGN KEY(genre_id) REFERENCES genres(id),
    PRIMARY KEY(book_id, genre_id)
);

CREATE TABLE authors
(	
	id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) NOT NULL,
    info VARCHAR(255) DEFAULT NULL
);

CREATE TABLE books_authors
(
	book_id INT NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY(book_id) REFERENCES books(id),
    FOREIGN KEY(author_id) REFERENCES authors(id),
    PRIMARY KEY(book_id, author_id)
);
