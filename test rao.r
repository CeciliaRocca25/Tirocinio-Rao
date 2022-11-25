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
sd_ndvi <- focal(crop_ndvi, matrix(1, 5, 5), "sd", na.rm = TRUE)

#Salvataggio file
writeRaster(rao_ndvi, "Desktop/rao_ndvi.tif", "GTiff")


setwd("C:/lab/")
library(raster)
library(rasterdiv)

im_red<-raster("T32TNR_20221018T102031_B04_10m.jp2")
im_NIR<-raster("T32TNR_20221018T102031_B08_10m.jp2")
im_blue<-("T32TNR_20221018T102031_B02_10m.jp2")
im_green<-("T32TNR_20221018T102031_B03_10m.jp2")

ndvi<-(im_NIR-im_red)/(im_NIR+im_red)
ext<-extent(500000, 500200, 5040000, 5040200)
crop_ndvi<-crop(ndvi, ext)
plot(crop_ndvi)
rao_ndvi <- Rao(crop_ndvi, window=5)
plot(rao_ndvi[[1]][[1]])

im<-stack(im_green, im_blue, im_red, im_NIR)

crop_im<-crop(im, ext)
rao_multi <- Rao(as.list(crop_im), window = 5, mode="multispectral")
