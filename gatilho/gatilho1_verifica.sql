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

INSERT INTO Reservation VALUES (-1, '19:00', 4, -20, 111000007, '2017-05-25');
INSERT INTO Reservation VALUES (-2, '19:30', 4, -20, 111000007, '2017-05-25');
INSERT INTO Reservation VALUES (-3, '20:05', 4, -20, 111000007, '2017-05-25');

INSERT INTO ReservedTable VALUES (-1, -5, -20);
INSERT INTO ReservedTable VALUES (-2, -5, -20);
INSERT INTO ReservedTable VALUES (-3, -5, -20);
