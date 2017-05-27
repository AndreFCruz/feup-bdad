PRAGMA foreign_keys = on;

-- Trigger that guarantees that a table booked for a reservation is not in use
-- within a time interval of 1 hour.

DROP TRIGGER if exists CheckTableAvailability;

CREATE TRIGGER CheckTableAvailability
before insert on ReservedTable
For each row
When exists
	(SELECT ReservedTable.TableID FROM ReservedTable, Reservation AS R1, Reservation AS R2
	 WHERE
		New.Reservation = R1.ID AND
		R1.Time + 1 < R2.Time AND
		R1.Date = R2.Date AND
		R2.ID = ReservedTable.Reservation AND
		ReservedTable.TableID = New.TableID AND
		New.Restaurant = ReservedTable.Restaurant)
BEGIN
	SELECT raise(rollback, 'Reserved table was already booked');
END;

