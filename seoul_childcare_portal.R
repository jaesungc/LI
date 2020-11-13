#1. 서울보육포털: 인코딩 이슈가 있어서 Windows 환경과 RStudio Cloud 환경에서 동작하는 코드를 구분해서 수록했습니다.

## Windows 환경: 에서는 인코딩 이슈가 있어서 local 설정에 관한 부분을 추가해야 합니다.

## Clear memory
rm(list=ls())

library(XML)
library(rvest)
library(dplyr)
library(readxl)
library(writexl)

url <- "https://iseoul.seoul.go.kr/portal/info/preSchoolList.do?pageIndex=3"


## Method 1. XML library
txt <- readLines(url)
txt_p <- htmlParse(txt)
Sys.setlocale("LC_ALL", "C")
tab <- readHTMLTable(txt_p)
Sys.setlocale("LC_ALL", "Korean")
df1 <- tab[[1]]
head(df1)
write_xlsx(df1, "seoul_childcare_center_p3_XML.xlsx") 


## Method 2. rvest library
Sys.setlocale("LC_ALL", "C")
df2 <- read_html(url) %>% 
  html_table() %>% 
  as.data.frame()
Sys.setlocale("LC_ALL", "Korean")
head(df2)

write_xlsx(df2, "seoul_childcare_center_p3_rvest.xlsx") 

