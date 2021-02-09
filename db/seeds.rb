# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Horoscope.create!([
        [ascendant: "Aries", month: "February", content: "This month highlights your aspirations. Whether they are new or old goals, where can you rework or solidify your dreams? Is there anyone you know who can help you with next steps?"],
        [ascendant: "Taurus", month: "February", content: "This month highlights your achievements. Are you satisfied with your career or reputation? If yes, how does it make you feel? If not, how can you take your power back?"],
        [ascendant: "Gemini", month: "February", content: "This month highlights exploring your horizons. Whether you're planning a trip, focusing on your spiritual beliefs, or deciding to buckle down with school - how do these things expand your perspective on life?"],
        [ascendant: "Cancer", month: "February", content: "This month highlights your resources, both mental and physical. How do you regenerate yourself or replenish your resources? Are you balancing how you give and take in your life?"],
        [ascendant: "Leo", month: "February", content: "This month highlights your relationships. Check in with yourself often when it comes to how you interact with others. Where do you stand when it comes to codependence and independence?"],
        [ascendant: "Virgo", month: "February", content: "This month highlights your work and health. Do you notice how one may effect the other? Be careful of burnout, allow yourself to rest. Can you allow yourself care and downtime without guilt?"],
        [ascendant: "Libra", month: "February", content: "This month highlights your creativity. Is there an idea you've been vacillating on for a while but afraid to try? Your creativity is asking to be freed, will you allow it to manifest without judgement?"],
        [ascendant: "Scorpio", month: "February", content: "This month highlights your foundations. You may be thinking more about your past or your home and family life - how do these things contribute to who you really are? How do can they help shape who you want to be?"],
        [ascendant: "Sagittarius", month: "February", content: "This month highlights your communications. Everyday is filled with all types of communication between others but also with ourselves. What is the quality of your communications with others? What about how you speak to or think about yourself?"],
        [ascendant: "Capricorn", month: "February", content: "This month highlights your values. What we value and how we value is important to our well-being. What is your relationship to your values? Do you over-value material things? Do you under-value yourself?"],
        [ascendant: "Aquarius", month: "February", content: "This month highlights you! You may be focusing on your identity and how you show up in the world. What new beginnings are taking place in your life? If you can't think of any, is it time for a change?"],
        [ascendant: "Pisces", month: "February", content: "This month highlights closure in your life. This is a great time for any activities involving solitude or spirituality. Are there any subconscious needs that may need attending to? What in your life could benefit from closure?"]
])

DATA = {
    # :user_keys =>
    #     ["name", "email", "password"],
    # :users => [
    #     ["Usagi", moonrabbit@gmail.com , "password"],
    #     ["Canary", apprenticebutler@gmail.com, "password"],
    #     ["Utena", roseprince@gmail.com, "password"],
    # ],
    :admins => [
        "Jenise Lacks Ruehle",
    ]
    }


def main
    make_admin
end

def make_admin
    DATA[:admins].each do |name|
        User.create(name: name, admin: true, password: 'password')
    end
end
