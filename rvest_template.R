## 참고자료 rvest template

library(rvest)

URL <- ""
res <- read_html(URL)

# Table
#Sys.setlocale("LC_ALL", "C")
res %>% 
  html_table()
#Sys.setlocale("LC_ALL", "Korean")

# Element
pattern <- ""
res %>% 
  html_nodes() %>% 
  html_text()

# Attribute
pattern <- ""
res %>% 
  html_nodes() %>% 
  html_attr("href")
