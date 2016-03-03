class NutritionFacts::CLI
  def call
    start
  end

  def apple_menu
    puts '1. apple raw, medium'
    puts '2. apple cooked, large'
  end

  def start
    input = nil
    while input != 'exit'
      puts 'Enter the name of a food to see its nutrition facts:'
      input = gets.strip.downcase
      case input
      when 'apple'
        puts <<-DOC.gsub /^\s*/, ''
      Nutrition Facts for apple raw, medium

      Calories:
      Protein:
      Sugar:
      DOC
      when 'orange'
        puts <<-DOC.gsub /^\s*/, ''
      Nutrition Facts for orange, large

      Calories:
      Protein:
      Sugar:
      DOC
      else
        puts 'not sure what you mean, type in a food'
    end

  end
  end
end
