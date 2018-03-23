 
This project was completed as a Capstone for Coursera's **Data Science Specialization** through John Hopkins University.

The **goal** of the project was to build an interactive predictive text model that is similar to how a mobile phone's text messaging works (this one isn't as good :)).

### Summary of Project
The raw data to build the model came from three sources: twitter, blogs and news, which was provided by Switfkey and is available [here]( https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).  The data was truly raw and large and before removing extraneous information I first randomly sampled from each source based on its size.  After sampling, I preprocessed these samples and saved them as new files.  Next, I built the n-grams, which is just finding sequences of words that appear in 2's, 3's and 4's.  These were saved as Rdata files and are used in the predictive model.  

### Steps for App use
1. Enter a word or words into the **"Enter Word Here"** textbo
2. **"NULL"** is displayed in the **"Next Word"** textbox.
3. Once text is entered into the **"Enter Word Here"**, the predictive model will provide your next word in the **"Next Word"** textbox.
4. Also provided is which n-gram look-up table was used to find your next word

### Backoff Algorithm
1. For prediction of the next word, Quadgram is first used (first three words of Quadgram are the last three words of the user provided sentence).
2. If no Quadgram is found, back off to Trigram (first two words of Trigram are the last two words of the sentence).
3. If no Trigram is found, back off to Bigram (first word of Bigram is the last word of the sentence)
4. If no Bigram is found, the "App needs some more work" is returned
  

#### Extra
The codes for the Shiny App is available at this [GitHub Repository](https://github.com/bms63/Coursera_Data_Sci_Capstone)

Presentation is available at [RPubs](https://rpubs.com/bms63/372941)