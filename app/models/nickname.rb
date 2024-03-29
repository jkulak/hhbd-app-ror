class Nickname < ActiveRecord::Base
  belongs_to :artist
  attr_accessor :should_destroy
  
  def should_destroy?
    should_destroy.to_i == 1
  end
end
