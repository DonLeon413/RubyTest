
SELECT P.product_name,
	   P.product_img_url,
       P.product_url, 
       P.product_price_min,
       P.product_short_description 
	FROM rtest.grommet_product_keywords AS PK
    JOIN grommet_product_to_keyword AS PTK ON PTK.keyword_id = PK.id
    JOIN grommet_products AS P ON P.Id = PTK.product_id
    WHERE PK.keyword = 'Hair accessor' AND P.is_sold_out = 0
