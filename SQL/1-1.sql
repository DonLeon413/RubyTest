 

SELECT P.product_name gift_name,
       P.product_img_url, 
       P.product_url, 
       P. product_price_min, 
       P.product_short_description 
FROM grommet_gifts_categories AS GC
INNER JOIN grommet_product_categories AS PC ON PC.product_category_id = GC.id
INNER JOIN  rtest.grommet_products AS P ON PC.product_id = P.id 
 WHERE GC.sub_category LIKE 'Jewelry' 
	AND P.is_sold_out = 0