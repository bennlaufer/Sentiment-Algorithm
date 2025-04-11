# Sentiment Algorithm (R)

An interactive sentiment analysis package in R that lets users input text, automatically corrects spelling, scores sentiment using the AFINN lexicon, and returns a tidy dataframe with labeled sentiment results. Great for quick, conversational text sentiment scoring in an R environment.

## ✨ Key Features

- 📥 **User input** via console — just type and go
- 🧹 **Spelling correction** using the `spelling` package
- 💬 **Sentiment scoring** via AFINN lexicon with `tidytext`
- 📈 **Iterative score tracking** for progressive sentiment insights
- 📊 **Clean output** with sentiment labels and scores in a dataframe

---

## 🗂️ Package Structure

The package is composed of three main scripts:

| Script        | Purpose                                                                 |
|---------------|-------------------------------------------------------------------------|
| `Sentiment.R` | Core function `sentiment()` to collect input and generate output        |
| `scores.R`    | Functions for calculating sentiment scores and iterative difference     |
| `textFix.R`   | Functions to clean and fix misspelled or noisy user input               |

---

## 📦 Installation

Clone the repo and use `devtools` to install:

```r
# if needed:
install.packages("devtools")

# install from local path
devtools::install_local("path/to/your/sentimentR-package")
```

## Dependencies

This package uses the following R libraries:

- `dplyr`
- `tidyverse`
- `tidytext`
- `textdata`
- `caret`
- `spelling`

Make sure these packages are installed before running the code.

```r
install.packages(c("dplyr", "tidyverse", "tidytext", "textdata", "caret", "spelling"))
```
