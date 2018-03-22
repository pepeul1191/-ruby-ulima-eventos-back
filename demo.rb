require 'mongo_mapper'
require 'activemodel-serializers-xml'

MongoMapper.connection = Mongo::Connection.new('127.0.0.1')
MongoMapper.database = 'eventos'

class Person
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document

  key :first_name, String
  key :last_name, String
  key :age, Integer
  key :born_at, Time
  key :active, Boolean
  key :fav_colors, Array
end

person = Person.create({
  :first_name => 'John',
  :last_name => 'Nunemaker',
  :age => 27,
  :born_at => Time.mktime(1981, 11, 25, 2, 30),
  :active => true,
  :fav_colors => %w(red green blue)
})

#person.save
#puts person.id

persons = Person.all
puts persons.to_json
