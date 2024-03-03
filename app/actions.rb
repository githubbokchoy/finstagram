=begin

get '/' do
  "Hello world!"
end
=end


=begin
  get '/' do
    File.read(File.join('app/views', 'index.html'))
  end

=end

=begin

get '/' do
  username = "sharky_j"
  avatar_url = "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg"
  photo_url = "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg"
  time_ago_in_minutes = 15
  like_count = 0
  comment_count = 1
  comments = [
    "sharky_j: Out for the long weekend... too embarrassed to show y'all the beach bod!"
  ]
  #return test  = 2
  test = "hello"  #returns  implicitly the last string (not number, see below on http codes)
  return 403  # returns http response code (sinatra, otherwise, ruby would interpret as just a number 403)
end  

=end



=begin

get '/' do
  username = "sharky_j"
  avatar_url = "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg"
  photo_url = "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg"
  time_ago_in_minutes = 15
  like_count = 0
  comment_count = 1
  comments = [
    "sharky_j: Out for the long weekend... too embarrassed to show y'all the beach bod!"
  ]


  finstagram_post = {
    username: "sharky_j",
    avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg",
    photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg",
    time_ago_in_minutes: 15,
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  # if the time_ago_in_minutes is greater than 60
  if time_ago_in_minutes > 60
    "more than an hour ago"
  elsif time_ago_in_minutes == 60
    "an hour ago"
  elsif time_ago_in_minutes <= 1
    "just a moment ago"
  else
    "less than an hour ago"
  end
#only evaluates the last block implicitly
  if time_ago_in_minutes >= 60
    "#{time_ago_in_minutes / 60} hours ago"
  else
    "#{time_ago_in_minutes} minutes ago hihi"
  end


  humanized_time_ago(time_ago_in_minutes)
  humanized_time_ago(finstagram_post[:time_ago_in_minutes])
end

=end

=begin
get '/' do
  finstagram_post = {
    username: "sharky_j",
    avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg",
    photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg",
    humanized_time_ago: humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  finstagram_post.to_s
end

=end

def humanized_time_ago(minute_num)
  if minute_num >= 60
    "#{minute_num / 60} hours ago"
  else
    "#{minute_num} minutes ago"
  end
end

get '/' do
  finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg",
    photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg",
    humanized_time_ago: humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "https://live.staticflickr.com/65535/52358421348_f34c7996b1.jpg",
    photo_url: "https://live.staticflickr.com/65535/52357237337_1cc718f6a7_4k.jpg",
    humanized_time_ago: humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "https://live.staticflickr.com/65535/52358415933_0a0e6bc35f_3k.jpg",
    photo_url: "https://live.staticflickr.com/65535/52358494794_f88b160d15_4k.jpg",
    humanized_time_ago: humanized_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
  }

#to_s converts argument to string
  #[finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin].to_s
  finstagram_post_shark[:comments][0][:text]

end