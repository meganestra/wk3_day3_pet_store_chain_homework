require('pg')

class PetStore

  attr_reader(:id, :name, :address_line, :stock_type, :runner)

  def initialize(options, runner)
    @id = options["id"]
    @name = options["name"]
    @address_line = options["address_line"]
    @stock_type = options["stock_type"]
    @runner = runner
  end

  def save()
    sql = "INSERT INTO pet_stores (name, address_line, stock_type) VALUES ('#{@name}', '#{@address_line}', '#{stock_type}') RETURNING *"
    pet_stores_data = @runner.run(sql)
    @id = pet_stores_data.first["id"].to_i
  end


end