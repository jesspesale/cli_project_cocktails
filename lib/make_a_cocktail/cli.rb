class MakeACocktail::CLI

    def start
        puts "Welcome, let's make a drink!" 
        puts "Here is the list of drinks to choose from:"
        #scrape all the cocktails - call the scraper class
        # list all the cocktails
        # MakeACocktail::Scraper
        #list_drinks
         MakeACocktail::Scraper.scrape_drinks
    end

    def list_drinks

    end




end