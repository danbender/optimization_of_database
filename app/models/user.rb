class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}


  def self.by_karma
    self.order('karma_sum DESC')
  end

  def total_karma
    self.karma_sum
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def increment_total_karma!
    self.update_attribute :karma_sum, self.karma_sum+1
  end
end
