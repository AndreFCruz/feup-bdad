-- Remove Trigger that grants that a ROrder's Date and Time is previous to its associated Transaction

DROP TRIGGER if exists InsertTransactionTime;
