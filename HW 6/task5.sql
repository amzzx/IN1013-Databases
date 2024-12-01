-- 1

SELECT first_name, surname, waiter_no, bill_date, COUNT(*) AS "No. bills taken on this date"
FROM restBill B
INNER JOIN restStaff S
ON S.staff_no = B.waiter_no
GROUP BY first_name, surname ,waiter_no, bill_date
HAVING COUNT(*) >= 2;

-- 2

SELECT room_name, COUNT(*)
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3

SELECT room_name, COUNT(*)
FROM restRest_table T
INNER JOIN (SELECT table_no, COUNT(*) FROM restBill GROUP BY table_no) A
ON T.table_no = A.table_no
GROUP BY room_name;

-- 4

SELECT first_name, surname, H.Total
FROM restStaff S2
INNER JOIN
(SELECT headwaiter, SUM(A.BT) AS Total
FROM restStaff S1
INNER JOIN 
(SELECT waiter_no, SUM(bill_total) AS BT FROM restBill GROUP BY waiter_no) A
ON S1.staff_no = A.waiter_no
WHERE headwaiter IS NOT NULL
GROUP BY headwaiter) H
ON H.headwaiter = S2.staff_no
ORDER BY H.Total DESC;

-- 5
SELECT cust_name, AVG(bill_total)
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6
SELECT first_name, surname, waiter_no, bill_date, COUNT(*) AS "No. bills taken on this date"
FROM restBill B
INNER JOIN restStaff S
ON S.staff_no = B.waiter_no
GROUP BY first_name, surname, waiter_no, bill_date
HAVING COUNT(*) >= 3;