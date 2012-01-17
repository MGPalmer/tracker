# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mail = "mail@example.com"
pass = "password"
AdminUser.create!(:email => mail, :password => pass, :password_confirmation => pass)
puts "Admin user with '#{mail}'/'#{pass}' created"
c = Campaign.create!(:name => "Example Campaign", :ref => "example")
p = Pixel.create!(:name => "pixel for campaign", :content => '<p>This is a tracking device (Your setup is working!):</p><img src="https://encrypted-tbn3.google.com/images?q=tbn:ANd9GcQXIwpUArUea62IYCWcfA4iFYEybJ3mW5r06QIgjZXsBlebEkreNLhP8z3jbw"/>')
Rule.create!(:campaign => c, :pixel => p)
p2 = Pixel.create!(:name => "pixel for campaign and goal",:content => '<p>landingpage & campaign !:</p><img src="https://encrypted-tbn0.google.com/images?q=tbn:ANd9GcQIRQczEc1ieii99cvhHdSH6-XZO_GbpqYGLsxz-LskSpPaDTRh3Q"</img>')
g = Goal.create!(:ref => "landingpage", :name => "Landing Page Goal")
Rule.create!(:campaign => c, :pixel => p2, :goal => g)
p3 = Pixel.create!(:name => "always-on pixel", :content => "<h1>I'm always there !</h1>")
Rule.create!(:pixel => p3)
puts "Created example campaign/script (go to localhost:3000 to see them)"