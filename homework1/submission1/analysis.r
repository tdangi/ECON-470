#load packages
library(tidyverse)


## q1 provide a table under each plan type ##################
str(plan.year)
table(plan.year$plan_type) #i forgot how to do the headers and name the column 2018...

#q2 ##########
unique(plan.year$plan_type) #find all the unique names for plan type
plan.year_q2 <- plan.year %>% filter(
                                !str_detect(
                                    plan_type,
                                    regex(
                                        "SNP|Medicare-Medicaid|Employer|Union|18\\d{2}",
                                        ignore_case = TRUE
                                        )
    )
  )
#check that I removed: "HCPP - 1833 Cost" | "1876 Cost" | "Medicare-Medicaid Plan HMO/HMOPOS" | "Employer/Union Only Direct Contract PDP"
unique(plan.year_q2$plan_type) 

#create new table
table(plan.year_q2$plan_type)


####### q3 ############
#NEED TO DO THE DATA FOR THE service area files