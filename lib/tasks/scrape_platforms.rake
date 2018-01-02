require 'open-uri'

namespace :scrape do
  desc 'Scrape gaming platforms from thegamesdb.net'
  task platforms: :environment do
    Rails.logger.info("Stating scrapping of platforms")
    
    content = open(URI.parse('http://thegamesdb.net/api/GetPlatformsList.php')).read

    plats = Hash.from_xml(content)

    plats['Data']['Platforms']['Platform'].each do |plat|
      Platform.create(name: plat['name'], thegamesdb_id: plat['id']) if Platform.find_by_name(plat['name']).nil?
    end

    Rails.logger.info("Scrapping of platforms endend")
  end
end
