-- 1

SELECT first_name, surname
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
WHERE cust_name = "Tanya Singh";

-- 2

SELECT room_date
FROM restRoom_management RM
INNER JOIN restStaff S
ON S.staff_no = RM.headwaiter
WHERE first_name = "Charles" AND room_name = "Green" AND (room_date BETWEEN 160201 AND 160229);

-- 3

SELECT S2.first_name, S2.surname
FROM restStaff S1
INNER JOIN restStaff S2
ON S1.headwaiter = S2.headwaiter
WHERE (S1.first_name = "Zoe" AND S1.surname = "Ball") AND (S2.first_name != "Zoe" AND S2.surname != "Ball");

-- 4

SELECT cust_name, bill_total, first_name AS "waiter name"
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
ORDER BY bill_total DESC;

-- 5

SELECT S.first_name, S.surname
FROM restStaff S
LEFT JOIN restBill B ON S.staff_no = B.waiter_no AND B.bill_no IN (00014, 00017)
WHERE S.headwaiter IS NOT NULL AND B.waiter_no IS NULL;

-- 6

SELECT first_name, surname
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
INNER JOIN restRest_table T
ON T.table_no = B.table_no
WHERE bill_date = 160312 AND room_name = "Blue";