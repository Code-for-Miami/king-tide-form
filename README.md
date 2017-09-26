# King Tide Form [![Code Climate](https://codeclimate.com/github/Code-for-Miami/king-tide-form/badges/gpa.svg)](https://codeclimate.com/github/Code-for-Miami/king-tide-form)
_Produced for Miami Open Data Day 2017_

![Screenshot of https://www.localwarmingkingtideform.us](https://user-images.githubusercontent.com/33945/30033858-d07fe87c-9152-11e7-96a9-175138f0148c.png)

> The data we are collecting is the first of its kind. But as you’ve seen, our citizen reports are collecting data using a rudimentary form. We’d like to see a better way for everyday citizens and data scientists to submit their own observations and reports. While keeping the integrity of this form (no fields should be removed), we’d like to see a mobile/desktop friendly solution that has UX considered for our volunteers.

Here is what the current site looks like: http://citizeneyes.org/flood/

Research on JotForm's mobile responsiveness and mapping/geolocation APIs to improve on flood submission form - and/or create new form and database

[Github Issue](https://github.com/Code-for-Miami/OpenDataDay2017/issues/2)

## Info

**Ruby on Rails** proof of concept based on the Prelang app generator

**Twitter Bootstrap**

*Try it out here!*  [https://www.localwarmingkingtideform.us](https://www.localwarmingkingtideform.us)


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
5. Navigate to cloned repos folder
6. Install Bundler
  `gem install bundler`
7. Run bundler
  `bundle install`
8. Install Figaro
  `bundle exec figaro install`
9. Add Keys see `config/example.application.yml`
10. Start server `rails s`


![Open Data Day Logo](cfm-odd-logo.png)
