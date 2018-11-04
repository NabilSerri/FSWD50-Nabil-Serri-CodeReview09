SELECT customer_F_name,customer_L_name ,City,street
FROM customer
INNER JOIN customer_address on fk_customer_addres = customer_address_id;

SELECT invoice,pay,damaged_the_car,gasoline_tank_status
FROM checking_charges
INNER JOIN payment_method on fk_payment_method = payment_method_id
INNER JOIN checking_result  on fk_payment_method = checking_result_id;

SELECT deliver_date,return_date
FROM deliver
INNER JOIN `return` on fk_client_id = deliver_id;
