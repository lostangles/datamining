library(readxl)
library(igraph)

#Grab the Excel/dataset to be used
setwd("C:\\Users\\Brandon\\Documents\\facebook-datamining")
data <- read_excel("data.xlsx", sheet = "Sheet1")

#Turn it into an adjacency matrix 
data2 <- sapply(data[,-1], as.numeric)
group.g <- graph.adjacency(data2, weighted=TRUE,
                           mode="undirected", diag=FALSE)
la <- layout.fruchterman.reingold(group.g)
e.wt <- get.edge.attribute(group.g, "weight")

#Plot the graph
plot(group.g, layout=la, vertex.size=5,edge.width=e.wt,
     vertex.label=V(group.g)$name)

