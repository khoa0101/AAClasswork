require "action_view"
require "date"

class Cat < ApplicationRecord

  COLOR = ["smoke", "white", "blue", "red tabby", "silver tabby"] #, 
    #"brown tabby", "red point", "silver shaded", "linx point", "other"]

  include ActionView::Helpers::DateHelper
  validates :color, inclusion: COLOR 

  validate :invalid_sex

  def age
    time_ago_in_words(birth_date)
    # current_cat = Cat.find_by(id)
    # current_date = Date.today
    # current_year = current_date.year 
    # current_month = current_date.month
    # current_day = current_date.day
    # birth_date = current_cat.birth_date
    # cat_year = birth_date.year
    # cat_month = birth_date.month
    # cat_day = birth_date.day

    # age = year - cat_year
    # if (month == cat_month && cat_day > day) || month < cat_month
    #     return age - 1
    # end

    # return age

  end

  def invalid_sex
    if Cat.sex != "M" || Cat.sex != "F"
      errors[:sex] << 'is not valid.'
    end
  end

end
