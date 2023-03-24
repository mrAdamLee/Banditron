class Banditron
  attr_reader :arms, :epsilon, :counts, :vaues

  def initialize(arms, epsilon)
    @arms = arms 
    @epsilon = epsilon
    #tracking the number of times each arm was chosen
    @counts = Array.new(arms.size, 0)
    #giving a 'score' for each arm
    @values = Array.new(arms.size, 0.0)
  end

  def select_arm
    if rand() > epsilon
      #get the arm with the highest estimated value
      values.each_with_index.max[1]
    else 
      #pick a random arm from the the list of arms
      rand(arms.size) 
    end
  end

  def update(chosen_arm, reward)
    counts[chosen_arm] += 1
    
    times_arm_chosen = counts[chosen_arm]
    value = values[chosen_arm]
    #running average formula
    new_value = value + (1.0 / times_arm_chosen) * (reward - value)
    values[chosen_arm] = new_value
  end
end