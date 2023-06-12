#' function to calculate sentiment scores
#'
#' @param text vector
#'
#' @return scores
#' 
#' @import tidytext
#' @import caret
#' @import textdata
#' @import tidyverse
#' @import dplyr
#' 
#' @export

get_sentiment_score <- function(text) {
  
  lexicon <- tidytext::get_sentiments("afinn")
  
  tokens <- data.frame(text = text) %>%
    tidytext::unnest_tokens(word, text)
  
  scores <- tokens %>%
    inner_join(lexicon,
               by = "word") %>%
    group_by(word) %>%
    summarise(sentiment_score = sum(value))
  
  scores <- scores %>%
    mutate(iterated_score = iterated_difference(sentiment_score))
  
  
  return(scores)
}


#' Helper Function, gets the iterated total difference
#'
#' @param data
#'
#'
#' @return counts
#' 
#' @export

iterated_difference <- function(data) {
  
  counts <- c(data[1])
  
  for (i in 1:length(data)) {
    
    difference <- counts[i] + data[i+1]
    
    if (is.na(difference)) {
      
      difference <- paste("Total Difference:",
                          counts[i])
      
      counts[i] <- difference
      
      return(counts)
    }
    
    counts <- c(counts, difference)
  }
}




