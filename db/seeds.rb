# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!(:email => "nagano@cake", :password => "naganocake")

Customer.create!(:last_name => "山田", :first_name => "花子", :last_name_kana => "ヤマダ",
:first_name_kana => "ハナコ", :email => "yamada@hanako", :password => "yamadahanako",
:postal_code => "111-111", :address => "兵庫県神戸市1-1", :telephone_number => "090-1111-2222", :is_active => true)
