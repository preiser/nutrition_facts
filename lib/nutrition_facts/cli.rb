class NutritionFacts::CLI
  def call
    start
  end

  def start
    input = nil
    while input != 'exit'
      puts 'Enter the name of a food to see its nutrition facts:'
      input = gets.strip.downcase
      case input
      when 'apple'
        NutritionFacts::Item.item_facts
      when 'list'
        NutritionFacts::Item.list_items
      else
        puts 'not sure what you mean, type in a food' unless input == 'exit'
    end

  end
  end
end
