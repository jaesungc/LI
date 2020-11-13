# Ted Talks

library(rvest)
library(XML)
library(dplyr)
library(stringr)
library(writexl)



## Case 1. Extract names of speakers from the first page.

## rvest method
baseURL <- "http://www.ted.com/talks?page=1"
res <- read_html(baseURL)

## speaker

## xpath
pattern <- "//div[@class='container results']//h4[@class='h12 talk-link__speaker']"
res %>% html_nodes(xpath=pattern) %>% 
  html_text()

## css selector using selector gadget
pattern <- ".talk-link__speaker"
res %>% html_nodes(pattern) %>% 
  html_text()

### title
pattern <- "#browse-results div.media__message .ga-link"
res %>% html_nodes(pattern) %>% 
  html_text() %>% 
  str_trim

### link
pattern <- "#browse-results div.media__message .ga-link"
res %>% html_nodes(pattern) %>% 
  html_attr("href") %>% 
  str_c("http://www.ted.com", .)



## Case 2. We will scrap first three pages from the website.

n.page <- 10

## Step 1. Download Source files for each page
for (i in 1:n.page) {
  
  if (i%%5==1) print(str_c("Downloading source file for page ", i, " is in progress!"))
  baseURL <- str_c("http://www.ted.com/talks?page=", i)
  txt <- readLines(baseURL, warn=FALSE)
  outfile <- str_c("tedtalk", i, ".html")
  writeLines(txt, outfile)
  
  Sys.sleep(1)
  
}



## Step 2. Extracting information from each page

## rvest way
Stack<-NULL
for (i in 1:n.page) {
  
  if (i%%5==1) print(str_c("Scraping page ", i, " is starting"))
  
  infile <- str_c("tedtalk", i, ".html")
  res <- read_html(infile)
  
  pattern <- "//div[@class='container results']//h4[@class='h12 talk-link__speaker']"
  e1 <- res %>% 
    html_nodes(xpath=pattern) %>% 
    html_text()
  
  pattern <- "//div[@class='container results']//h4//a"
  e2 <- res %>% 
    html_nodes(xpath=pattern) %>% 
    html_text() %>%
    str_trim()
  
  pattern <- "//div[@class='meta']//span[@class='meta__item']//span[@class='meta__val']"
  e3 <- res %>% 
    html_nodes(xpath=pattern) %>% 
    html_text() %>% 
    str_trim()
  
  pattern <- "//div[@class='container results']//h4/a[@class=' ga-link']"
  e4 <- res %>% 
    html_nodes(xpath=pattern) %>%
    html_attr("href") %>%
    str_c("http://www.ted.com", .)
  
  tab <- data.frame(cbind(e1, e2, e3, e4))
  
  Stack <- rbind(Stack, tab)
  
}

colnames(Stack) <- c("speaker", "title", "posted", "link")
head(Stack)

outfile <- "tedtalk_list.xlsx"
write_xlsx(Stack, outfile)
