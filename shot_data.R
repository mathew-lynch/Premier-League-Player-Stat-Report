# Shot data for each player, sourced from Understat. Code sourced from https://github.com/ewenme/understatr

shot_data <- function(player_name, data) {
  # Get player ID
  id = data$id[data$player_name == player_name]
  
  # Construct player url
  player_url <- str_glue("https://understat.com/player/{id}")
  
  # Read player page
  player_page <- session(player_url)
  
  get_script <- function(x) {
    as.character(html_nodes(x, "script"))
  }
  
  # subset data element of html page
  get_data_element <- function(x, element_name) {
    stri_unescape_unicode(str_subset(x, element_name))
  }
  
  # Locate script tags
  player_data <- get_script(player_page)
  
  # isolate player data
  player_data <- get_data_element(player_data, "shotsData")
  
  fix_json <- function(x) {
    str_subset(
      unlist(
        rm_square(
          x, extract = TRUE, include.markers = TRUE
        )
      ),
      "\\[\\]", negate = TRUE
    )
  }
  
  # pick out JSON string
  player_data <- fix_json(player_data)
  
  # parse JSON
  player_data <- fromJSON(player_data)
  
  # add reference fields
  player_data$player_id <- id
  names(player_data)[names(player_data) == 'season'] <- 'year'
  
  # fix col classes
  player_data <- type_convert(player_data)
  
  # convert to tibble
  player_data <- as_tibble(player_data)
  
  # add opponent information
  opponent <- rep(NA, nrow(player_data))
  
  for (i in 1:length(opponent)) {
    if (player_data$h_a[i] == "h") {
      opponent[i] = player_data$a_team[i]
    } else {
      opponent[i] = player_data$h_team[i]
    }
  }
  
  player_data$Opponent = opponent
  
  return(as_tibble(player_data))
  
} 