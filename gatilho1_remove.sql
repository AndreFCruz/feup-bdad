-- Remove Triggers that enforce Complete and Disjoint Generalization

DROP TRIGGER if exists InsertChef;

DROP TRIGGER if exists InsertCook;

DROP TRIGGER if exists InsertServer;
