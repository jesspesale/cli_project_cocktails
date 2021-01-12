class MakeACocktail::Scraper

    def self.scrape_drinks
        url = "https://www.liquor.com/classic-cocktails-4779424"

        website = Nokogiri::HTML(open(url))
        binding.pry


    end

    def scrape_recipe

    end


end