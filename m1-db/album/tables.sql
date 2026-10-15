use `2026-2_banco-de-dados`;

CREATE TABLE Artist(
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE Album(
    album_id INT PRIMARY KEY,
    album_name VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

CREATE TABLE Track(
    track_id INT PRIMARY KEY,
    track_name VARCHAR(50) NOT NULL,
    time INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE Played(
    played DATETIME NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (track_id, played),
    FOREIGN KEY (track_id) REFERENCES Track(track_id)
);