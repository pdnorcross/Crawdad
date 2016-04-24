class AcceptedReport < Dossier::Report
  def dossier_client
    connection_options = { 'adapter' => 'mysql2', 'encoding' => 'utf8', 'pool' => 5, 'socket' => '/tmp/mysql.sock',
                           'database' => ENV['OUTDABBA_DB'], 'host' => ENV['OUTDABBA_HOST'], 'username' => ENV['OUTDABBA_USERNAME'],
                           'password' => ENV['OUTDABBA_PASSWORD'] }
    Dossier::Client.new(connection_options)
  end

  def sql
    "SELECT
      b.isbn as 'ISBN',
      COUNT(c.id) as 'QTY',
      FORMAT(SUM(c.price),2) as 'TOTAL',
      FORMAT(AVG(c.price),2) as 'AVG PRICE',
      FORMAT(MAX(c.price),2) as 'MAX PRICE',
      b.fcb_price as 'FCB',
      b.grade as 'GRADE',
      b.author as 'Author',
      b.title as 'Title',
      b.edition as 'Edition',
      b.list_price as 'List',
      b.used_wholesale_price as 'Used WH',
      b.lowest_price as 'Lowest Price',
      b.trade_in as 'Trade In',
      FORMAT(b.sales_rank_aug_average,0) as 'Aug Rank',
      b.lowest_price_aug_average as 'PC3',
      b.publication_date as 'Pub Date',
      b.amazon_rental as 'Amazon Rental',
      b.lowest_rental as 'Lowest Rental',
      GROUP_CONCAT(DISTINCT(t.name)) as 'Tags'

    FROM
      amazon_trade_accepted c

    LEFT JOIN amazon_trade a ON a.id = c.amazon_trade_id
		LEFT JOIN books b ON b.product_id = a.product_id
    LEFT JOIN tags_products tg ON tg.product_id = a.product_id
    LEFT JOIN tag t ON t.id = tg.tag_id

    WHERE
      DATE(c.created_at) > (NOW() - INTERVAL 2 DAY)

    GROUP BY
      b.isbn

    ORDER BY
      COUNT(c.id) DESC;"
  end
end
