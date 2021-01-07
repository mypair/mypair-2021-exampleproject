#add packages
library(tidyverse)
library(skimr)
library(purrr)
library(cluster)     # for general clustering algorithms
library(factoextra)  # for visualizing cluster results
library(outliers)
library(dendextend)
library(cluster)
library(NbClust)
library(clustertend) #  for statistical assessment clustering tendency
library(clValid)
library(knitr)
library(fpc)
library(treemapify)

#read data
top10 <- read_csv("../input/top-spotify-songs-from-20102019-by-year/top10s.csv")

#check missing values
any(is.na(top10))

#check duplicates
top10 %>% select(-year, -X1) %>% anyDuplicated()

#remove duplicates
dup <- top10 %>% select(-year, -X1) %>% duplicated()

t10_noDuplicate <- top10 %>% 
  mutate(isDuplicate = dup) %>% 
  filter(isDuplicate == FALSE) %>%
  select(-isDuplicate)
