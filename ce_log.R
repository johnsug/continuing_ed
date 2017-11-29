
library(data.table)
dat <- fread("https://raw.githubusercontent.com/johnsug/continuing_ed/master/ce_log.csv")

## init
dat[, structured:=0]
dat[, outside_structured:=0]
dat[, professionalism:=0]
dat[, job_revelant:=0]
dat[, business:=0]

## tag
dat[Structure=="Structured", structured:=Credits]
dat[Employer=="No" & Structure=="Structured", outside_structured:=Credits]
dat[Category=="Professionalism", professionalism:=Credits]
dat[Category=="Job-relevant", job_revelant:=Credits]
dat[Category=="Business/management", business:=Credits]

## roll-up
ce <- dat[Year %in% 2016:2017, .(total=sum(Credits), 
                                 structured=sum(structured),
                                 outside_structured=sum(outside_structured),
                                 professionalism=sum(professionalism),
                                 job_revelant=sum(job_revelant),
                                 business=sum(business))]

## in compliance every two years if:
##    60 credits (~30/year)
##    30 credits from structured (~15/year)
##    7.5 of structured from outside sources (~3.75/year)
##    3 credits in professionalism (~1.5/year)
##    no more than 15 from business management (~7.5/year) -- need some sort of error handling to set B.M. hours over 15 to 0
