# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create(:id => 1, :countryname => "International")
Country.create(:id => 2, :countryname => "Korean")
Country.create(:id => 3, :countryname => "China")
Country.create(:id => 4, :countryname => "Taiwan")
Country.create(:id => 5, :countryname => "Thailand")
Country.create(:id => 6, :countryname => "Japan")
Country.create(:id => 7, :countryname => "Oceania")
Country.create(:id => 8, :countryname => "Vietnam")
Country.create(:id => 9, :countryname => "Mexico")
Country.create(:id => 10, :countryname => "Italy")
Country.create(:id => 11, :countryname => "Spain")
Country.create(:id => 12, :countryname => "France")
Country.create(:id => 13, :countryname => "Poland")

JobType.create(:id => 1, :type_title => "ESL JOBS")