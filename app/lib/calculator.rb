class Body < ApplicationRecord
  # your other codes 
  def bmr
   ((13.397 * self.weight) + 
     (479.9 * self.height) - 
     (5.677 * self.age) + 88.362) * 
     (1 - (self.fat / 100.00))
  end
 end