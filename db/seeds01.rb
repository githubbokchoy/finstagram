# db/seed.rb  #seed is a default name used by rake, reserved name


records = [
  {
    user: { username: "sharky_j", avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg", email: "sharky_j@gmail.com", password: "abcd" },
    post: { photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg"}
  },
  {
    user: { username: "kirk_whalum", avatar_url: "https://live.staticflickr.com/65535/52358421348_f34c7996b1.jpg", email: "kirk_w@gmail.com", password: "abcd" },
    post: { photo_url: "https://live.staticflickr.com/65535/52357237337_1cc718f6a7_4k.jpg"}
  },
  {
    user: { username: "marlin_peppa", avatar_url: "https://live.staticflickr.com/65535/52358415933_0a0e6bc35f_3k.jpg", email: "marlin_p@gmail.com", password: "abcd" },
    post: { photo_url: "https://live.staticflickr.com/65535/52358494794_f88b160d15_4k.jpg"}
  }
]

# create Users and FinstagramPosts
records.each do |record|
  user_seed = record[:user]
  post_seed = record[:post]

  if !User.find_by(username: user_seed[:username])
    # Create a User
    user = User.create user_seed
    puts "-- Seeded User: #{user.username}"

    # Create a FinstagramPost
    FinstagramPost.create photo_url: post_seed[:photo_url], user_id: user.id
    puts "-- Seeded a FinstagramPost for User: #{user.username}"
  end
end

=begin
  


comments = [
  {user_id: 1, finstagram_post_id: 1, text: "Mar 23 2024 comment again"},
  {user_id: 2, finstagram_post_id: 1, text: "Mar 23 2024 #2 comment"}
]

comments.each do |u|
  Comment.create(u)
  #test.save
end
=end


#rake db:seed
# from config.ru, from rakefile


# t.string :username
# t.string :avatar_url
# t.string :email
# t.string :password
# t.timestamps

# users


# comment = Comment.new({ user_id: 1, finstagram_post_id: 1, text: "this is awesome!" })
# comment.save


