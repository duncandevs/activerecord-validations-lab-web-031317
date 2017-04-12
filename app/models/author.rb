# All authors have a name
# No two authors have the same name
# Author phone numbers are exactly ten digits

class Author < ActiveRecord::Base
  validates :name , presence: true
  #validates uniqueness
  validates :name , uniqueness: true
  validates :phone_number, length: { is: 10 }
end
