    -----veri ekleme kýsýmlarý--
    Insert into ECommerce.Person (Person_id,Person_firstName,Person_lastName,Person_phone,Person_address) values (10,'Seyma','Tekil','05388969456','Izmir');
    Insert into ECommerce.Person (Person_id,Person_firstName,Person_lastName,Person_phone,Person_address) values (9,'Pelin','Yildirim','05387669674','Ankara');
    Insert into ECommerce.Person (Person_id,Person_firstName,Person_lastName,Person_phone,Person_address) values (11,'Ezgi','Simsek','05796467436','Ordu');

    
    
    Insert into ECommerce.Product (Product_id,Product_name,Product_detail,Stock_Quantity,Price) values (4,'Gozluk','kirmizi',201,16);
    Insert into ECommerce.Product (Product_id,Product_name,Product_detail,Stock_Quantity,Price) values (5,'Sapka','siyah',156,65);
    Insert into ECommerce.Product (Product_id,Product_name,Product_detail,Stock_Quantity,Price) values (6,'Pantolon','pembe',804,89);
    
    
     Insert into ECommerce.Orders (Order_id,Order_amount,Order_date,Order_quantity,Person_id,Product_id) values (4,410,'02/04/2020',21,10,4);
     Insert into ECommerce.Orders (Order_id,Order_amount,Order_date,Order_quantity,Person_id,Product_id) values (5,162,'27/09/2020',31,9,5);
     Insert into ECommerce.Orders (Order_id,Order_amount,Order_date,Order_quantity,Person_id,Product_id) values (6,203,'23/08/2020',29,11,6);
     
--- join ornekleri---

  select Pe.Person_firstName, O.Order_amount
  from ECommerce.Orders O
  inner join ECommerce.Person Pe
    on O.Order_id=Pe.Person_id
	
    order by O.Order_amount;
    
    select P.Stock_Quantity,count(*)
    from ECommerce.Orders O
	inner join ECommerce.Product P on O.Order_id=P.Product_id
    group by P.Stock_Quantity;
    
    SELECT P.Person_firstName FROM ECommerce.Person P
    inner join ECommerce.Orders O  on P.Person_id = O.Order_id
    where P.Person_address='Ankara'
    
    --- combine ornekleri----

    select O.Order_id, O.Order_amount as TOTAL from ECommerce.Orders O
    UNION
    select P.Product_id, P.Price AS TOTAL from ECommerce.Product P
    
    ----kesisim kümesinin hepsi geliyor.--
    select O.Order_id, O.Order_amount as TOTAL from ECommerce.Orders O
    UNION ALL
    select P.Product_id, P.Price AS TOTAL from ECommerce.Product P
    
    
    select O.Order_id, O.Order_amount as TOTAL from ECommerce.Orders O
    MINUS
    select P.Product_id, P.Price AS TOTAL from ECommerce.Product P
    
----KESÝSÝMÝ GETÝRÝYOR----
    select O.Order_id  from ECommerce.Orders O
    INTERSECT
    select P.Product_id from ECommerce.Product P
    
    ----fonksiyonlar---
    select avg(Order_amount) from ECommerce.Orders;
    select min(Price) from ECommerce.Product;
    select * from ECommerce.Orders where TO_CHAR(Order_date, 'Month') like '02%';
    
SELECT Person_id, CONCAT(Person_firstName,Person_lastName) NAME,
LENGTH (Person_lastName),
INSTR(Person_lastName, 'a') "Contains 'a'?" --String bir ifadede aranýlan karakterin kaçýncý index’te olduðunu bulmada
FROM ECommerce.Person

SELECT Price, lpad(Price,6,'*') FROM ECommerce.Product; -- istenilen verinin soluna istenilen karakteri ekleyebiliriz.

SELECT Price, rpad(Price,5,'$') FROM ECommerce.Product; --sagýna

select replace('berfin and aydýn','B','fin') from dual; ---??
select trim('b' from 'bbBerfin aydýn') from dual;

select Order_id, round(MONTHS_BETWEEN (sysdate,Order_date )) as  "Ay bazýnda çalýþma süresi"
from ECommerce.Orders where Order_id='6'; --Ýki tarih arasýnda zamaný almaya yarar