class Addfast < ApplicationRecord
  require "ostruct"

    belongs_to :account

    enum unit_conversion: {
        Metric: "Metric", 
        Imperial: "Imperial"
      }, _default: "Metric"


def heightselect
  (36..96).to_a.map { |inch| 
    { 
      id: inch.to_s, 
      name: (inch/12).floor.to_s+'\''+(inch%12).to_s+'"', 
    } 
  }.collect{ |p| 
    [p[:name], 
    p[:id].to_i]
  }
end
        
def height_in_cm
  height.to_i / 10
  
end

def height_in_cm=(height)
  self.height = height.to_f  * 10
end

def height_in_in
  @heighttoinch = (height.to_i / 12).floor.to_s + '\'' + (height.to_i % 12).to_s + '"'
end

def height_from_in_to_cm
  @heighttoinch = (height.to_i * 2.54).floor.to_s
end

def height_in_in=(height)
  self.height = height.to_f / 0.039370
end

end
