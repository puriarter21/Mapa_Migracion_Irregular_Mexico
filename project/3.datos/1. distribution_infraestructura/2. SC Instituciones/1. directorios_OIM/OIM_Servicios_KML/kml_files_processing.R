library(tidyverse)
library(sf)
library(mapview)
library(rvest)
library(httr)
library(xml2)


filename <- "~/Downloads/Aguascalientes - Servicios para refugiados.kml"

# how to list all files with pattern in folder
# pattern ".kml"
# haz una lista en la cual tengas todos los filenames kml_files

# aqui iria el otro for

# aqui crearias otro dataframe vacio con columnas ciudad, tipo, name, description y geometry_str
# lugares = tibble(...)

# for(archivo in kml_files){
  #   lugares_layer_temp <- read_sf(filename, layer = layer_name)

  # al filename le quites la ruta y todo lo de despues del guion kml_ciudades
  # eg. ["cancun", "aguascalientes", "..."] se llama ciudad

  # aqui va el for que ya escribimos
  # y le quitas el read_sf de adentro



# layers
layers <- st_layers(filename)

# data frame vacio para ir llenando
lugares_cd_temp <- tibble(Tipo = character(),
                       Name=character(), 
                       Description=character(), 
                       geometry_str=character()) 


# for loop que va leyendo cada layer y lo mete en el data frame antes vacio
for(layer_name in layers$name){
  lugares_layer_temp <- read_sf(filename, layer = layer_name)
  
  lugares_layer_temp["geometry_str"] <- as.character(lugares_layer_temp["geometry"])
  lugares_layer_temp["geometry"] <- NULL
  
  lugares_layer_temp <- as.data.frame(lugares_layer_temp) %>% 
    mutate(Tipo = layer_name)
  
  lugares_cd_temp <- lugares_cd_temp %>% 
    bind_rows(lugares_layer_temp)
}

# crear la columna nueva en el df grande
#  nose2["ciudad"] <- ciudad


# aqui terminaria el otro for
#}

View(lugares_temp)

# ya que tengas todo vas a tener que procesar un poquito la columna de geometry
# porque es una lista, idealmente conviertelo a dos colunnas lat y lon para que
# sea facil graficarlas en mapas
# y si quieres procesar la de descripcion pues diviertete





