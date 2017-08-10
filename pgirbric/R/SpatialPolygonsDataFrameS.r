SpatialPolygonsDataFrameS<- function (lst, ID, df, proj4string = CRS(as.character(NA)), match.ID = FALSE) {
    ID=as.character(ID)
    lst <- lapply(lst, Polygon)
    for (i in 1:length(lst)) lst[[i]] <- Polygons(list(lst[[i]]), ID = ID[i])
    lst <- SpatialPolygons(lst, proj4string = proj4string)
    SpatialPolygonsDataFrame(lst, df, match.ID = match.ID)
}