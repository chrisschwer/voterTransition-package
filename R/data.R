#' Vote counts of the 2011 state election in Baden-Württemberg
#' 
#' A dataset containing the vote counts of the 2011 state election in Baden-Württemberg by district
#' 
#' @format a matrix with 70 rows and 8 columns
#' \describe{
#' \item{CDU_2011}{Vote counts for CDU}
#' \item{GRUENE_2011}{Vote counts for Die Grünen}
#' \item{SPD_2011}{Vote counts for SPD}
#' \item{FDP_2011}{Vote counts for FDP}
#' \item{LINKE_2011}{Vote counts for Die Linke}
#' \item{ANDERE_2011}{Sum of vote counts for all other parties}
#' \item{NW_2011}{number of people eligible to vote who have not cast a valid ballot}
#' \item{SALDO_2011_2016}{increase of number of eligible voters from 2011 to 2016}
#' }
#' @source \url{http://www.statistik-bw.de/Service/Veroeff/Statistische_Analysen/803316001.pdf}
"LTW_2011"

#' Vote counts of the 2016 state election in Baden-Württemberg
#' 
#' A dataset containing the vote counts of the 2016 state election in Baden-Württemberg by district
#' 
#' @format a matrix with 70 rows and 8 columns:
#' \describe{
#' \item{CDU_2016}{Vote counts for CDU}
#' \item{GRUENE_2016}{Vote counts for Die Grünen}
#' \item{SPD_2016}{Vote counts for SPD}
#' \item{FDP_2016}{Vote counts for FDP}
#' \item{LINKE_2016}{Vote counts for Die Linke}
#' \item{AFD_2016}{Vote counts for AfD}
#' \item{ANDERE_2016}{Sum of vote counts for all other parties}
#' \item{NW_2016}{number of people eligible to vote who have not cast a valid ballot}
#' }
#' @source \url{http://www.statistik-bw.de/Service/Veroeff/Statistische_Analysen/803316001.pdf}
"LTW_2016"

#' Naive initial transition matrix
#' 
#' A transition matrix assuming that voters in 2016 choose the same party as in 2011
#' 
#' @format a matrix with 8 rows and 8 columns
"Transition"

