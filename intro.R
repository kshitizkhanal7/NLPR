#introductions
install.packages("sf")
install.packages("raster")
install.packages("spData")
install.packages("devtools")
devtools::install_github("Nowosad/spDataLarge")


library(sf)          # classes and functions for vector data
library(raster)      # classes and functions for raster data

library(spData)        # load geographic data
library(spDataLarge)   # load larger geographic data

world
names(world)
#names() reveals the column names

plot(world) #creates maps distribution of all variables

summary(world$pop) #summary of population distribution of the world

summary(world$lifeExp)
#question: how to find smallest country in the world?

min(world$area_km2) #finds minimum value
which.min(world$area_km2)
world$name_long[which.min(world$area_km2)] #the answer is Luxembourg

#question: what are well known binaries? well known texts?
#text markup languages to represent vector geometries in a map. but how? 
##


#idea to learn better: revise each lesson after finishing
#this complements the Feynman technique

#write explainers for things you don't understand
#the best way to learn something is to teach
#write explainers for coordinate reference systems
#earth is not flat. to represent an ellipsiodal 3D structure in 2D papers or screens and to give unique id to
##each points (coordinates) on the surface of earth, various reference systems are devised. 


#after going through chapter 2 superficially, I will try to solve the
##challenges given in the exercise. Will I be able to solve them by
#referencing the text earlier as required? Let's see.


#Use summary() on the geometry column of the world data object. What does the output tell us about:
#Its geometry type?
#The number of countries?
#Its coordinate reference system (CRS)?
 
summary(world$geom) 
#geometry type is multi=polygon. makes sense.
#number of countries: probably 177. or around it but not exactly.
# I can check above by checking number of rows.
summary(world)
world
#seems like 177 countries as it says 177 features for world
#gives summary for all columns

#rename

#its CRS is espg 4326, proj4string longlat + datum=wgs84

#exercise 2
#Run the code that ‘generated’ the map of the world in 
#Figure 2.5 at
#the end of Section 2.2.4. Find two similarities and
#two differences between the image on your computer and that
#in the book.

#What does the cex argument do (see ?plot)?
  #Why was cex set to the sqrt(world$pop) / 10000?
  #Bonus: experiment with different ways to visualize 
#the global population

plot(world["continent"], reset = FALSE)
cex = sqrt(world$pop) / 10000 * 2
world_cents = st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)

#similarities: color choices are exactly the same for continents
#geometry rendered similarly

#differences:
#book has ellipsoid base
#book as circles at perfect centroids

#what does cex do?
?plot
#cex is symbol size
#they presented circles as function of population

#experimenting with the plot
plot(world["region_un"], reset = FALSE)
cex = sqrt(world$pop) / 10000
world_cents = st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)

world


#crs
crs_data = rgdal::make_EPSG()
View(crs_data)

