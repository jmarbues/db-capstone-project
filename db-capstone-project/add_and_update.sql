DELIMITER //
CREATE PROCEDURE AddBooking(IN ID INT, IN dat DATE, IN table_n INT, IN customer_id INT)
BEGIN
	INSERT INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID) VALUES
    (ID, dat, table_n, customer_id);
    SELECT "New booking added" AS "Confirmation";
END //
DELIMITER ;

CALL AddBooking(9, "2022-12-30", 1, 4);


DELIMITER //

CREATE PROCEDURE UpdateBooking(IN ID INT, IN dat DATE)
BEGIN
UPDATE Bookings SET BookingDate = dat
WHERE BookingID = ID;
SELECT CONCAT("Booking ", ID, " updated") AS "Confirmation";
END //
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");


DELIMITER //

CREATE PROCEDURE CancelBooking(IN ID INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = ID;
    SELECT CONCAT("Booking ", ID, " cancelled") AS "Confirmation";
END //
DELIMITER ;

CALL CancelBooking(9);