
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

25.times do
	app = Application.create!(
		name: Faker::App.name,
		url: Faker::Internet.url,
		user: users.sample
	)
end
apps = Application.all

200.times do
	i = rand(1..5)
	event = Event.create!(
		name: "event #{i}",
		application: apps.sample
	)
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} apps created"
puts "#{Event.count} events created"