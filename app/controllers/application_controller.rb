class ApplicationController < ActionController::Base       
    helper_method :currentTimeAndDate, :calorieBurnPerMinute
    def currentTimeAndDate
        @todaysDate = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
      end
end
