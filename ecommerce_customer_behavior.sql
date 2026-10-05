create database ecommerce;
use ecommerce;
select * from customer;

#1. Which customers purchase the most and how much do they spend?
select Customer_id,count(Order_id),sum(Quantity),sum(Total_Amount) from customer
group by customer_id
order by sum(Total_Amount) desc;

#2. Which product categories do customers purchase the most?
select Product_Category,sum(Quantity),SUM(Total_Amount) from customer
group by  Product_Category
order by SUM(Total_Amount) desc;

#3. How does customer spending differ between new and returning customers?
select Is_Returning_Customer,count(Order_id),sum(Total_Amount),sum(Quantity),avg(Total_Amount) from customer
group by Is_Returning_Customer;

#4. Does a higher discount lead to higher customer spending?
select Product_Category,sum(Discount_Amount) as total_discount,
sum(Total_Amount)as total_spent,
avg(Discount_Amount) as average_discount
from customer
group by Product_Category
order by total_spent desc;

#5. Does customer engagement affect purchase value?
select Session_Duration_Minutes, Pages_Viewed,Total_Amount from customer
order by Total_Amount desc;

#6. Which cities generate the most revenue and orders? 
select City,count(Order_id),sum(Total_Amount) from customer
group by  City
order by sum(Total_Amount) desc;

#7. Which payment methods are most commonly used and how much revenue do they generate?
select Payment_Method,count(Order_id),sum(Total_Amount) from customer
group by Payment_Method
order by sum(Total_Amount) desc;

#8. Which device types are associated with higher spending or more orders?
select Device_Type,count(Order_id),sum(Total_Amount),avg(Total_Amount) from customer
group by Device_Type
order by sum(Total_Amount) desc
;
#9. Does delivery time affect customer satisfaction?
select Delivery_Time_Days,count(Order_id) , avg(Customer_Rating) from customer
group by Delivery_Time_Days
ORDER BY Delivery_Time_Days;

#10. Which customer groups have higher purchase value based on age and gender?
select Gender, Age, count(Order_id),sum(Total_Amount),avg(Total_Amount) from customer
group by Gender,Age
order by sum(Total_Amount);