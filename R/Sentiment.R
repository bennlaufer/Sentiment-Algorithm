#' Sentiment function
#'
#' @return dataframe
#'
#' @export


sentiment <- function(){
  
  
  text <- getText()
  
  sentiment_scores <- get_sentiment_score(text)
  
  sentiment_labels <- ifelse(sentiment_scores$sentiment_score > 0, "Positive",
                             ifelse(sentiment_scores$sentiment_score < 0, "Negative", "Neutral"))
  
  store <- data.frame(sentence = c(text[1], rep(NA, length(sentiment_labels) - 1)),
                      sentiment_scores,
                      sentiment_labels)
  
  re_order <- c("sentence", "word", "sentiment_labels", "sentiment_score", "iterated_score")
  
  data <- store[, re_order]
  
  
  return(data)
}





