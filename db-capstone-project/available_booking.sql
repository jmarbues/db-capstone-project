/* This is just to be able to populate the Bookings table */
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email) VALUES
(1, "John", 0, "@"),
(2, "John", 0, "@"),
(3, "John", 0, "@"),
(4, "John", 0, "@");

INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, "2022-10-10", 5, 1),
(2, "2022-11-12", 3, 3),
(3, "2022-10-11", 2, 2),
(4, "2022-10-13", 2, 1);

DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN ntable INT)
BEGIN
    DECLARE booking_exists INT DEFAULT 0;

    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = ntable;

    IF booking_exists > 0 THEN
        SELECT CONCAT("Table ", ntable, " is already booked") AS "Booking Status";
    ELSE
        SELECT CONCAT("Table ", ntable, " is not booked") AS "Booking Status";
    END IF;
END //

DELIMITER ;

CALL CheckBooking("2022-11-12", 3);


DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT,
    IN customer_ID INT
)
BEGIN
    DECLARE booking_count INT DEFAULT 0;

    START TRANSACTION;
    
    INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
	VALUES (booking_date, table_number, customer_ID);

    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;

    IF booking_count > 1 THEN
        ROLLBACK;
        SELECT CONCAT("Table ", table_number, " is already booked - booking cancelled") AS "Booking Status";
    ELSE
        COMMIT;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking("2022-12-17", 6, 1)