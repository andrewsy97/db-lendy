CREATE TRIGGER update_times_borrowed AFTER INSERT ON reservations
FOR EACH ROW update items SET items.times_borrowed = items.times_borrowed +1
WHERE items.id = new.item_id;