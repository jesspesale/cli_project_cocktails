class MakeACocktail::CLI

    def start
        puts "\nWelcome, let's make a drink!" 
        puts "\nHere is the list of drinks to choose from:"
        get_drinks
        # list_drinks
        get_users_drink
        #  MakeACocktail::Scraper.scrape_drinks
        # binding.pry
    end

    def get_drinks
        # @drinks = [ "LIT", "Baybreeze", "Vodka Soda"]
        # @drinks = MakeACocktail::Scraper.scrape_drinks
        
        MakeACocktail::Drink.new("LIT")
        MakeACocktail::Drink.new("Margarita")
        @drinks = MakeACocktail::Drink.all
        # binding.pry
        puts "\nPlease enter the number of the drink you would like to make."
    end

    def list_drinks
        puts "\nHere is the list of drinks to choose from:"
        @drinks.each_with_index do |drink, index| 
        puts "#{index + 1}. #{drink.name}" 
        end
    end

    def get_users_drink
        list_drinks
        @chosen_drink = gets.strip.to_i
        if valid_input(@chosen_drink)
            show_drink_info_for(@chosen_drink) 
        else
            puts "\nSorry please pick a number corresponding to the drinks."
            list_drinks
            get_users_drink
        end
    end
    
    def valid_input(input)
        input <= @drinks.length && input > 0
    end
    
    def show_drink_info_for(chosen_drink)
        drink = @drinks[@chosen_drink - 1]
        puts "\nHere is how to make a #{@chosen_drink}"
        # binding.pry
        # display cocktail info
        # MakeACocktail::Drink.info
        another_drink
    end

    def another_drink
        puts "\nWould you like to make another drink? Enter y or n"
        input = gets.strip
        if input == "y"
            puts "\nOkay, here is the list of drinks to choose from?"
            get_drinks
            get_users_drink
        elsif input == "n"
            puts "\nHave a good day!"
        else
            puts "\nPlease try again."
            another_drink
        end

    end


end