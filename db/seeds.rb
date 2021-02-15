
Month.create!([
        [name: "January"],
        [name: "February"],
        [name: "March"],
        [name: "April"],
        [name: "May"],
        [name: "June"],
        [name: "July"],
        [name: "August"],
        [name: "September"],
        [name: "October"],
        [name: "November"],
        [name: "December"]
])

admin=User.new({ name: "Admin", email: 'lacksydaisy@gmail.com', password: 'Topsecretpw123', password_confirmation: 'Topsecretpw123'})

admin.toggle!(:admin)

if admin.valid?
    admin.save()
elsif admin.errors.any?
    admin.errors.full_messages.each do |msg|
        puts msg
    end
else
    puts "****NOT VALID****"
end
