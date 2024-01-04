class User < ApplicationRecord
  
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :moderator, :admin]
    after_initialize :set_default_role, :if => :new_record?
       
  def set_default_role
    self.role ||= :user
  end

end
