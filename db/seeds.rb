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
s = Script.create!(:content => '<p>This is a tracking device (Your setup is working!):</p><img src="https://encrypted-tbn3.google.com/images?q=tbn:ANd9GcQXIwpUArUea62IYCWcfA4iFYEybJ3mW5r06QIgjZXsBlebEkreNLhP8z3jbw"/>')
c.scripts << s
puts "Created example campaign/script (go to localhost:3000/?ref=example)"