 SELECT P.product_name,
	    P.product_img_url,
        P.product_url, 
        P.product_price_min,
        P.product_short_description 
 FROM grommet_gifts_categories AS GC
 INNER JOIN grommet_product_categories AS PK ON PK.product_category_id = GC.Id 
 INNER JOIN grommet_products AS P ON p.Id = PK.product_id
 WHERE ( GC.sub_category LIKE  'Beauty & Personal Care'
	     OR GC.sub_category LIKE  'Skincare' )
      AND P.is_sold_out = 0

UNION

SELECT  P.product_name,
	    P.product_img_url,
        P.product_url, 
        P.product_price_min,
        P.product_short_description 
	FROM grommet_product_keywords AS K
    INNER JOIN grommet_product_to_keyword AS PK ON PK.keyword_id = K.id
    INNER JOIN grommet_products AS P ON P.id = PK.product_id
    WHERE K.keyword LIKE 'Aromatherapy'
          AND P.is_sold_out = 0
      
