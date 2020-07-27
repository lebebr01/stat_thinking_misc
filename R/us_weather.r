#' United States Weather Data
#'
#' This data contains weather data from 8 weather stations across the northern
#'  tier of the United States for 2 winter seasons.
#'
#' @source National Centers for Environmental Information
#' @format A dataframe with 3,400 rows and 34 columns:
#' \describe{
#'    \item{station}{Station id}
#'    \item{date}{Date of weather observation}
#'    \item{dewpoint_avg}{Average dewpoint for the day, in Fahrenheit}
#'    \item{drybulbtemp_avg}{Average temperature for the day, in Fahrenheit}
#'    \item{relativehumidity_avg}{Average relative humidity for the day, in
#'    percent}
#'    \item{sealevelpressure_avg}{Average sea level pressure, in inches of mercury}
#'    \item{stationpressure_avg}{Average station pressure, in inches of mercury}
#'    \item{wetbulbtemp_avg}{Average wet bulb temperature, in Fahrenheit}
#'    \item{cooling_degree_days}{The number of degrees that a day's average
#'       temperature is above 65 degrees Fahrenheit}
#'    \item{departure_from_normal_temperature}{The difference in observed from
#'    normal temperature, in Fahrenheit}
#'    \item{heating_degree_days}{The number of degrees that a day's average
#'       temperature is below 65 degrees Fahrenheit}
#' \item{drybulbtemp_max}{The maximum observed dry bulb temperature, in
#'    Fahrenheit}
#'    \item{drybulbtemp_min}{The minimum observed dry bulb temperature, in
#'    Fahrenheit}
#'    \item{peak_wind_direction}{Wind direction when wind speed was the highest,
#'    in degrees. For example, 0 degrees means a north wind, 90 degrees an
#'    east wind, 180 degrees a south wind, and 270 degrees a west wind}
#'    \item{peak_wind_speed}{Highest observed wind speed, in miles per hour}
#'    \item{precipitation}{Total daily precipitation, measured in inches}
#'    \item{snow_depth}{Snow depth measured at the end of the day}
#'    \item{snowfall}{The amount of precipitation that fell as snow, in
#'    inches}
#'    \item{wind_direction}{Average wind direction of the day, in
#'    degrees (see peak_wind_direction for examples)}
#'    \item{weather_occurances}{Abbreviations for weather occurances for that day}
#'    \item{sunrise}{Time of sunrise}
#'    \item{sunset}{Time of sunset}
#'    \item{month}{Month of measurement}
#'    \item{year}{Year of measurement}
#'    \item{day}{Day of measurement}
#'    \item{winter_group}{Character vector of winter season}
#'    \item{location}{Character vector of location of weather observation}
#'    \item{fog}{A boolean object, 1 = fog observed during the day, 0 = no fog
#'    observed}
#'    \item{mist}{A boolean object, 1 = mist observed during the day, 0 = no mist
#'    observed}
#'    \item{drizzle}{A boolean object, 1 = drizzle observed during the day,
#'    0 = no drizzle observed}
#'   \item{rain}{A boolean object, 1 = rain observed during the day,
#'    0 = no rain observed}
#'    \item{snow}{A boolean object, 1 = snow observed during the day,
#'    0 = no snow observed}
#'    }
#' @examples
#'   us_weather
"us_weather"
