SELECT COUNT (*)
FROM part_nyc n
WHERE 70 < (SELECT COUNT(*)
FROM part_nyc n1
WHERE n1.part_number = n.part_number AND n1.on_hand = 1);

SELECT COUNT(*)
FROM part_nyc n, part_sfo s, color c
WHERE (n.color = c.color_id AND c.color_name = 'Red'
AND n.on_hand > 0)
OR (s.color = c.color_id AND c.color_name = 'Red'
AND s.on_hand > 0);

SELECT sup.supplier_name
FROM supplier sup
WHERE (
SELECT SUM (n.on_hand)
FROM part_nyc n
WHERE
n.supplier = sup.supplier_id)
> (
SELECT SUM (s.on_hand)
FROM part_sfo s
WHERE
s.supplier = sup.supplier_id);

SELECT sup.supplier_name
FROM supplier sup, part_nyc n
WHERE n.part_number NOT IN(
SELECT s.part_number
FROM part_sfo s
);

UPDATE part_nyc
SET on_hand = 10;

DELETE
FROM part_nyc n
WHERE n.on_hand < 30;
