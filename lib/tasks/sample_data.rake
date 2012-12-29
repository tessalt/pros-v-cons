namespace :db do 
  desc "Fill db with sample data"
  task populate: :environment do
    require 'faker'

    
    (1..5).each do |i|
      fake_name = Faker::Lorem.sentence(1)
      List.create!(name: fake_name, id: i)
      30.times do |j|
        fake_content = Faker::Lorem.sentence(7)
        Point.create!(content: fake_content, list_id: i, weight: 1 + rand(3), pro: [true, false].sample )
      end
    end
  end
end