# THIS REPO IS NOW DEPRECATED

Refer to https://github.com/Code-For-Miami/queen-tide instead.

# Will It Flood App & King Tide Form Combined ReadMes
_These projects were combined. Top part is for Will It Flood, scroll down for King Tide Form_

# Will It Flood Application ReadMe

## What

This application lets residents of the state of Florida enter their address and view a calendar of dates for the highest high tides, known as the King Tides, in their area. Users may adjust the height of what they wish to identify as King Tides from 2.5 feet to 5.0 feet. The default is 2.5 feet.

## Status

We deployed this in fall 2017. We are working on updates to display 2018 data.

## Why

Miami is the US metropolitan area most at risk for sea level rise. This project is designed to help citizens anticipate when the tides are at their highest (called the "King Tides"), and document flooding during the highest high tides.

## Who

This project is a collaboration of Florida International University's College of Communication, Architecture and the Arts and Code for Miami. Dr. Susan Jacobson, a professor in FIU's School of Communication & Journalism and a long-time member of Code for Miami, is the lead, but many members of Code for Miami have significantly contributed to this project, including:

Pablo Barria
Chris Scott
Meiza Fleitas
Bryce Kerley
Julie Kramer
Yamileth Medina
Ernie Hsuing

## MILESTONES

Below are some of the events where we are planning on deploying these applications.

Monday, Sept. 18 Training of community organizers to document King Tides, including water quality measurements, with Community Health Maps in Shorecrest, location TBD.

Tuesday, Sept. 19 – Community organizers go out to document flooding in Shorecrest. High tides is 9:25am - 2.94ft. They need video documentation of the water quality measurement and of the event.

Wednesday, Sept. 20 - Community organizers go out to document flooding in Shorecrest. High tides 10:11am - 2.97ft. They need video documentation of the water quality measurement and of the event.

Saturday, Oct. 7 - Community organizers, who have trained citizens, lead citizens to document flooding in Shorecrest. High tides 10:11am - 2.97ft. They need video documentation of the water quality measurement. They need video documentation of the water quality measurement and of the event.

Saturday, November 4 - Sea Level Solutions Day Extravaganza! The tides will be high.

## How

Dependencies

This application draws upon data from annual tide predictions posted by NOAA: https://tidesandcurrents.noaa.gov/tide_predictions.html?gid=1397#listing. As of July 2017, we have data that goes through the end of the year. Links to other How To's will help.

Install

This section needs to be updated to reflect the Ruby on Rails implementation.

Deploy

To deploy the Will It Flood? application, you must get an API Key from Google Maps: https://developers.google.com/maps/documentation/javascript/get-api-key

If you live in a state other than Florida, you may swap out the files in the tides folder to reflect the tide stations in your state (https://tidesandcurrents.noaa.gov/tide_predictions.html?gid=1397#listing) and swap out the latitude and longitude in stations.json to the latitude and longitude of your state's tide stations.

Contribute

A short explanation of how others can contribute. Be sure to show how to submit issues and pull requests. Include a CONTRIBUTING.md file. Here is a good CfA example. GitHub also has some new guides on how to contribute.

## License

A link to the Code for America copyright and LICENSE.md file.

# King Tide Form [![Code Climate](https://codeclimate.com/github/Code-for-Miami/king-tide-form/badges/gpa.svg)](https://codeclimate.com/github/Code-for-Miami/king-tide-form)
_Produced for Miami Open Data Day 2017_

![Screenshot of https://www.floodform.com/](https://user-images.githubusercontent.com/33945/30033858-d07fe87c-9152-11e7-96a9-175138f0148c.png)

> The data we are collecting is the first of its kind. But as you’ve seen, our citizen reports are collecting data using a rudimentary form. We’d like to see a better way for everyday citizens and data scientists to submit their own observations and reports. While keeping the integrity of this form (no fields should be removed), we’d like to see a mobile/desktop friendly solution that has UX considered for our volunteers.

Here is what the current site looks like: https://www.floodform.com/

Research on JotForm's mobile responsiveness and mapping/geolocation APIs to improve on flood submission form - and/or create new form and database

[Github Issue](https://github.com/Code-for-Miami/OpenDataDay2017/issues/2)

## Info

**Ruby on Rails**


## Team Members

- [Yami Medina](https://www.github.com/yamilethmedina)
- [Julie Kramer](https://www.github.com/thejuliekramer)
- [Diego Salazar](https://www.github.com/diegosalazar)

## Develop

#### OSX

1. Clone Repo
2. Install [Brew](https://brew.sh/)
3. Install [RVM](https://rvm.io/)
4. Use RVM to install ruby `2.2.4`
  `rvm install 2.2.4`
5. Install [Postgress App](https://postgresapp.com/)
6. Navigate to cloned repos folder
7. Install Bundler
  `gem install bundler`
8. Run bundler
  `bundle install`
9. Install Figaro
  `bundle exec figaro install`
10. Add Keys see `config/example.application.yml`
11. Start server `rails s`


![Open Data Day Logo](cfm-odd-logo.png)
