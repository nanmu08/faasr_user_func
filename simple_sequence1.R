#library("FaaSr")
   
F1 <- function(faasr) {
  # print("Hello from inside function F1")
  args <- faasr_get_user_function_args(faasr)
  # return arguments for this function (F1)
  # expects input1, input2: input file names; output: 
  faasr_get_file(faasr, "S3_A", "folder", args$input1, "local", "input1.csv")
  faasr_get_file(faasr, "S3_A", "folder", args$input2, "local", "input2.csv")
  # need to implement output <- input1 * input2
  # if there's a header in each csv file, "header=T"
  input1 <- read.table("local/input1.csv", sep=",", header=F)
  input2 <- read.table("local/input2.csv", sep=",", header=F)
  output <- input1 + input2
  # if there's a header in csv file, "col.names=T"
  write.table(output, file="local/output.csv", sep=",", row.names=F, col.names=F)
  faasr_put_file(faasr, "S3_A", "local", "output.csv", "folder", args$output)
  faasr_log(faasr, "User function F1 finished")
}	


F2 <- function(faasr) {
  # print("Hello from inside function Fs")
  args <- faasr_get_user_function_args(faasr)

#    # test uninstalled package
# is_installed <- function(pkg_name) {
#     return(pkg_name %in% rownames(installed.packages()))
# }

# packages_to_test <- c("janitor", "lubridate", "broom", "textclean")

# for(pkg in packages_to_test){
#   if(is_installed(pkg)){
#     cat(pkg, "is installed\n")
#   } else {
#     cat(pkg, "is NOT installed\n")
#   }
# }
#    # Create a sample data frame
# df <- data.frame(
#   "First Name" = c("John", "Jane", "Doe"),
#   "Last-Name" = c("Doe", "Doe", "John"),
#   "Age___" = c(20, 25, 30),
#   "Email.Address" = c("john.doe@email.com", "jane.doe@email.com", "doe.john@email.com")
# )

# print("Before cleaning:")
# print(df)

# # Use janitor to clean the names
# clean_df <- clean_names(df)

# print("After cleaning:")
# print(clean_df)

   
        
  # return arguments for this function (F2)
  # expects input1, input2: input file names; output: 
  faasr_get_file(faasr, "S3_A", "folder", args$input1, "local", "input1.csv")
  faasr_get_file(faasr, "S3_A", "folder", args$input2, "local", "input2.csv")
  # need to implement output <- input * input
  # if there's a header in each csv file, "header=T"
  input1 <- read.table("local/input1.csv", sep=",", header=F)
  input2 <- read.table("local/input2.csv", sep=",", header=F)
  output <- input2 - input1
  # if there's a header in csv file, "col.names=T"
  write.table(output, file="local/output.csv", sep=",", row.names=F, col.names=F)   
  faasr_put_file(faasr, "S3_A", "local", "output.csv", "folder", args$output)
  faasr_log(faasr, "User function F2 finished")
}	

F3 <- function(faasr) {
  # print("Hello from inside function Fs")
  args <- faasr_get_user_function_args(faasr)
  # return arguments for this function (F3)
  # expects input1, input2: input file names; output: 
  faasr_get_file(faasr, "S3_A", "folder", args$input1, "local", "input1.csv")
  faasr_get_file(faasr, "S3_A", "folder", args$input2, "local", "input2.csv")
  # need to implement output <- input * input
  # if there's a header in each csv file, "header=T"
  input1 <- read.table("local/input1.csv", sep=",", header=F)
  input2 <- read.table("local/input2.csv", sep=",", header=F)
  output <- input2 - input1
  # if there's a header in csv file, "col.names=T"
  write.table(output, file="local/output.csv", sep=",", row.names=F, col.names=F)   
  faasr_put_file(faasr, "S3_A", "local", "output.csv", "folder", args$output)
  faasr_log(faasr, "User function F3 finished")
}	

F4 <- function(faasr) {
  # print("Hello from inside function Fs")
  args <- faasr_get_user_function_args(faasr)
  # return arguments for this function (F4)
  # expects input1, input2: input file names; output: 
  faasr_get_file(faasr, "S3_A", "folder", args$input1, "local", "input1.csv")
  faasr_get_file(faasr, "S3_A", "folder", args$input2, "local", "input2.csv")
  # need to implement output <- input * input
  # if there's a header in each csv file, "header=T"
  input1 <- read.table("local/input1.csv", sep=",", header=F)
  input2 <- read.table("local/input2.csv", sep=",", header=F)
  output <- input2 + input1
  # if there's a header in csv file, "col.names=T"
  write.table(output, file="local/output.csv", sep=",", row.names=F, col.names=F)   
  faasr_put_file(faasr, "S3_A", "local", "output.csv", "folder", args$output)
  faasr_log(faasr, "User function F4 finished")
}	
