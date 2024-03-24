# db/seed.rb  #seed is a default name used by rake, reserved name
comments = [
  {user_id: 1, finstagram_post_id: 1, text: "Mar 23 2024 comment again"},
  {user_id: 2, finstagram_post_id: 1, text: "Mar 23 2024 #2 comment"}
]

comments.each do |u|
  Comment.create(u)
  #test.save
end


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