require 'sequel'
DB = Sequel.connect('sqlite://user.db')
# create an users table
DB.create_table? :users do
  primary_key :id
  String :name, uniq: false, null: false
  Integer :age
end
