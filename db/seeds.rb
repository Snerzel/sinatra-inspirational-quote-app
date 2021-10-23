

hecktor = User.create(name: "Hecktor", email: "hecktor@time.org", password: "user1")
sam = User.create(name: "Sam", email: "samland@time.org", password: "user2")

InspirationalQuote.create(content: "Seize the day! Because each one is unique!", user_id: hecktor.id)

hecktor.inspirational_quotes.create(content: "You can do it!")

sam_quote = sam.inspirational_quotes.build(content: "You miss every shot you never take.")
sam_quote.save
