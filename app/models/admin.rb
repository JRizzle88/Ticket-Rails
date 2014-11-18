class Admin < ActiveRecord::Base

  def self.policy_class
      AdminPolicy
  end

end
