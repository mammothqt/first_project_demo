namespace :data do
  desc "create user"
  task create_user: :environment do
    admin1 = User.create!(full_name: "Tran Quoc Trung", user_name: "mammoth",
      email: "quoctrungtran256@gmail.com", age: 26, password: "123456", admin: true).confirm
    admin2 = User.create!(full_name: "Admin", user_name: "admin",
      email: "admin@gmail.com", age: 26, password: "123456", admin: true).confirm
    guest = User.create!(full_name: "guest1", user_name: "guest1",
      email: "guest@gmail.com", age: 26, password: "123456").confirm
    20.times do |n|
  	  User.create!(full_name: Faker::Name.name,
  				 user_name: Faker::Name.name,
  				 email: Faker::Internet.email,
  				 age: 30,
  				 password: "123456").confirm
    end
  end

  desc "create category"
  task create_category: :environment do
  	20.times { Category.create! name: Faker::Book.title,
  		description: Faker::Lorem.sentence }
  	Category.all.each do |category|
  	  20.times { Course.create! name: Faker::Book.author,
  	    description: Faker::Quote.famous_last_words, category: category }
  	end
  	Course.all.each do |course|
  	  20.times { WordList.create! word: Faker::Lorem.word, course: course }
  	end
  end

  desc "create test"
  task create_test: :environment do
    10.times { Test.create! name: Faker::Marketing.buzzwords,
      description: Faker::Lorem.paragraphs }
    Test.all.each do |test|
      3.times { Question.create! content: Faker::Lorem.question, test: test, correct_answer_id: 0 }
    end
    Question.all.each do |question|
      4.times { Answer.create! question: question, content: Faker::Lorem.sentence }
    end
  end
end
