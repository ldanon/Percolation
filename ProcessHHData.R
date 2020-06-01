library('tidyverse')
library('openxlsx')

hh<-read.xlsx('CT1089.xlsx')

hh %>% 
  mutate(Size=a_0_19+a_20_69+a_70)->hh

hh %>% 
  group_by(Size) %>% 
  summarise(Count = sum(count))->HH_SizeHist_above7


#hh2<-read.table('CT1088.csv',sep = ",", stringsAsFactors = FALSE,header = TRUE)

#hh2 %>% 
#  mutate(Size = a_0_9+a_10_19+a_20_29+a_30_39+a_40_49+a_50_59+a_60_69+a_70_79+a_80)->hh2


hh2 %>% 
  select(Size,count) %>% 
rbind(.,hh %>% select(Size,count))->sizevector

hist(sizevector$Size)

sizevector %>% 
  group_by(Size) %>% 
  summarise(Count=sum(count))
#save(file='hh_age.Rdata',hh2)

load(hh_age)


hh2 %>% 
  group_by(Size) %>% 
  summarise(Count = sum(count)) -> HH_SizeHist

rbind(HH_SizeHist,HH_SizeHist_above7)->HH_SizeHist_All

HH_SizeHist_All %>% 
  ggplot(aes(x=Size, y=Count*(Size-1)))+
  geom_col()+
  xlab('Household Size')+
  scale_x_log10()+
  scale_y_log10()

#  write_csv(path = 'HHSizes.csv',x=HH_SizeHist_All)
  
#  save(file = 'HHSizes.Rdata',HH_SizeHist_All)
  
  
  

