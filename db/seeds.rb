
15.times do
	user = User.create!(
		email: Faker::Internet.free_email,
		password: "password"
	)
end

user = User.create!(
	email: "dlevin64@gmail.com",
	password: "password"
	)

users = User.all

50.times do
	app = Application.create!(
		name: Faker::Internet.domain_word,
		url: Faker::Internet.url,
		user: users.sample
	)
end
apps = Application.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} apps created"