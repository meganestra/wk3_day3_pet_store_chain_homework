require('pg')
require_relative('pet_store')

class Pet

  attr_reader(:id, :name, :type, :pet_store_id)

  def initialize(options, runner)
    @id = options["id"].to_i
    @name = options["name"]
    @type = options["type"]
    @pet_store_id = options["pet_store_id"]
    @runner = runner
  end

  def save()
    sql = "INSERT INTO pets (name, type) VALUES ('#{@name}', '#{@type}') RETURNING *"
    pets_data = @runner.run(sql)
    @id = pets_data.first["id"].to_i
  end

end