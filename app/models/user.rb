class User < ActiveRecord::Base
  has_many :tickets

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Setting up default role for a newly registered user to the website
  # A Users role can be modified by an admin that has the correct permissions
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Including the devise_invitable gem to allow Admins with the correct permissions to invite other users
  include DeviseInvitable::Inviter

  # Sets the Users column is_active to true - Green - Good to go solder!
  def activate_account!
    update_attribute :is_active, true
  end

  # Sets the Users column is_active to false - Red - Halt, who goes there.
  def deactivate_account!
    time_since_sign_in = Time.now - self.last_sign_in_at
    inactive_days = Time.now - 60.days
    if last_signed_in_at.where(inactive_days > time_since_sign_in)
      update_attribute :is_active, false
    end
  end

  def is_associated?
    tickets.count > 0
  end
end
