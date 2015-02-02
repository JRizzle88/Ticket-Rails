# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

User.create(name: "Kristen Hope", email: "kho@tdh.ch", password: "khokho", password_confirmation: "khokho", role: 0)
User.create(name: "Hasan Lemhamad", email: "hle@tdh.ch", password: "hlehle", password_confirmation: "hlehle", role: 0)
User.create(name: "Hala Chibli", email: "hch@tdh.ch", password: "hchhch", password_confirmation: "hchhch", role: 0)
User.create(name: "Hisham Mehsen", email: "hme@tdh.ch", password: "hmehme", password_confirmation: "hmehme", role: 0)
User.create(name: "Nivine Bedwi", email: "nbe@tdh.ch", password: "nbenbe", password_confirmation: "nbenbe", role: 0)
User.create(name: "Walaa Mousa", email: "wmo@tdh.ch", password: "wmowmo", password_confirmation: "wmowmo", role: 0)
User.create(name: "Maher Fares", email: "mfa@tdh.ch", password: "mfamfa", password_confirmation: "mfamfa", role: 0)
User.create(name: "Zainab Bezieh", email: "zbe@tdh.ch", password: "zbezbe", password_confirmation: "zbezbe", role: 0)
User.create(name: "Basma Doukhi", email: "bdo@tdh.ch", password: "bdobdo", password_confirmation: "bdobdo", role: 0)
User.create(name: "Ahmad Daher", email: "ada@tdh.ch", password: "adaada", password_confirmation: "adaada", role: 0)
User.create(name: "Hiba Farran", email: "hfa@tdh.ch", password: "hfahfa", password_confirmation: "hfahfa", role: 0)
User.create(name: "Immad Orouqi", email: "ior@tdh.ch", password: "iorior", password_confirmation: "iorior", role: 0)

Category.create([
  {name: "Profiles"},
  {name: "Projects"},
  {name: "Tasks"},
  {name: "Tickets"},
  {name: "Sitewide"},
  {name: "Other"},
])

Ticket.create(title: "Major Issues", description: "CPU Failure, Can you Help me?", user_id: 13, category_id: 3)

TicketStatus.create([
  {name: "Open", position: 1},
  {name: "Pending", position: 2},
  {name: "Closed", position: 3}
])
