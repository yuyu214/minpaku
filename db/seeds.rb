# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# 都道府県リスト
cities = ["東京", "大阪", "京都", "札幌"]

cities.each do |city|
  10.times do |i|
    # 施設を作成
    facility = Facility.create!(
      name: "#{city}のテスト施設#{i + 1}",
      description: "#{city}のテスト用施設です（#{i + 1}）",
      price: rand(5000..20000),
      address: city
    )

    # 施設に部屋を1件作成
    room = facility.rooms.create!(
      name: "#{facility.name}の部屋1",
      price: facility.price,
      description: "#{city}のデフォルト部屋"
    )

    puts "作成: Facility #{facility.id} - Room #{room.id}"
  end
end

puts "シードデータ作成完了！"
