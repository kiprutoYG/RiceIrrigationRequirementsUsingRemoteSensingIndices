# This script is reproducible to calculate the agreement between water variation and health of rice
# in every particular area of the rice field.
# It was reproduced to calculate the agreement in each rice growing stage as well.

# libraries we need
libs <- c(
  "tidyverse", "sf", "raster",
  "terra", "sp"
)

# install missing libraries
installed_libs <- libs %in% rownames(installed.packages())
if (any(installed_libs == F)) {
  install.packages(libs[!installed_libs])
}

# load libraries
invisible(lapply(libs, library, character.only = T))


#read in the NDVI and NDMI rasters
ras1 <- rast('ndmiMsk/ndmi.img')
ras2 <- rast('ndviMsk/ndvi.img')


#read the area of interest shapefile
shp <- shapefile('E:/project/irrigationNeeds/datasets/ahero.shp')


ras1 <- raster(ras1)
ras2 <- raster(ras2)

#crop to AOI
ras1 <- crop(ras1, shp)
ras2 <- crop(ras2, shp)


#change ro dataframe
ext1 <- as.data.frame(ras1, xy= TRUE)
ext2 <- as.data.frame(ras2, xy= TRUE)

#remove the NAs
ext1 <- filter(ext1, !is.na(ndmi))
ext2 <- filter(ext2, !is.na(ndvi))

#calculate the difference and store in dataframe
diff <- ext2$ndmi - ext1$ndvi

#calculate the mean values and store in dataframe
meanV <- (ext1$ndmi + ext2$ndvi)/2

#merge the difference and means to one dataframe
df1 <- data.frame(diff, meanV)

#calculate the mean difference
mean_difference <- mean(df1$diff)

#calculate the lower limit
lower <- mean_difference - 1.96 * sd(df1$diff)

#calculate the upper limit
upper <- mean_difference + 1.96 * sd(df1$diff)


#creating the band-altman plot
ggplot(df1, aes(x = meanV, y = diff)) +
  geom_point(alpha=1/8) +
  geom_hline(yintercept = mean_d) +
  geom_hline(yintercept = lower, color = "red", linetype="dashed") +
  geom_hline(yintercept = upper, color = "red", linetype="dashed") +
  ggtitle("Bland-Altman Plot") +
  ylab("Difference Between NDVI and NDMI") +
  xlab("Average Measurement")
