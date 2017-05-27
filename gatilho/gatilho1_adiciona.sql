PRAGMA foreign_keys = on;

-- Trigger that guarantees that a table booked for a reservation is not in use
-- within a time interval of 1 hour.

DROP TRIGGER if exists CheckTableAvailability;

CREATE TRIGGER CheckTableAvailability
before insert on ReservedTable
For each row
When exists
	(SELECT * FROM ReservedTable AS RT, Reservation AS R1, Reservation AS R2
	 WHERE
		strftime('%H:%M', R1.Time, '+1 hours') > R2.Time AND
		R1.Time < R2.Time AND
		R1.Date = R2.Date AND
		R2.ID = RT.Reservation AND
		R1.ID = New.Reservation AND
		New.TableID = RT.TableID AND
		R1.Restaurant = R2.Restaurant)
BEGIN
	SELECT raise(rollback, 'Reserved table was already booked');
END;

