-- 1

SELECT DISTINCT cust_name
FROM restBill
WHERE (bill_total > 450.00) 
AND (bill_date IN (
	SELECT room_date
	FROM restRoom_management
	WHERE headwaiter = (
		SELECT staff_no
		FROM restStaff
		WHERE first_name = "Charles"))) 
AND (table_no IN (
	SELECT table_no
	FROM restRest_table
	WHERE room_name IN (
		SELECT room_name
		FROM restRoom_management
		WHERE headwaiter = (
			SELECT staff_no
			FROM restStaff
			WHERE first_name = "Charles"))));

-- 2

SELECT first_name, surname FROM restStaff WHERE staff_no = (
SELECT headwaiter FROM restRoom_management WHERE (room_date = 160111) AND (room_name = 
(SELECT room_name FROM restRest_table WHERE table_no = 
(SELECT table_no FROM restBill WHERE cust_name LIKE "Nerida%" AND bill_date = 160111)))); 

-- 3

SELECT cust_name FROM restBill WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4

SELECT first_name 
FROM restStaff 
WHERE (headwaiter IS NOT NULL) AND (staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill));

-- 5

SELECT 
		first_name AS "Headwaiter Name",
		surname AS "Headwaiter Surname",
		(SELECT room_name FROM restRest_table WHERE table_no = (SELECT table_no FROM restBill WHERE bill_total = (SELECT MAX(bill_total) FROM restBill))) AS "Room Served In",
		(SELECT cust_name FROM restBill WHERE bill_total = (SELECT MAX(bill_total) FROM restBill)) AS "Customer Name"
FROM restStaff 
WHERE staff_no = 
(SELECT headwaiter FROM restRoom_management WHERE (room_date = (SELECT bill_date FROM restBill WHERE bill_total = (SELECT MAX(bill_total) FROM restBill))) 
AND 
(room_name = (SELECT room_name FROM restRest_table WHERE table_no = (SELECT table_no FROM restBill WHERE bill_total = (SELECT MAX(bill_total) FROM restBill))))); 
