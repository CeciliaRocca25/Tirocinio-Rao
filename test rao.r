library(raster)
library(rasterdiv)

#Caricamento immagine -> la chiamo im

#Calcolo NDVI
ndvi <- (im$NIR - im$red) / (im$NIR + im$red)

#Rao ndvi
rao_ndvi <- Rao(ndvi, window = 5)

#Rao multispettrale
rao_multi <- Rao(as.list(im), window = 5)

#Deviazione standard da ndvi
sd_ndvi <- focal(ndvi, matrix(1, 5, 5), "sd", na.rm = TRUE)

#Salvataggio file
writeRaster(rao_ndvi, "Desktop/rao_ndvi.tif", "GTiff")


setwd("C:/lab/")
library(raster)
library(rasterdiv)

im_red<-raster("T32TNR_20221018T102031_B04_10m.jp2")
im_NIR<-raster("T32TNR_20221018T102031_B08_10m.jp2")

ndvi<-(im_NIR-im_red)/(im_NIR+im_red)
rao_ndvi <- Rao(ndvi, window=5)

