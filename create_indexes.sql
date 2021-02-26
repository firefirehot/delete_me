CREATE INDEX nyc
ON table part_nyc
 USING BTREE
( part_number)

CREATE INDEX sfo
ON table part_sfo
 USING BTREE
( part_number)

CREATE INDEX sup 
ON table suppliers
 USING BTREE
( supplier_id)

CREATE INDEX index col
ON table colors
 USING BTREE
( color_id)
