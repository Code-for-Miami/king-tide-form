# New Layout branch for Will it Flood

This branch is dedicated to fixing the layout as per issue: https://github.com/Code-for-Miami/king-tide/issues/12

Right now, the calendar generation has been refactored so that each month complies to the following structure:

```html
<div class="calendar-month">
    <h2 class="month-name">January</h2>
    <div class="month-header">
        <span class="week-day">Mon</span>
        <span class="week-day">Tue</span>
        <span class="week-day">Wed</span>
        <span class="week-day">Thu</span>
        <span class="week-day">Fri</span>
        <span class="week-day">Sat</span>
        <span class="week-day">Sun</span>
    </div>
    <div class="month-week">
        <span class="month-day one-tide" data-label="10:06 AM 2.67ft &amp; 10:16 PM 2.46ft">1</span>
        <span class="month-day one-tide" data-label="10:47 AM 2.61ft &amp; 11:04 PM 2.43ft">2</span>
        <span class="month-day one-tide" data-label="11:32 AM 2.55ft &amp; 11:57 PM 2.4ft">3</span>
        <span class="month-day no-tides" data-label="12:22 PM 2.49ft">4</span>
        <span class="month-day no-tides" data-label="12:57 AM 2.39ft &amp; 01:18 PM 2.45ft">5</span>
        <span class="month-day no-tides" data-label="02:02 AM 2.42ft &amp; 02:19 PM 2.44ft">6</span>
        <span class="month-day no-tides" data-label="03:09 AM 2.49ft &amp; 03:22 PM 2.48ft">7</span>
    </div>
    <div class="month-week">
        <span class="month-day two-tides" data-label="04:14 AM 2.61ft &amp; 04:24 PM 2.56ft">8</span>
        <span class="month-day two-tides" data-label="05:15 AM 2.75ft &amp; 05:24 PM 2.66ft">9</span>
        <span class="month-day two-tides" data-label="06:12 AM 2.89ft &amp; 06:21 PM 2.75ft">10</span>
        <span class="month-day two-tides" data-label="07:05 AM 2.99ft &amp; 07:15 PM 2.82ft">11</span>
        <span class="month-day highest-in-month two-tides" data-label="07:56 AM 3.04ft &amp; 08:07 PM 2.83ft">12</span>
        <span class="month-day two-tides" data-label="08:45 AM 3.02ft &amp; 08:57 PM 2.8ft">13</span>
        <span class="month-day two-tides" data-label="09:32 AM 2.95ft &amp; 09:47 PM 2.71ft">14</span>
    </div>
    <div class="month-week">
        <span class="month-day two-tides" data-label="10:18 AM 2.82ft &amp; 10:37 PM 2.58ft">15</span>
        <span class="month-day one-tide" data-label="11:04 AM 2.66ft &amp; 11:27 PM 2.42ft">16</span>
        <span class="month-day no-tides" data-label="11:50 AM 2.48ft">17</span>
        <span class="month-day no-tides" data-label="12:19 AM 2.27ft &amp; 12:38 PM 2.3ft">18</span>
        <span class="month-day no-tides" data-label="01:13 AM 2.14ft &amp; 01:27 PM 2.15ft">19</span>
        <span class="month-day no-tides" data-label="02:11 AM 2.06ft &amp; 02:19 PM 2.04ft">20</span>
        <span class="month-day no-tides" data-label="03:09 AM 2.03ft &amp; 03:13 PM 1.98ft">21</span>
    </div>
    <div class="month-week">
        <span class="month-day no-tides" data-label="04:05 AM 2.06ft &amp; 04:06 PM 1.98ft">22</span>
        <span class="month-day no-tides" data-label="04:57 AM 2.13ft &amp; 04:56 PM 2.02ft">23</span>
        <span class="month-day no-tides" data-label="05:44 AM 2.23ft &amp; 05:43 PM 2.09ft">24</span>
        <span class="month-day no-tides" data-label="06:28 AM 2.34ft &amp; 06:27 PM 2.18ft">25</span>
        <span class="month-day no-tides" data-label="07:08 AM 2.44ft &amp; 07:10 PM 2.28ft">26</span>
        <span class="month-day one-tide" data-label="07:47 AM 2.52ft &amp; 07:51 PM 2.37ft">27</span>
        <span class="month-day one-tide" data-label="08:25 AM 2.58ft &amp; 08:32 PM 2.44ft">28</span>
    </div>
    <div class="month-week">
        <span class="month-day one-tide" data-label="09:03 AM 2.6ft &amp; 09:15 PM 2.48ft">29</span>
        <span class="month-day two-tides" data-label="09:43 AM 2.59ft &amp; 09:59 PM 2.5ft">30</span>
        <span class="month-day one-tide" data-label="10:24 AM 2.56ft &amp; 10:47 PM 2.48ft">31</span>
        <span class="month-day non-month">1</span>
        <span class="month-day non-month">2</span>
        <span class="month-day non-month">3</span>
        <span class="month-day non-month">4</span>
    </div>
</div>
```



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
