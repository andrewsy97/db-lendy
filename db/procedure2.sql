CREATE PROCEDURE
  get_number_item_type
  (IN i_type CHAR(50))
  SELECT
    COUNT(items.id)
  FROM
    items, item_types
  WHERE items.item_type_id = item_types.id
        AND item_types.name = i_type;