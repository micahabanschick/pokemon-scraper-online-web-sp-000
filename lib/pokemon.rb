class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end 
  
  def self.save
    sql = "INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)"
    self.db.execute(sql, self.id, self.name, self.type)
  end 
  
  def self.find(id)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    row = self.db.execute(sql, id)[0]
    self.new(row[0],row[1],row[2],row[3])
  end
  
end
