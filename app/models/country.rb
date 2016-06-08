class Country < ActiveRecord::Base
  validates_presence_of :name, :population, :language


  def name_language
    "#{name} has a primary language of #{language}"
  end

  def country_size
    pop_num = population.to_i
    if(pop_num >= 1000000)
      "Large"
    elsif (pop_num.to_i > 500000)
      "Medium"
    else
      "Small"
    end
  end
end
