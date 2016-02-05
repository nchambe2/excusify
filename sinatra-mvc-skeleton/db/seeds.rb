User.delete_all
Excuse.delete_all
Comment.delete_all

user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")

user_two = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")

excuse_one = Excuse.create!(body: "Hey, I can't make it today. I ate some of my grandmothers leftover coleslaw, and I think I have food poisoning.", creator: user)

excuse_two = Excuse.create!(body: "Hey, I won't be able to make it today. They sent a jury duty notice to my old address instead of my current one. They forwarded it to my current address, but it didn't arrive until yesterday. There calling my name I have to go.", creator: user)

excuse_three = Excuse.create!(body: "Hey, my second cousin twice removed just passed away last night. We were really close. I've been crying all night. It's just so hard.", creator: user)

Excuse.create!(body: "Hey, so I went to [insert fancy restaurant name here]. I ate some of their [insert fancy dish name]. Apperantely, I am allergic to [insert fancy ingredient name here]. Can you believe it? I broke out in hives. So I'm goign to take a day off.", creator: user)

Excuse.create!(body: "Hey, so I went to [insert fancy restaurant name here]. I ate some of their [insert fancy dish name]. Apperantely, I am allergic to [insert fancy ingredient name here]. Can you believe it? I broke out in hives. So I'm goign to take a day off.", creator: user)

Excuse.create!(body: "Hey, so my babysitter flaked on me today. So I don't have anyone to watch [insert random child name here]. I would just bring her in be you know how the terrible [insert current child age].", creator: user)

Excuse.create!(body: "Hey, so [insert random child name here] has been running a fevor and sick all night.  I'm going to stay home and take care of her.", creator: user)

Excuse.create!(body: "Hey, so I just got into a fender bender. I'm ok and my car is ok, but I'm a little shook up. I'm going to take a day.", creator: user)

Excuse.create!(body: "Hey, so I just got into a fender bender. I'm ok and my car is ok, but I'm a little shook up. I'm going to take a day.", creator: user)

Excuse.create!(body: "Hey, I looked my keys in the car. I called triple A, but it's a wait time of 3 hours.", creator: user)

Excuse.create!(body: "Hey, the pipes are frozen. So I have no water right now. I could come in, but I feel like it I wouldn't be doing anyone a favor.", creator: user)


Excuse.create!(body: "Hey, I just converted to [insert obscure religion], and I was just informed by my [insert religious leader name] that today is a day of observance.", creator: user)

Comment.create!(body: "Thanks to this excuse I was able to miss work and not get fired!", commenter: user_two, excuse: excuse_one)

Comment.create!(body: "This excuse was sooooo clever! I was able to get out of work, and still be employeed.", commenter: user_two, excuse: excuse_two)

Comment.create!(body: "Thanks to Excusify I never have to think up a lie again! ", commenter: user_two, excuse: excuse_three)

Review.create!(rating:"1", reviewer: user, excuse: excuse_one)