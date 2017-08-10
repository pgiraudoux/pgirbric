
uploadEtrex<-function(gpx, wcom=4,type="w") {
  if (type=="w" | type=="t"){
  if (Sys.info()["sysname"]!="Windows") {# OK sous linux
        system(paste("gpsbabel -",type," -i gpx -f ",gpx," -o garmin -F /dev/ttyUSB0",sep=""))
        }
    else {# OK sous Windows
         system(paste("gpsbabel -",type," -i gpx -f ",gpx," -o garmin -F com",wcom,":",sep=""))
    }
    } else stop("type must be w (waypoints) or t (track)")
}