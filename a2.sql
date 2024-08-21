-- Analyze the cumulative revenue generated over time.

select oder_date, 
sum(revenue) over(order by oder_date) as cum_revenue
from
(select orders.oder_date,
sum(orders_details.quantity*pizzas.price) as revenue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id
join orders
on orders.order_id = orders_details.order_id
group by orders.oder_date) as sales;