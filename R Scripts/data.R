#Working directory
setwd("../CSV Data/")

#Data extraction
d <- data.frame()
for (i in seq(2008, 2024, by=4)) {
  d <- rbind(d, read.csv(paste(i, "csv", sep=".")))
}
rm(i)

#Useless column removal
d$Quantidade.de.candidatos <- NULL
d$Data.de.carga            <- NULL

#New column names
colnames(d) <- c("Year",
                 "Region", "State", "Municipality",
                 "Race", "Age",
                 "Gender", "Gender.Identity",
                 "Sexual.Orientation", "Civil.State",
                 "Education", "Job",
                 "Federation", "Party",
                 "Reelection")

#Adding political spectrum position
p <- read.csv("spectrum.csv")
d <- merge(x = d, y = p, by = "Party", all.x = T)
rm(p)

#Factoring
for (i in colnames(d)) {
  d[,i] <- factor(d[,i])
}
rm(i)
