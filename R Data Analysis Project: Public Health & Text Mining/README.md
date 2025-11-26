**📊 San Diego Mortality Analysis (R)**

Exploring Leading Causes of Death in San Diego County (2011–2016)

This project analyzes county-level mortality data using R and RStudio, with a focus on the dataset Leading_Causes_of_Death_in_SD_2011_2016.csv.
It demonstrates skills in data cleaning, statistical summarization, visualization, and text mining—serving as a full end-to-end exploratory data analysis workflow.


**🚀 Project Overview**

This project was completed as part of a data analytics lab and modified to use a more comprehensive dataset than originally instructed. The analysis explores trends in mortality across San Diego County over a six-year period, helping identify which causes of death are most prominent and how patterns vary across time and geography.

In addition to numeric analysis, the project includes two text-mining tasks where I generate word clouds from different text sources, including a historical text file (England Opium Monopoly.txt).

**🔧 Key Skills Demonstrated**
- R programming (data import, manipulation, scripting)
- Data wrangling (filtering, grouping, aggregating, and summarizing)
- Statistical analysis (mortality rate comparisons across years/causes)
- Visualization with ggplot2 (bar charts and exploratory graphs)
- Text mining & NLP (corpus creation, stopword filtering, word cloud generation)
- Reproducible analysis (script-based workflow, exported figures)

**📁 Data**

**Main dataset:** Leading_Causes_of_Death_in_SD_2011_2016.csv

Contains:
- Yearly mortality counts
- Leading causes of death
- Age-adjusted mortality rates
- Breakdowns by region and demographic groups
- Text sources for word clouds:
- BigData_Definitions.txt – compiled class definitions of “Big Data”
- England Opium Monopoly.txt – historical text used to explore word frequencies, themes, and terminology around opium trade and policy

**🧹 Data Preparation**
- Imported data using read.csv()
- Inspected structure and summary statistics
- Filtered data by year and cause of death
- Aggregated mortality rates using aggregate() and/or dplyr-style operations
- Cleaned text data (removing punctuation, numbers, stopwords, and common filler words) before generating word clouds

**📈 Visualizations (Numeric Data)**

Custom ggplot2 charts were created to explore:
- Mean age-adjusted mortality rates by cause
- Year-to-year changes in leading causes of death
- Regional differences in death counts and rates

**Example:**
```
ggplot(summary_data, aes(x = Cause, y = Mean_Rate, fill = Cause)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
  labs(title = "Mean Mortality Rates by Cause (2011–2016)",
       y = "Mean Age-Adjusted Rate",
       x = "Leading Cause of Death")
```
**☁️ Text Mining & Word Clouds**

This project includes two separate word cloud analyses:

**1. Big Data Definitions Word Cloud**

Source: class-submitted definitions of “Big Data”

Libraries: tm, wordcloud, RColorBrewer

Steps:
- Build a corpus from BigData_Definitions.txt
- Remove punctuation, numbers, and common English stopwords
- Add custom stopwords (e.g., "big", "data", "project", course-specific terms)
- Generate two versions of a word cloud (initial, and refined after adjusting stopwords)

**2. England Opium Monopoly Word Cloud**

Source: England Opium Monopoly.txt (historical text)

Purpose: explore word frequencies and recurring concepts in a historical narrative

Steps:
- Read the text into a corpus using Corpus(DirSource("wordcloud/")) or similar
- Normalize case (lowercasing) and remove punctuation/numbers
- Customize stopwords to remove extremely common words (e.g., “the”, “and”, “of”) plus context-specific words if needed
- Generate a word cloud emphasizing terms related to trade, policy, and geography (e.g., “opium”, “India”, “China”, “monopoly”)
- Export a high-resolution PNG image (e.g., OpiumMonopoly_WordCloud.png)

Example snippet:
```
library(tm)
library(wordcloud)
library(RColorBrewer)

corpus <- Corpus(DirSource("wordcloud/"))
tdm <- TermDocumentMatrix(
  corpus,
  control = list(
    removePunctuation = TRUE,
    removeNumbers = TRUE,
    stopwords = c("the", "and", "of", "is", "are", stopwords("english")),
    tolower = TRUE
  )
)

m <- as.matrix(tdm)
freq <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(freq), freq = freq)

png("OpiumMonopoly_WordCloud.png", width = 12, height = 8, units = "in", res = 300)
wordcloud(df$word, df$freq, random.order = FALSE, colors = brewer.pal(8, "Dark2"))
dev.off()
```
