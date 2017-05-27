.mode	columns

.headers	on

-- Trigger that guarantees that a table booked for a reservation is not in use
-- within a time interval of 1 hour.

-- Overhead necessary for testing
INSERT INTO Restaurant VALUES (-20, 102139520, "Test Restaurant 20", "Test Street 20");
INSERT INTO Client VALUES (111000007, "Test Client", 111000007);
DELETE FROM RTable WHERE ID = -2;
INSERT INTO RTable VALUES (-5, -20);
--

INSERT INTO Reservation VALUES (-1, '22:00', 4, -20, 111000007, '2017-05-25');
INSERT INTO ReservedTable VALUES (-1, -5, -20);

INSERT INTO Reservation VALUES (-2, '22:59', 4, -20, 111000007, '2017-05-25');
INSERT INTO ReservedTable VALUES (-2, -5, -20); -- TO FAIL

INSERT INTO Reservation VALUES (-3, '23:05', 4, -20, 111000007, '2017-05-25');
INSERT INTO ReservedTable VALUES (-3, -5, -20);

INSERT INTO Reservation VALUES (-4, '20:40', 4, -20, 111000007, '2017-05-25');
INSERT INTO ReservedTable VALUES (-4, -5, -20);

INSERT INTO Reservation VALUES (-5, '20:30', 4, -20, 111000007, '2017-05-25');
INSERT INTO ReservedTable VALUES (-5, -5, -20); -- TO FAIL

INSERT INTO Reservation VALUES (-6, '00:01', 4, -20, 111000007, '2017-05-26');
INSERT INTO ReservedTable VALUES (-6, -5, -20); -- TO FAIL

