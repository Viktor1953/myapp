class User < ApplicationRecord

  has_many :messages, dependent: :destroy
  
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }


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
