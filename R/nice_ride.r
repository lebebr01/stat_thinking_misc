#' Nice Ride data
#'
#' This data contains paired down data from the monthly data downloads from the
#'  Nice Ride rideshare program found in the Minneapolis metro area:
#'  https://collegescorecard.ed.gov/data/
#'
#' @source https://collegescorecard.ed.gov/data/
#' @format A dataframe with 21,000 rows and 17 columns:
#' \describe{
#'    \item{tripduration}{Length of bike rental, in seconds}
#'    \item{start_station}{Station ID where rental started, NULL for dockless
#'     bicycle rentals}
#'    \item{start_station_name}{Station name where rental startedULL for
#'    dockless bicycle rentals}
#'    \item{end_station}{Station ID where rental ended, NULL for dockless
#'     bicycle rentals}
#'    \item{end_station_name}{Station name where rental ended, NULL for dockless
#'     bicycle rentals}
#'    \item{bikeid}{Bicycle ID}
#'    \item{usertype}{Character variable representing whether user is a
#'    customer or a subscriber}
#'    \item{birth_year}{Year of birth for rentee}
#'    \item{sex}{Sex of rentee, 0 = ..., 1 = ..., 2 = ...}
#'    \item{bike_type}{Classic bike rental from station or dockless bike rental}
#'    \item{month}{Month of rental represented as number, 4 = April, 5 = May,
#'    6 = June, 7 = July, 8 = August, 9 = September, 10 = October}
#'    \item{year}{Year of bike rental, all in 2019}
#'    \item{day}{Day of bike rental}
#'    \item{hour}{Hour the bike was rented}
#'    \item{minute}{Minute that bike was rented}
#'    \item{morning}{When the bike was rented, Afternoon (Between noon up to 11 pm),
#'    Morning (Betweeen 5 am and up to noon), or Night (After 11 pm to 4 am)}
#'    \item{tripduration_minutes}{Length of bike rental, in minutes}
#'    }
#' @examples
#'   nice_ride
"nice_ride"
