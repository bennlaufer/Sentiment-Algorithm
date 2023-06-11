#' Gets text file from user and cleans it up to be ready to be used
#'
#' 
#'
#' @return clean_text
#' 
#' @export

getText <- function(){
  
  # Create an empty vector to store input lines
  input <- c()
  
  # Prompt the user to enter sentences/words
  cat("Enter sentences/words or whatever you would like! (Type 'done' to finish):\n")
  
  # Read input lines until the termination keyword 'done' is entered
  while (TRUE) {
    line <- readline()
    
    if (line == "done") {
      break  # Exit the loop if 'done' is entered
    } else {
      input <- c(input, line)  # Store the input line
    }
  }
  
  # Combine the input lines into a single string
  text <- paste(input, collapse = " ")
  
  # Remove the newline character
  clean_text <- gsub("\n", "", text)
  
  # Print the clean input
  return(clean_text)
  
}




