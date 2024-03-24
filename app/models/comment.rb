#require 'active_record'
# require ::File.expand_path('../config/environment', __FILE__)
# require (C:/Users/vvggy/work/finstagram/app/models/config/environment)
#require '../../config/environment'
require ::File.expand_path('../../../config/environment',  __FILE__)

class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :finstagram_post

    validates :user_id, :finstagram_post_id, presence: true  #new line added to validate comment :text
end


#Comment.create(user_id: 3, finstagram_post_id: 5).valid? # => true
p d = Comment.new(user_id: 3, finstagram_post_id: 5).valid?# => true
#d.valid?

# p new_comment.valid?
#p Comment.new(finstagram_post_id: 10).valid? # => true
#p new_comment2.valid?
p "that's it"  #why is this printing twice?

#ruby ./app/models/comment.rb