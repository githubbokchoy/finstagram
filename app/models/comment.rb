#require 'active_record'
# require ::File.expand_path('../config/environment', __FILE__)
# require (C:/Users/vvggy/work/finstagram/app/models/config/environment)
#require '../../config/environment'

#require ::File.expand_path('../../../config/environment',  __FILE__)

class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :finstagram_post

    #validates :user_id, :finstagram_post_id, presence: true  #new line added to validate comment :text
    validates_presence_of :text, :user, :finstagram_post
end

#p Comment.new(user_id: 3, finstagram_post_id: 5).valid?# => true,  .create
#p "this sentence is printed twice"

#ruby ./app/models/comment.rb