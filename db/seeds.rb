#Create users && admin
user = User.new(
  email: 'test@test.com',
  password: 'password'
)
user.save!

admin = User.new(
  email: 'admin@admin.com',
  password: 'password',
  admin: true
)
admin.save!

#create categories
category = Category.create(
  name: "Action"
)
category = Category.create(
  name: "Fantasy"
)
category = Category.create(
  name: "History"
)

5.times do |i|
  #some book
  book = user.books.new(title: "book#{i + 1}", body: 'description', author: "author#{i + 1}")
  book.preview = File.open(File.join(Rails.root, 'db', 'seed_images', '11.jpg'))
  book.save!
  book.categories << Category.find_by(name: "History")
  #SW
  book = user.books.new(title: "StarWars#{i + 1}", body: 'A long time ago in a galaxy far far away...', author: "George Lucas")
  book.preview = File.open(File.join(Rails.root, 'db', 'seed_images', 'sw.jpg'))
  book.save!
  book.categories << Category.find_by(name: "Action")
  #hobbit
  book = user.books.new(title: "Hobbit#{i + 1}", body: 'In a hole in the ground there lived a hobbit.', author: "Tolkien")
  book.preview = File.open(File.join(Rails.root, 'db', 'seed_images', 'hobbit.jpg'))
  book.save!
  book.categories << Category.find_by(name: "Fantasy")
end
