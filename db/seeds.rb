
# Horoscope.create!([
#         [sign: "Aries", month: "February", content: "This month highlights your aspirations. Whether they are new or old goals, where can you rework or solidify your dreams? Is there anyone you know who can help you with next steps?"],
#         [sign: "Taurus", month: "February", content: "This month highlights your achievements. Are you satisfied with your career or reputation? If yes, how does it make you feel? If not, how can you take your power back?"],
#         [sign: "Gemini", month: "February", content: "This month highlights exploring your horizons. Whether you're planning a trip, focusing on your spiritual beliefs, or deciding to buckle down with school - how do these things expand your perspective on life?"],
#         [sign: "Cancer", month: "February", content: "This month highlights your resources, both mental and physical. How do you regenerate yourself or replenish your resources? Are you balancing how you give and take in your life?"],
#         [sign: "Leo", month: "February", content: "This month highlights your relationships. Check in with yourself often when it comes to how you interact with others. Where do you stand when it comes to codependence and independence?"],
#         [sign: "Virgo", month: "February", content: "This month highlights your work and health. Do you notice how one may effect the other? Be careful of burnout, allow yourself to rest. Can you allow yourself care and downtime without guilt?"],
#         [sign: "Libra", month: "February", content: "This month highlights your creativity. Is there an idea you've been vacillating on for a while but afraid to try? Your creativity is asking to be freed, will you allow it to manifest without judgement?"],
#         [sign: "Scorpio", month: "February", content: "This month highlights your foundations. You may be thinking more about your past or your home and family life - how do these things contribute to who you really are? How do can they help shape who you want to be?"],
#         [sign: "Sagittarius", month: "February", content: "This month highlights your communications. Everyday is filled with all types of communication between others but also with ourselves. What is the quality of your communications with others? What about how you speak to or think about yourself?"],
#         [sign: "Capricorn", month: "February", content: "This month highlights your values. What we value and how we value is important to our well-being. What is your relationship to your values? Do you over-value material things? Do you under-value yourself?"],
#         [sign: "Aquarius", month: "February", content: "This month highlights you! You may be focusing on your identity and how you show up in the world. What new beginnings are taking place in your life? If you can't think of any, is it time for a change?"],
#         [sign: "Pisces", month: "February", content: "This month highlights closure in your life. This is a great time for any activities involving solitude or spirituality. Are there any subconscious needs that may need attending to? What in your life could benefit from closure?"]
# ])

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
