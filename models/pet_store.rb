require('pg')

class PetStore

  attr_reader(:id, :name, :address_line, :stock_type, :runner)

  def initialize(options, runner)
    @id = options["id"].to_i
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

  def list_pets()
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    pets_data = @runner.run(sql)
    array = pets_data.map { |pet| Pet.new(pet, runner) }
    return array
  end

  def find_store_by_id()
    sql = "SELECT * FROM pet_stores WHERE id = #{@id}"
    store_by_id = @runner.run(sql)
    pet_store = PetStore.new(store_by_id.first, @runner)
    return pet_store
  end

  def delete()
    sql = "DELETE FROM pet_stores WHERE id = #{@id}"
    @runner.run(sql)
  end

end