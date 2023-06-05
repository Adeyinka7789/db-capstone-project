delimiter //
create procedure GetMaxQuantity()
begin
	select max(Quantity) as max_quantity from orders;
end;

create procedure GetOrderDetail(in customerID int)
begin
	prepare stmt from 'select order_id, quantity, order_cost from orders where customerID =?';
    set  @customerID = customerID;
    execute stmt using @customerID;
    deallocate prepare stmt;
end;

set @id =1;
execute GetOrderDetail(@id)

delimiter;

delimiter //
create procedure CancelOrders(in OrderID int)
begin
	delete from orders where OrderID = OrderID;
end //

