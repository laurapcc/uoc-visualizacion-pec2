if(!require("igraph")) install.packages("igraph")
if(!require("network")) install.packages("network")
if(!require("tidyverse")) install.packages("tidyverse")

library("igraph")
library("network")
library("tidyverse")


devtools::install_github("pj398/movienetdata")
frozen <- movienetdata::frozen

# grafo a partir de la matriz adjacency
graph <- graph_from_adjacency_matrix(frozen$adjacency, mode = "directed")

# listado de aristas del grafo, corrende a todas las interacciones
edges = as_edgelist(graph)
edges_df <- as.data.frame(edges)

# Ana - Elsa es igual que Elsa - Ana, se ordenan alfabeticamente los elementos de cada fila
edges_nond <- apply(edges_df, 1, function(x) paste(sort(x), collapse="-"))

# calculo de frecuencias de cada fila
freqs <- as.data.frame(table(edges_nond))

# dataset final
frozen_arc <- separate(freqs, edges_nond, into=c("Name1","Name2"), sep="-")
write.csv(frozen_arc, "frozen.csv", row.names=FALSE)


