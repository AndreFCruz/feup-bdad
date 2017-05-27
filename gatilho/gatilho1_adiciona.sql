PRAGMA foreign_keys = on;

-- Trigger that guarantees that a table booked for a reservation is not in use
-- within a time interval of 1h30m (1 hour after and 30 minutes before reserved time)

DROP TRIGGER if exists CheckTableAvailability;

CREATE TRIGGER CheckTableAvailability
before insert on ReservedTable
For each row
When exists
	(SELECT * FROM ReservedTable AS RT, Reservation AS R1, Reservation AS R2
	 WHERE
		datetime(R1.Date, R1.Time, '-1 hours') < datetime(R2.Date, R2.Time) AND
		datetime(R1.Date, R1.Time, '+30 minutes') > datetime(R2.Date, R2.Time) AND
		R2.ID = RT.Reservation AND
		R1.ID = New.Reservation AND
		New.TableID = RT.TableID AND
		R1.Restaurant = R2.Restaurant)
BEGIN
	SELECT raise(rollback, 'Reserved table was already booked');
END;

