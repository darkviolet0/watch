# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Theme.create(name: 'Watch Cyclo', short_description: '‘Watch-Cyclo’ est un service participatif en ligne pour renforcer la mobilisation citoyenne pour la promotion du vélo, et exprimer la perception de la communauté par rapport aux enjeux des politiques cyclables urbaines.')

#Site.create(location: 'Bordeaux', latitude: '-0.56667', longitude: '44.8333', description: 'A ce jour, le réseau des pistes et bandes cyclables dépasse les 200 km dans Bordeaux intra-muros, soit le tiers du réseau de l\'agglomération. Et il n\'est pas un mois sans que de nouveaux itinéraires soient aménagés.', theme_id: 1, created_at: '2016-09-16 09:08:23', updated_at: '2016-09-16 09:08:23')
#Site.create (location: 'Nantes', longitude: '47.2173' , latitude: '-1.55336', description: 'L\'agglomération nantaise possède un réseau cyclable de 373 km.', theme_id:1);



require 'csv'

=begin
csv_text = File.read(Rails.root.join('lib', 'seeds', 'sigpistescycl-Bordeaux.csv'))
csv = CSV.parse(csv_text, :headers => true, :col_sep => ";")
csv.each do |row|
  cd = CycleTrack.new
  cd.id = row['CLE']
  cd.typology = row['NATURE']
  cd.name = row['NOM']
  cd.side = row['SITUATION']
  cd.geometry = row['GEOMETRIE']
  cd.long = row['X_LONG'].gsub(/[.,]/, '.' => '', ',' => '.')
  cd.lat = row['Y_LAT'].gsub(/[.,]/, '.' => '', ',' => '.')
  cd.id_site = "1"
  cd.save
  puts "#{cd.name}  #{cd.long} #{row['X_LONG']} saved"
end

puts "There are now #{CycleTrack.count} rows in the cycle_data table"
=end

puts "Importing Paris cycle tracks data"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'reseau-cyclable-Paris.csv'))
csv = CSV.parse(csv_text, :headers => true, :col_sep => ";")
csv.each do |row|
  cd = CycleTrack.new
  cd.id = row['OBJECTID']
  cd.district = row['ARRDT']
  cd.typology = row['TYPOLOGIE'].to_s.downcase
  cd.name = row['TYPE_VOIE'].to_s.downcase + " " + row['NOM_VOIE'].to_s.downcase
  cd.side = row['SENS_VELO'].to_s.downcase
  cd.geometry = row['geo_shape']
  cd.long = row['geo_point_2d'].split(/,/).last
  cd.lat = row['geo_point_2d'].split(/,/).first
  cd.id_site = "4"
  cd.save
  puts "#{cd.name}  #{cd.long} #{cd.lat} saved"
end

puts "There are now #{CycleTrack.count} rows in the cycle_data table"