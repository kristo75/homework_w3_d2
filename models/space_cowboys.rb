require('pg')

class Bounty

  attr_accessor :name
  attr_reader

  def initialize( params )

    @id = params['id'].to_i if params['id']
    @name = params['name']
    @species = params['species']
    @bounty_value = params['bounty_value'].to_i
    @danger_level = params['danger_level']
  end


  def save()
    db = PG.connect( { dbname: 'space_cowboy', host: "localhost" } )
    sql =
    "INSERT INTO bounties
    ( name,
      species,
      bounty_value,
      danger_level
    )
    VALUES
    ( $1, $2, $3, $4)
    RETURNING *
    "
    values =[@name, @species, @bounty_value, @danger_level]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def self.all()
    db = PG.connect( {dbname: 'space_cowboy', host: 'localhost'})
    sql = "SELECT * FROM bounties"
    db.prepare("all", sql)
    bounties = db.exec_prepared("all") #somewhere to store data
    db.close()
    return bounties.map {|bounty| Bounty.new(bounty)}
  end

  def self.delete_all()
    db = PG.connect( {dbname: 'space_cowboy', host: 'localhost'})
    sql = "DELETE FROM bounties"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete()
    db = PG.connect( {dbname: 'space_cowboy', host: 'localhost'})
    sql = "DELETE FROM bounties
    WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close
  end

  def update()
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'})
    sql = "UPDATE bounties
    SET (
      name,
      species,
      bounty_value,
      danger_level
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@name, @species, @bounty_value, @danger_level, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close
    end



  end
