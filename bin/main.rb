require_relative '../lib/covid_info.rb'

covid_info = Covidinfo.new

case ARGV[0]
when '--info'
  if ARGV[1].nil?
    puts 'Wrong/Missing Options!'
    puts "Please type 'covid --help' To see how to use this app."
  else
    puts covid_info.get_country_information(ARGV[1])
  end
when '--list'
  if ARGV[1].nil?
    puts covid_info.get_list_with_information
  elsif ARGV[1].to_i.class != Integer
    puts 'Wrong Options!'
    puts "Please type 'covid --help' To see how to use this app."
  else
    puts covid_info.get_list_with_information(ARGV[1].to_i)
  end
when '--update-informations'
  puts 'Scrapping in progress, Please wait...'
  responce = covid_info.update_information
  puts responce unless responce['status']
  puts responce['responce_message'] if responce['status']
when '--help'
  puts '**************************************************************************************************'
  puts '*                                                                                                *'
  puts "*\tcovid --update-informations                                                         *"
  puts "*\tcovid --info <country-name> or <continent-name>: View information for Specific Country   *"
  puts "*\tcovid --list <number>: List top <number> contries whith many cases                       *"
  puts '*                                                                                                *'
  puts '**************************************************************************************************'
else
  puts 'Invalid Option!!'
  puts "Please type 'covid --help' To see how to use this app."
end
