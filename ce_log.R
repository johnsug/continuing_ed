
library(sqldf)
dat <- read.csv("https://raw.githubusercontent.com/johnsug/continuing_ed/master/ce_log.csv")

## aggregate CE log
ce <- sqldf("select year, 
             sum(credits) as credits, 
             sum(outside_structured) as outside_structured, 
             sum(outside) as outside_stc
             sum(professionalism) as professionalism,
             sum(job_revelant) as job_revelant,
             sum(business) as business
            from 
             (select year, 
               credits, 
               case when structure = 'Structured' then credits else 0 end as structured, 
               case when employer = 'No' and structure = 'Structured' then credits else 0 end as outside_structured, 
               case when category = 'Professionalism' then credits else 0 end as professionalism,
               case when category = 'Job-relevant' then credits else 0 end as job_revelant,
               case when category = 'Business/management' then credits else 0 end as business
             from dat) as a
           group by 1")

## in compliance every two years if:
##    60 credits (~30/year)
##    30 credits from structured (~15/year)
##    7.5 of structured from outside sources (~3.75/year)
##    3 credits in professionalism (~1.5/year)
##    no more than 15 from business management (~7.5/year) -- need some sort of error handling to set B.M. hours over 15 to 0

ce$in_complaince <- (ce$credits>=30) * (ce$structured>=15) * (ce$professionalism>1.5) * (ce$outside_structured>7.5)
ce
