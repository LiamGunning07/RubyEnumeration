# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
  # Your code Here
  found_candidate = candidates.find { |candidate| candidate[:id] == id }
  return found_candidate
  end
  
  def experienced?(candidate)
    # Your code Here
    return candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    needed_languages = ["Ruby", "Python"]
  qualified_candidates = candidates.select do |candidate|
    experienced?(candidate) &&
      candidate[:github_points] >= 100 &&
      (candidate[:languages] & needed_languages).any? &&
      (Date.today - candidate[:date_applied]).to_i <= 15 &&
      candidate[:age] > 17
  end
  return qualified_candidates
  end
  
  # More methods will go below

  # filters.rb

def ordered_by_qualifications(candidates)
  candidates.sort_by do |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end
