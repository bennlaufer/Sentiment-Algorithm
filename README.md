# 📊 Sentiment Analysis in R

This R package provides a user-interactive sentiment analysis tool that processes freeform text, performs spelling correction, tokenizes the text, calculates sentiment scores using the AFINN lexicon, and assigns sentiment labels (Positive, Negative, Neutral) to each word.

## Features

- Prompts users to enter any sentence or word input
- Cleans and corrects misspelled words using the `spelling` package
- Tokenizes text and applies sentiment scoring using the AFINN lexicon from `tidytext`
- Iteratively calculates cumulative sentiment differences
- Outputs a clean and labeled dataframe with sentiment results

## How It Works

1. **User Input**: Prompts the user to enter sentences. Input ends when "done" is typed.
2. **Spell Correction**: Fixes repeated letters and minor typos.
3. **Tokenization & Sentiment Scoring**: Text is broken into words, joined with AFINN lexicon, and sentiment scores are calculated.
4. **Iteration**: An `iterated_score` column computes a running sentiment total.
5. **Output**: Returns a tidy dataframe showing each word, sentiment label, score, and iterated score.

## 📦 Functions Overview

### `sentiment()`

Main function that:
- Collects and cleans user input
- Applies sentiment scoring
- Returns a labeled dataframe with the following columns:
  - `sentence`
  - `word`
  - `sentiment_labels`
  - `sentiment_score`
  - `iterated_score`

### `get_sentiment_score(text)`
Calculates sentiment scores for each word in the input text using AFINN.

### `iterated_difference(data)`
Computes a cumulative sentiment score difference across the words.

### `getText()`
Prompts user for sentence input and returns cleaned text.

### `fix_sentence(sentence)` / `check_word(word)` / `fix_word()` / `letter_find()`
Corrects spelling mistakes, particularly repeated letters (e.g., "goooat" → "goat").

## 📚 Dependencies

This package uses the following R libraries:

- `dplyr`
- `tidyverse`
- `tidytext`
- `textdata`
- `caret`
- `spelling`

Make sure these packages are installed before running the code.

install.packages(c("dplyr", "tidyverse", "tidytext", "textdata", "caret", "spelling"))
