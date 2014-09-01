class Message < ActiveRecord::Base

  belongs_to :sender, foreign_key: 'from_user_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'to_user_id', class_name: 'User'

  validates       :text_content, presence: true
  validates       :from_user_id, presence: true
  validates       :to_user_id, presence: true
  validates       :bicycle_id, presence: true

end