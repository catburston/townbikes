class Reservation < ActiveRecord::Base
  belongs_to  :bicycle
  belongs_to  :user
  has_one     :location, through: :user

  validates :bicycle_id, presence: true
  validates :user_id, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true

  validate :from_date_is_in_future
  validate :from_date_before_to_date
  validate :renter_is_not_owner

  validates :from_date, :to_date, :overlap => {:scope => "bicycle_id", :message_title => "Some validation title", :message_content => "Some validation message", :exclude_edges => ["from_date", "to_date"]}, :on => :create

  #custom ActiveRecord validations
  private

    def from_date_is_in_future
      if from_date == nil
        return
      elsif Date.today > from_date
        errors.add(:from_date, "should be in the future")
      end
    end

    def from_date_before_to_date
      if from_date == nil
        return
      elsif from_date > to_date
        errors.add(:to_date, "should be after its beginning")
      end
    end

    def renter_is_not_owner
      if current_user.id == user_id
        errors.add("the owner of a bicycle cannot rent the bicycle")
      end
    end

end
