DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders;
END //

DELIMITER ;

CALL GetMaxQuantity();


DELIMITER //

CREATE PROCEDURE GetOrderDetail(IN ID INT)
BEGIN
    SELECT OrderID, Quantity, TotalCost FROM Orders WHERE ID = OrderID;
END //

DELIMITER ;

SET @id = 1;
CALL GetOrderDetail(@id)

DELIMITER //

CREATE PROCEDURE CancelOrder(IN ID INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = ID;
END //
DELIMITER ;


CALL CancelOrder(5);
