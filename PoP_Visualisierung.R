library(tidyverse)
library(xlsx)

View(Bond_Data)
library(ggplot2)

#Diagramm Tötungen pro Film ----
ggplot(data = Bond_Data) +
  aes(x = `Movie Title`, weight = Kills) +
  geom_bar(fill = '#984ea3') +
  labs(title = 'In "Golden Eye" gibt es die meisten Tötungen',
    x = 'Film',
    y = 'Tötungen',
    subtitle = 'Balkendiagramm der Tötungen pro Film') +
  coord_flip() + 
  theme_grey()
ggsave("Bond_Kills.pdf", width = 8, height = 10)

library(ggplot2)
# Erfolg der Filme nach Schauspieler ----
Bond_Data %>% 
ggplot() +
  aes(x = `Movie Title`, fill = Actor, weight = Tomatoes) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1") +
  labs(title = "Connerys Bond-Filme haben die besten Bewertungen" ,
    x = 'Bewertung in Prozent',
    y = 'Film',
    subtitle = 'Balkendiagramm der beliebtesten Bond-Schauspieler') +
  coord_flip() +
  theme_gray()
ggsave("Beliebteste_Schauspieler.pdf", width = 8, height = 10)

library(ggplot2)
#Schauspieler und Mädchen geküsst insgesamt ----
ggplot(data = Bond_Data) +
  aes(x = Actor, weight = `Girls Kissed`) +
  geom_bar(fill = '#d94801') +
  labs(title = 'Moore hat die meisten Mädchen geküsst',
    x = 'Schauspieler',
    y = 'Mädchen geküsst',
    subtitle = 'Säulendiagramm zeigt Anzahl der Mädchen die jeder Schauspieler geküsst hat') +
  theme_gray()
ggsave("Schauspieler_kissed.pdf", width = 8, height = 10)

library(ggplot2)
#Welcher Schauspieler die meisten gevögelt hat ----
ggplot(data = Bond_Data) +
  aes(x = Actor, weight = `Explicitly Slept With`) +
  geom_bar(fill = '#26828e') +
  labs(title = 'Moore hat explizit mit den meisten Frauen geschlafen',
    x = 'Schauspieler',
    y = 'Sex mit Frauen',
    subtitle = 'Säulendiagramm der Schauspiler nach Anzahl der expliziten Sexpartnerinnen') +
  theme_gray()
ggsave("Schauspieler_sex.pdf", width = 8, height = 10)

