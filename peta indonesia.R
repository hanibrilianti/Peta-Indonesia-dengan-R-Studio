library(readxl)
library(sf)

geo <- st_read('IDN_adm/IDN_adm1.shp')
head(geo)
names(geo)
str(geo)

klaster <- read_excel("klaster.xlsx")
names(klaster)

#Menambahkan Nama Provinsi dan Klaster pada File .shp
geo[,11] <- klaster[,1]
geo[,12] <- klaster[,2]
geo[,13] <- klaster[,3]
geo[,14] <- klaster[,4]
names(geo)

plot(geo[,12], main = "Peta Indonesia")

#Mapping with ggplot2
library(ggplot2)

ggplot(data=geo)+
  geom_sf(aes(fill=Klaster))+
  theme_void()

#labelling
ggplot(data = geo)+
  geom_sf(aes(fill=Klaster))+
  scale_fill_viridis_c(direction = -1)+
  geom_text(data = geo, aes(Long, Lat, label=Province), size=2, fontface="bold")+
  theme_void()
