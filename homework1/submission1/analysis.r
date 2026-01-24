#load packages
library(tidyverse)


## q1 provide a table under each plan type ##################
str(final.plans)
table(final.plans$plan_type) #i forgot how to do the headers and name the column 2018...

#q2 ##########
unique(final.plans$plan_type) #find all the unique names for plan type
finalplan.year_q2 <- final.plans %>% filter(
                                !str_detect(
                                    plan_type,
                                    regex(
                                        "SNP|Medicare-Medicaid|Employer|Union|18\\d{2}",
                                        ignore_case = TRUE
                                        )
    )
  )
#check that I removed: "HCPP - 1833 Cost" | "1876 Cost" | "Medicare-Medicaid Plan HMO/HMOPOS" | "Employer/Union Only Direct Contract PDP"
unique(finalplan.year_q2$plan_type) 

#create new table
table(finalplan.year_q2$plan_type)


####### q3 ############
service_merge_clean <- service_merge %>%
  rename(
    plan_type = plan_type.y
  )

# average enrollment by type
avg_enroll_by_plan_type <- service_merge_clean %>%
  group_by(plan_type) %>%
  summarize(
    avg_enrollment = mean(avg_enrollment, na.rm = TRUE),
    n_plans = n(),
    .groups = "drop"
  )
avg_enroll_by_plan_type 

