#' College Scorecard data
#'
#' This data contains paired down data from the college scorecard:
#'  https://collegescorecard.ed.gov/data/
#'
#' @source https://collegescorecard.ed.gov/data/
#' @format A dataframe with 2019 rows and 17 columns:
#' \describe{
#'    \item{instnm}{Name of higher ed institution}
#'    \item{city}{Name of city where higher ed institution is located}
#'    \item{stabbr}{US state abbreviation}
#'    \item{preddeg}{The primary degree offered}
#'    \item{region}{US Region}
#'    \item{locale}{Locale}
#'    \item{adm_rate}{Institution admission rate, as a proportion}
#'    \item{actcmmid}{Median ACT composite score}
#'    \item{ugds}{Undergraduate enrollment}
#'    \item{costt4_a}{Average 4 year tution cost}
#'    \item{costt4_p}{Average tuition cost for private schools}
#'    \item{tuitionfee_in}{}
#'    \item{tuitionfee_out}{}
#'    \item{debt_mdn}{Median debt of all students}
#'    \item{grad_debt_mdn}{Median debt of students who graduated}
#'    \item{female}{Proportion of female}
#'    \item{bachelor_degree}{Whether primary degree is bachelor, 1 = bachelor, 0 = other}
#'    }
#' @examples
#'   colleges
"colleges"
