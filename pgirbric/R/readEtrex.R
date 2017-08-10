readEtrex<-function(type="w",wcom=4){

    if (!(type=="w" | type=="t")) stop("type must be 'w' (waypoints) or 't' (tracks)")

    if (Sys.info()["sysname"]!="Windows") {# OK sous linux Ubuntu 6.10
        gpsdata<-system(paste("gpsbabel -",type," -i garmin -f /dev/ttyUSB0 -o tabsep -F -",sep=""), intern=TRUE)
        if (any(grep("Can't init",gpsdata))) stop("Cannot read GPS: check connexion")
        }
    else {# OK sous Windows
        if (any(grep(wcom,0:9))){
            gpsdata <- system(paste("gpsbabel -",type," -i garmin -f com",wcom,": -o tabsep -F -",sep=""), intern=TRUE, invisible=TRUE)
            if (any(grep("Can't init",gpsdata))) stop("Cannot read GPS: check connexion and com port number 'wcom'")
            }
        else stop("Windows com port number 'wcom' must be one of 0:9")
    }
    gpsdata<-read.table(textConnection(gpsdata), fill=TRUE)
    
    
    if (type=="w"){
        gpsdata<-gpsdata[,c(2,7,6,17)]
        names(gpsdata)<-c("ident","long","lat","altitude")
        gpsdata$altitude<-as.numeric(substr(as.character(gpsdata$altitude),1,nchar(as.character(gpsdata$altitude))-1))
        attributes(gpsdata)$type<-"Waypoints"
    }
    
    if (type=="t"){
        gpsdata<-gpsdata[,c(4,3,14)]
        names(gpsdata)<-c("long","lat","altitude")
        ident<-1:length(gpsdata[,1])
        gpsdata<-data.frame(ident=ident,gpsdata)
        gpsdata$altitude<-as.numeric(substr(as.character(gpsdata$altitude),1,nchar(as.character(gpsdata$altitude))-1))
        attributes(gpsdata)$type<-"Track"
    }
    
    attributes(gpsdata)$sysTime<-Sys.time()
    gpsdata
}
