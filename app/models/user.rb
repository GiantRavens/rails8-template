class User < ApplicationRecord
  before_create :set_uuid7
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
         
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, presence: true, on: :update
  
  # Associations
  has_many :posts, dependent: :nullify
  
  def full_name
    if preferred_name.present?
      [preferred_name, last_name].compact.join(' ')
    elsif first_name.present? || last_name.present?
      [first_name, last_name].compact.join(' ')
    else
      email.split('@').first
    end
  end
  
  private
  
  def set_uuid7
    self.id = Random.uuid_v7 if id.nil?
  end
end
