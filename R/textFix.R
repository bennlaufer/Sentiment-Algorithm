#' Gets text file from user and cleans it up to be ready to be used
#'
#'
#' @return clean_text
#' 
#' @export

getText <- function(){
  
  # empty vector to store
  input <- c()
  
  # asks user to enter words
  cat("Enter sentences/words or whatever you would like! (Type 'done' to finish):\n")
  
  # read user input lines 
  while (TRUE) {
    line <- readline()
    
    if (line == "done") {
      # exits if user enters done
      break  
      
    } else {
      # stores
      input <- c(input, line)  
    }
  }
  
  # combine inputs into single string
  text <- paste(input,
                collapse = " ")
  
  # removes newline
  clean_text <- gsub("\n",
                     "",
                     text)
  
  final_text <- fix_sentence(clean_text)
  # returns clean_text
  return(final_text)
  
}


#' Helper function that fixes words from user input
#' 
#' @param sentence
#' 
#' 
#' @return list of correct words
#' 

fix_sentence <- function(sentence) {
  
  #splits sentences into a bunch of single words
  words <- strsplit(sentence, "\\s+")
  words_vector <- unlist(words)
  
  #applies vector of individual words to function
  fixed_words <- lapply(words_vector, check_word)
  fixed_words_vector <- list(fixed_words)
  
  #puts the list of words back into a sentence
  fixed_sentence <- sapply(fixed_words_vector,
                           paste,
                           collapse = " ")
  
  return(fixed_sentence)
}


#' Helper function that fixes words from user input
#' 
#' @param words
#' 
#' @import spelling
#' 
#' @return list of correct words
#' 

check_word <- function(word) {
  
  #checks if word correct
  check_original <- spelling::spell_check_text(word)
  
  # word correct
  if (nrow(check_original) == 0) {
    
    return(word)
    
    # word not correct
  } else {
    
    # removes extra letters ex(gooat -> goat)
    changed_word <- gsub("(\\w)\\1+",
                         "\\1",
                         word)
    
    #checks if word correct
    check_changed <- spelling::spell_check_text(changed_word)
    
    # word correct
    if (nrow(check_changed) == 0) {
      
      # Word is correct, returns
      return(changed_word)
      
      # word not correct
    } else {
      #word is not correct, goes through word_change function
      #only useful when the word has two letters correct and an extra was added (ex gooose)
      final_word <- fix_word(word, changed_word)
      
    return(final_word)
    
    }
  }
}



#' From word and letter can put the letter next to the target letter
#'
#' @param changed_word char
#' @param word char
#' 
#' @return new_word
#'
#' @export

fix_word <- function(word, changed_word){
  
  #finds letter needed to fill
  target_letter <- letter_find(word, changed_word)
  
  #finds which position in word letter should be added
  target_position <- which(strsplit(changed_word, "")[[1]] == target_letter)
  
  #adds the letter to the word
  new_word <- paste0(substr(changed_word,
                            1,
                            target_position),
                     target_letter,
                     substr(changed_word,
                            target_position + 1,
                            nchar(changed_word)))
  
  return(new_word)

}


#' Finds the difference in letters between two words inputted
#'
#' @param changed_word char
#' @param word char
#' 
#' @return difference a single letter
#'
#' @export 

letter_find <- function(word, changed_word){#word, changed_word){
  
  #empty vector
  difference <- character()
  
  #goes through every letter of the smaller of the words
  for (i in 1:min(nchar(word), nchar(changed_word))) {
    
    #checks if the letter is the same as the other
    if (substr(word, i, i) != substr(changed_word, i, i)) {
      
      #finds difference and stores vector of each letter that is different
      difference <- c(difference,
                      substr(word, i, i))
    }
  }
  #only need the unique ones
  difference <- unique(difference)
  
  return(difference)
}







