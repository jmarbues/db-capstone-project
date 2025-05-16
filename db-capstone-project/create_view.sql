CREATE VIEW OrdersView AS SELECT OrderID, Quantity, TotalCost FROM Orders WHERE Quantity > 2;
SELECT * FROM OrdersView;

SELECT Customers.CustomerID, Customers.FullName, Orders.OrderID, Orders.TotalCost, Menus.MenuName, MenuItems.CourseName, MenuItems.StarterName
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN Menus ON Orders.MenuID = Menus.MenuID
INNER JOIN MenuItems ON Menus.MenuItemsID = MenuItems.MenuItemsID
WHERE Orders.TotalCost > 150 ORDER BY Orders.TotalCost;

SELECT MenuName FROM Menus WHERE MenuID = ANY
(SELECT MenuID FROM Orders WHERE Quantity > 2);