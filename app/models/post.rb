# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title == nil
      record.errors[:title] << false
    else
      unless record.title.include?("Won't Believe")|| record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
        record.errors[:title] << false
      end
    end#end if
  end#end method
end#end class
 # || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title , presence: true
  validates :content , presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with TitleValidator
end
# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.name.starts_with? 'X'
#       record.errors[:name] << 'Need a name starting with X please!'
#     end
#   end
# end
#
# class Person
#   include ActiveModel::Validations
#   validates_with MyValidator
# end

# Finally, add a custom validator to Post that ensures the title is sufficiently
# clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
# [number]", or "Guess", the validator should return false.
