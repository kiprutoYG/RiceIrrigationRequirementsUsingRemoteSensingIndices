# This script is reproducible to plot the NDVI, NDMI, Crop coefficients, Crop evapotranspiration, Irrigation needs and Water deficit
# maps in the same scale, and will be reproduced for the other maps

#set working directory to the location of source files
setwd('E:/project/irrigationNeeds/datasets')


#test the working directory
getwd()
dir()


#load the required libraries
libs <- c(
  "raster", "sf", "rasterVis",
  "terra", "ggplot2", "reshape2"
)

# install missing libraries
installed_libs <- libs %in% rownames(installed.packages())
if (any(installed_libs == F)) {
  install.packages(libs[!installed_libs])
}

# load libraries
invisible(lapply(libs, library, character.only = T))


#Set the target projection system
target_crs <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"


#Now import the images for every timestep, and stack them
ndvi_stack <- stack(list.files(path = 'E:/project/irrigationNeeds/datasets/ndvi',
                               pattern = '.tif$',
                               full.names = TRUE))

#######################do the same for NDMI, KC, IN, WD, ET

#View the characteristics of the stack
ndvi_stack


#Reproject the raster stack
ndvi_stack_re <- projectRaster(ndvi_stack, crs = target_crs)

#Create the custom titles
variable_names <- list(
  "aug" = "August NDVI" ,
  "b_sep" = "September NDVI",
  "c_oct" = "October NDVI",
  "nov" = "November NDVI"
)


variable_labeller <- function(variable,value){
  return(variable_names[value])
}



#Plotting using ggplot2
gplot(ndvi_stack_re) +
  geom_raster(aes(fill = value ))+
  facet_wrap(~variable, ncol = 2, labeller = variable_labeller) +
  scale_fill_gradient2(low = "red",
                       mid = 'yellow',
                       high = "green",
                       midpoint = 0.5,
                       name = "NDVI",
                       na.value = 'transparent')+
  xlab("Longitude") +
  ylab("Latitude") +
  theme(text = element_text(size = 12)) +
  ggtitle("NDVI variations across growth stages") +
  theme(plot.title = element_text(hjust = 0.5)) +
  coord_fixed(ratio = 1)

ggsave('ndvi_plot.png',
       plot = last_plot(),
       width = 216,
       height = 279,
       units = "mm",
       dpi = 700)
