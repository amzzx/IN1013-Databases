-- 1

CREATE VIEW samsBills
AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
WHERE first_name = "Sam" AND surname = "Pitt";

SELECT * FROM samsBills;

-- 2

SELECT * FROM samsBills WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals
AS 
SELECT room_name, SUM(bill_total) AS "total_sum"
FROM restRest_table T
INNER JOIN restBill B
ON T.table_no = B.table_no
GROUP BY room_name;

SELECT * FROM roomTotals;

-- 4

CREATE VIEW teamTotals
AS
SELECT CONCAT(first_name, ' ', surname) AS headwaiter_name , H.bill AS total_sum
FROM restStaff S2 
INNER JOIN
	(SELECT headwaiter, SUM(W.BT) AS bill
	FROM restStaff S1
	INNER JOIN 
		(SELECT waiter_no, SUM(bill_total) AS BT
		FROM restStaff S1
		INNER JOIN restBill B
		ON S1.staff_no = B.waiter_no
		GROUP BY waiter_no) W
	ON S1.staff_no = W.waiter_no
	GROUP BY headwaiter) H
ON S2.staff_no = H.headwaiter;

SELECT * FROM teamTotals;