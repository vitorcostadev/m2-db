USE `2026-2_banco-de-dados`;

START TRANSACTION;

INSERT INTO Artist(artist_id, artist_name) VALUES
(1, 'Linkin Park'),
(2, 'The Weeknd'),
(3, 'Imagine Dragons'),
(4, 'YOASOBI'),
(5, 'Bruno Mars');


INSERT INTO Album(album_id, album_name, artist_id) VALUES
(1, 'Meteora', 1),
(2, 'Hybrid Theory', 1),
(3, 'After Hours', 2),
(4, 'Starboy', 2),
(5, 'Evolve', 3),
(6, 'Night Visions', 3),
(7, 'THE BOOK', 4),
(8, '24K Magic', 5);


INSERT INTO Track(track_id, track_name, time, album_id) VALUES
(1, 'Numb', 185, 1),
(2, 'Breaking the Habit', 196, 1),
(3, 'In the End', 216, 2),
(4, 'Papercut', 184, 2),
(5, 'Blinding Lights', 200, 3),
(6, 'Save Your Tears', 215, 3),
(7, 'Starboy', 230, 4),
(8, 'The Hills', 242, 4),
(9, 'Believer', 204, 5),
(10, 'Thunder', 187, 5),
(11, 'Radioactive', 186, 6),
(12, 'Demons', 177, 6),
(13, 'Yoru ni Kakeru', 261, 7),
(14, 'Racing into the Night', 248, 7),
(15, '24K Magic', 226, 8),
(16, 'That’s What I Like', 206, 8);


INSERT INTO Played(played, track_id) VALUES
('2026-09-01 08:30:00', 1),
('2026-09-01 10:15:00', 1),
('2026-09-02 14:20:00', 1),

('2026-09-01 09:00:00', 2),
('2026-09-03 16:45:00', 2),

('2026-09-01 11:30:00', 3),
('2026-09-02 18:00:00', 3),
('2026-09-04 20:15:00', 3),

('2026-09-02 08:45:00', 4),

('2026-09-01 13:00:00', 5),
('2026-09-02 15:30:00', 5),
('2026-09-05 21:00:00', 5),

('2026-09-03 19:20:00', 6),
('2026-09-05 22:10:00', 6),

('2026-09-01 17:00:00', 7),
('2026-09-04 12:40:00', 7),

('2026-09-02 20:00:00', 8),

('2026-09-01 07:30:00', 9),
('2026-09-03 18:30:00', 9),
('2026-09-05 23:00:00', 9),

('2026-09-02 09:45:00', 10),

('2026-09-03 10:30:00', 11),

('2026-09-04 14:00:00', 12),

('2026-09-01 22:30:00', 13),
('2026-09-03 21:15:00', 13),
('2026-09-05 20:45:00', 13),

('2026-09-02 23:00:00', 14),

('2026-09-04 17:30:00', 15),
('2026-09-05 19:00:00', 16);

COMMIT;