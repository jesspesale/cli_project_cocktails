class MakeACocktail::CLI

    def start
        puts "\nWelcome, let's make a drink!".cyan
        get_drinks
        list_drinks
        get_users_drink
    end

    def get_drinks
        @drinks = MakeACocktail::Drink.all
    end
    
    def list_drinks
        puts "\nHere is the list of drinks to choose from:".cyan
        # @drinks.sort_by! {|a| a.name }       
        
        @drinks.sort_by {|a| a.name }.each_with_index do |drink, index|     #sorts the drinks alphabetically
            puts "#{index + 1}. #{drink.name}".blue
        end
        puts "\nScroll up to view the list of drinks".cyan
        puts "\nPlease enter the number associated with the drink you would like to see the ingredients for.".cyan
    end
    
    def get_users_drink
        @chosen_drink = gets.strip.to_i
        if valid_input(@chosen_drink)
            get_drink_info(@chosen_drink)
            show_drink_info_for(@drink_url) 
            another_drink
        else
            wrong_input
            get_users_drink
        end
    end
    
    def get_drink_info(drink_number)
        @drink = @drinks[drink_number - 1]
        # @drink_url = @drinks[drink_number - 1].url
        # @drink_name = @drinks[drink_number - 1].name 
    end

    def show_drink_info_for(drink_url)
        @ingredients = MakeACocktail::Scraper.scrape_ingredients(@drink.url)
        if @ingredients.empty?
            puts "\nI'm sorry there was an issue getting those ingredients, please pick another number.".red
            get_users_drink
        else
            puts "\nHere are the ingredients for a #{@drink.name}:".cyan
            @ingredients.each do |x|
            if x.include? "Garnish:"
                puts "Garnish with a#{x.gsub("Garnish:", "")}".green
            else
                puts "#{x}".green 
            end
        end
     end
    end

    def wrong_input
        puts "\nSorry please pick a number corresponding to the drinks or press 0 to view the list of drinks again.".red
        input = gets.strip.to_i
        if input == 0 
            list_drinks
            get_users_drink
        elsif valid_input(input)
            # binding.pry
            get_drink_info(input)
            show_drink_info_for(input)
            another_drink
        else
            wrong_input
        end
    end
    
    def valid_input(input)
        input <= @drinks.length && input > 0 
    end

    def another_drink
        puts "\nWould you like to make another drink? Enter y or n".cyan
        input = gets.strip
        if input == "y"
            puts "\nOkay, here is the list of drinks to choose from".cyan
            list_drinks
            get_users_drink
        elsif input == "n"          
            exit
        else
            puts "\nPlease try again.".red
            another_drink
        end
    end

    def exit
        abort "\nEnjoy your drink!".blue
    end

end