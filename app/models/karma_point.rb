class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_create :update_user_karma

  def calculate_total_karma
    total_karma = 0

    self.karma_points.each do |karma|
      total_karma += karma.value
    end
    total_karma
  end

  def update_user_karma
    self.user.increment_total_karma!
  end
end
