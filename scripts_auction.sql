SELECT 
    users_user_id, users.full_name, bid_id
FROM
    bids JOIN users ON users_user_id = users.user_id
WHERE user_id = 100;

SELECT 
    users_user_id, users.full_name, items.title, item_id
FROM
    items JOIN users ON users_user_id = users.user_id
WHERE user_id = 100;

SELECT 
    item_id, title
FROM
    items
WHERE
    title LIKE '%e';

SELECT 
    item_id, description
FROM
    items
WHERE
    description LIKE '%shaft%';

SELECT 
    users_user_id, users.full_name, AVG(start_price)
FROM
    items JOIN users ON users_user_id = users.user_id
GROUP BY user_id
ORDER BY user_id;

SELECT DISTINCT
    items_item_id, MAX(bid_value) AS max_bid_value
FROM
    bids
GROUP BY items_item_id;

SELECT 
    users_user_id, item_id
FROM
    items
WHERE users_user_id = 100;

SELECT 
    users_user_id, item_id, title, stop_date
FROM
    items
WHERE
    stop_date > '2021-06-28 00:00:00'
        AND users_user_id = 100;

INSERT INTO users(full_name, billing_address, login, password) VALUES (DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO items(users_user_id) VALUES (110);

DELETE FROM bids 
WHERE
    users_user_id = 110;

DELETE FROM items 
WHERE
    users_user_id = 110;

UPDATE items 
SET 
    start_price = 2 * start_price
WHERE
    users_user_id = 109;