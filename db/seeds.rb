
5.times do
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

10.times do
	app = Application.create!(
		name: Faker::App.name,
		url: Faker::Internet.url,
		user: users.sample
	)
end
apps = Application.all

200.times do
	event_names = ["Checkout", "Page Visit", "Sign Up", "Confirmation Page"]
	event = Event.create!(
		name: event_names.sample,
		application: apps.sample
	)
	event.update_attribute(:created_at, rand(10.minutes..1.month).ago)
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} apps created"
puts "#{Event.count} events created"