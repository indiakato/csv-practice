require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  athlete_data = CSV.read(filename, headers: true).map { |athlete| athlete.to_h }
  athlete_data.each do |athlete_hash|
    athlete_hash.select! { |category, value| REQUIRED_OLYMPIAN_FIELDS.include?(category)}
  end
  return athlete_data
end

#I've spent over an hour on this method and cannot get it to return anything besides nil
def total_medals_per_team(olympic_data)
  counts = olympic_data.group_by{ |x| x[:"Team"] }.map{ |x,y| [x,y.count] }
  counts = Hash[counts]
  return counts
end

def get_all_gold_medalists(olympic_data)

end
