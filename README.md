![](https://img.shields.io/badge/Microverse-blueviolet)

#  Covid19-Updates-Info (Scraper)

This tool will help you to scrap covid19 updates information from [worldometers](https://www.worldometers.info/coronavirus/) and store them in a json file where you can be able to interact with them very easy. 


## Built With

- Ruby
- Nokogiri
- Rubocop


## Getting Started

- Clone this repo
- Navigate to project directory.
- run `bundle install` to install all gems, and then`chmod 755 ./covid` to provide execution permission to `covid` file.
- if the installation is complete and successful, just go ahead and follow the following instructions.
  - to scrap data and save updated data, use the following command 
    - Windows/Linux/MacOS: `./covid --update-informations`
  - to get information about specific country
    - Windows/Linux/MacOS: `./covid --info <country-name>` example: `./covid --info rwanda` 
    - this should return something look like this
    ```
    [
      {
        "#": "137",
        "Country,Other": "Rwanda",
        "TotalCases": "5,192",
        "NewCases": "",
        "TotalDeaths": "36 ",
        "NewDeaths": "",
        "TotalRecovered": "4,940",
        "NewRecovered": "",
        "ActiveCases": "216",
        "Serious,Critical": "",
        "Tot Cases/1M pop": "398",
        "Deaths/1M pop": "3",
        "TotalTests": "564,676",
        "Tests/\n1M pop\n": "43,232",
        "Population": "13,061,616 ",
        "Continent": "Africa",
        "1 Caseevery X ppl": "2,516",
        "1 Deathevery X ppl": "362,823",
        "1 Testevery X ppl": "23"
      }
    ]
    ``` 
  - to get all information about all countries
    - Windows/Linux/MacOS: `./covid --list`
  - to learn more about how to use the application
    - Windows/Linux/MacOS: `./covid --help`

## Authors

👤 **Rukundo Eric**

- GitHub: [@githubhandle](https://github.com/rukundoeric)
- Twitter: [@twitterhandle](https://twitter.com/rukundoeric005)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/rukundo-eric-000bba181/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/rukundoeric/covid19_updates_info_scraper/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- I would like to thank our code reviewer and anyone else who participated in making this done.

## 📝 License

This project is [MIT](https://github.com/rukundoeric/covid19_updates_info_scraper/blob/scraper/LICENSE) licensed.
