# arr = [
#   "北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"
# ]

# arr.size.times do |i|
#   Residence.create([
#     'name' => arr[i]
#   ])
# end

require 'faker'

# 99.times do
# User.create!([
#   name: Faker::Name.unique.name,
#   email: Faker::Internet.unique.email,
#   password: 'password',
#   image: File.open("./public/images/user.jpg"),
#   age_id: rand(1..Age.count),
#   gender_id: rand(1..Gender.count),
#   residence_id: rand(1..Residence.count)
# ])
# end

# arr = [
#   'img_item01.jpg',
#   'img_item02.jpg',
#   'img_item03.jpg',
#   'img_item04.jpg',
#   'img_item05.jpg',
#   'img_item06.jpg',
#   'img_item07.jpg',
#   'img_item08.jpg',
#   'img_item09.jpg',
#   'img_item10.jpg',
#   'img_item11.jpg',
#   'img_item12.jpg',
#   'img_item13.jpg',
#   'img_item14.jpg',
#   'img_item15.jpg',
#   'img_item16.jpg',
#   'img_item17.jpg'
# ]

# 500.times do
#   Item.create!([
#     name: Faker::Name.unique.name,
#     description: Faker::Lorem.paragraph,
#     image: File.open("./public/images/#{arr[rand(0..arr.size - 1)]}"),
#     release_date: Faker::Date.between(from: '2015-09-23', to: '2022-08-07'),
#     category_id: rand(1..Category.count)
#   ])
# end

200.times do
Review.create!([
  body: Faker::Lorem.paragraph,
  star: rand(1..5),
  user_id: rand(1..User.count),
  item_id: rand(1..Item.count)
])
end
