CREATE EVENT IF NOT EXISTS simplest_pulisci_cestino
ON SCHEDULE EVERY 1 day
DO 	CALL pulisci_cestino();
