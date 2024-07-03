create DATABASE challenge6;
use challenge6;

CREATE TABLE items(
    id int PRIMARY KEY Auto_Increment,
    item_name varchar(15),
    stock int,
    min_stock int,
    description varchar(30)
);

INSERT INTO items (item_name, stock, min_stock, description)
VALUES 
('Indomie Goreng', 15, 10, 'Mie Instan rasa original'),
('Indomie Rendang', 3, 10, 'Mie Instan rasa Rendang'),
('Sarimi isi 2', 13, 10, 'Mie Instan isi 2 rasa Ayam Kecap'),
('Mie Sedap Goreng', 18, 10, 'Mie Instan rasa original'),
('Mie Gaga', 20, 5, 'Mie Instan rasa original');

CREATE PROCEDURE lihatStock()
BEGIN
    select id,
        item_name,
        stock,
        min_stock,
        description
    from items
    where stock < min_stock;
END

call lihatStock;
----------------------------------------------------------------------------------------------------------------       
CREATE PROCEDURE cekStock(
	IN kode VARCHAR(10))
BEGIN
DECLARE total_stock VARCHAR (50);

	IF ((SELECT SUM(stock) FROM items WHERE id = kode) !=0) THEN
		SET total_stock = (SELECT SUM(stock) FROM items WHERE id=kode);
	ELSE 	
		SET total_stock = 'Habis, Buruan Restock';
	END IF;
		SELECT total_stock;
END

call cekStock(2);
----------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE tambahStock(
BEGIN
    DECLARE stock_skrg INT;
    DECLARE min_stock INT;

    SELECT stock, min_stock INTO stock_skrg, min_stock
    FROM items
    WHERE id = item_id;

     IF stock_skrg < min_stock THEN
        UPDATE items
        SET stock = stock + (min_stock - stock_skrg)
        WHERE id = item_id;
        
        SELECT CONCAT('Stok berhasil ditambahkan untuk item ', item_id) AS message;
    ELSE
        SELECT 'Stok sudah mencukupi' AS message;
    END IF;
END

call tambahStock(2);
