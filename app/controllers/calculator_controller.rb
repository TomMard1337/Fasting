class CalculatorController < ApplicationController
    def bmr
        @addfasts = Addfast.all
      end

end