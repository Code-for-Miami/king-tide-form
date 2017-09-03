"use strict";
function loadArray(xml) {
  var today = new Date();
  var todayMonthNum = today.getMonth();
  var xmlDocument = xml.responseXML;
  var stationname = xmlDocument.querySelector("stationname").textContent;
  var tides = xmlDocument.querySelectorAll("item");
  var months = [[], [], [], [], [], [], [], [], [], [], [], []];
  var tideDate,
    tideDay,
    tideMonth,
    tideTime,
    highTide,
    month,
    predInFt,
    previousDay,
    currentDay;

  for (var i = 0; i < tides.length; i = i + 1) {
    tideDate = new Date(tides[i].querySelector("date").textContent);
    tideMonth = tideDate.getMonth();
    highTide = tides[i].querySelector("highlow").textContent === "H";

    if (tideMonth >= todayMonthNum && highTide) {
      // If the month is equal or higher than the current month and the value is a high tide.
      tideDay = tideDate.getDate();
      tideTime = tides[i].querySelector("time").textContent;
      predInFt = tides[i].querySelector("pred_in_ft").textContent;
      month = months[tideMonth];

      if (previousDay === tideDay) {
        currentDay.secondTide = {
          time: tideTime,
          level: Number(predInFt)
        };
      } else {
        currentDay = {
          day: tideDay,
          firstTide: {
            time: tideTime,
            level: Number(predInFt)
          }
        };
        month.push(currentDay);
        previousDay = tideDay;
      }
    }
  }
  document.getElementById("station").innerHTML = stationname;
  renderMonthData(months);
}

function renderMonthData(months) {
  var monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  months.forEach(function(monthData, i) {
    if (monthData.length > 0) {
      var allTides = monthData.reduce(function(accumulator, currentTide) {
        accumulator.push(currentTide.firstTide.level);
        if (currentTide.secondTide) {
          accumulator.push(currentTide.secondTide.level);
        }
        return accumulator;
      }, []);

      var highestTide = Math.max.apply(this, allTides);
      var longName = monthNames[i];
      var shortName = longName.toLowerCase().substr(0, 3);
      document.getElementById(shortName).style.display = "block";
      drawMonth(monthData, longName + " 2017", shortName, highestTide);
    }
  });
}

function drawMonth(monthData, monthtext, monthy, highest) {
  var monthElement = document.getElementById(monthy);
  var level = window.king;

  monthElement.innerHTML = "";
  monthElement.insertAdjacentHTML("beforeEnd", "<h2>" + monthtext + "</h2>");

  var className, titleText, higherThanFirst, higherThanSecond;
  monthData.forEach(function(dayData) {
    higherThanFirst = dayData.firstTide.level > level;
    if (dayData.secondTide) {
      higherThanSecond = dayData.secondTide.level > level;
    } else {
      higherThanSecond = false;
    }

    var higherTide = dayData.secondTide
      ? Math.max(dayData.firstTide.level, dayData.secondTide.level)
      : dayData.firstTide.level;

    if (higherThanFirst && higherThanSecond) {
      className = "tide2";
    } else if (higherThanFirst || higherThanSecond) {
      className = "tide1";
    } else {
      className = "plain";
    }

    if(higherTide === highest) {
      className = "highest";
    }

    titleText = dayData.firstTide.time + " " + dayData.firstTide.level + "ft";
    if (dayData.secondTide) {
      titleText =
        titleText +
        " &" +
        dayData.secondTide.time +
        " " +
        dayData.secondTide.level +
        "ft";
    }

    var wrapper = document.createElement("div");
    wrapper.classList.add(className);
    var masterTooltip = document.createElement("a");
    masterTooltip.setAttribute("title", titleText);
    masterTooltip.classList.add("masterTooltip");
    masterTooltip.innerHTML = "<h3>" + dayData.day + "</h3>";

    masterTooltip.addEventListener("mouseenter", function(event) {
      var title = event.target.getAttribute("title");
      var tooltip = document.querySelector("#tooltip");
      var mousex = event.pageX + 20; //Get X coordinates
      var mousey = event.pageY + 10; //Get Y coordinates
      tooltip.textContent = title;
      tooltip.style.top = mousey + "px";
      tooltip.style.left = mousex + "px";
      tooltip.classList.remove("hidden");
    });

    masterTooltip.addEventListener("mouseleave", function() {
      tooltip.classList.add("hidden");
    });
    wrapper.appendChild(masterTooltip);
    monthElement.appendChild(wrapper);
  });
}
