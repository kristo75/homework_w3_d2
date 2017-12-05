DROP TABLE IF EXISTS  bounties;

CREATE TABLE bounties(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT8,
  danger_level VARCHAR,
  last_known_location VARCHAR,
  homeworld VARCHAR,
  favourite_weapon VARCHAR,
  cashed_in BOOLEAN,
  collected_by VARCHAR
);

def save()
  db = PG.connect( { dbname: 'space_cowboy', host: "localhost" } )
  sql =
  "INSERT INTO bounties
  ( name,
    species,
    bounty_value,
    danger_level,
    last_known_location,
    homeworld,
    favourite_weapon,
    cashed_in,
    collected_by)
    VALUES
    ( $1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING *
    "
      values =[@first_name, @last_name, @quantity, @topping]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]['id'].to_i
      db.close()
end

def self.all()
  db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'})
  sql = "SELECT * FROM pizza_orders"
  db.prepare("all", sql)
  orders = db.exec_prepared("all") #somewhere to store data
  db.close()
  return orders.map {|order| PizzaOrder.new(order)}
end

def self.delete_all()
  db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'})
  sql = "DELETE FROM pizza_orders"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close()
end

def delete()
  db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'})
  sql = "DELETE FROM pizza_orders
  WHERE id = $1"
  values = [@id]
  db.prepare("delete_one", sql)
  db.exec_prepared("delete_one", values)
  db.close
end

def update()
  db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'})
  sql = "UPDATE pizza_orders
  SET (
    first_name,
    last_name,
    quantity,
    topping
  ) =
  (
    $1, $2, $3, $4
  )
  WHERE id = $5"
  values = [@first_name, @last_name, @quantitiy, @topping, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close
end
