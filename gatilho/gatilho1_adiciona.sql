PRAGMA foreign_keys = on;

DROP TRIGGER if exists CheckTableAvailability;

CREATE TRIGGER CheckTableAvailability
before insert on ReservedTable
For each row
When exists
	(SELECT ReservedTable.TableID FROM ReservedTable, Reservation WHERE
		New.Reservation = Reservation.ID AND
		Reservation.Time = )
BEGIN
	SELECT raise(rollback, 'Reserved table was already booked');
END;

