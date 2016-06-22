require('pg')
require_relative('./models/pet')
require_relative('./models/pet_store')
require_relative('./db/sql_runner')
require('pry-byebug')

runner = SqlRunner.new( {dbname: "pet_shop_chain", host: "localhost"} )

pet_store = PetStore.new( {"name" => "Unit A", "address_line" => "Meadowhall Retail Park", "stock_type" => "Regular stock" }, runner )
pet_store.save()


pet_1 = Pet.new( {"name" => "Bug", "type" => "Dog", "pet_store_id" => pet_store.id }, runner )
pet_1.save()


binding.pry
nil