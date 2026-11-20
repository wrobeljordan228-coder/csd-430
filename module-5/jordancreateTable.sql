USE CSD430;

CREATE TABLE jordanmoviesdata (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    rating DECIMAL(3, 1),
    PRIMARY KEY (movie_id)
);