compute_product <- function(folder, input1, input2, output) {

  
  # Download the input files from S3 bucket
  # The bucket is configured in the JSON payload as My_S3_Bucket
  # In this demo code, all inputs/outputs are in the same S3 folder, which is also configured by the user
  # The downloaded files are stored in a "local" folder under names input1.csv and input2.csf
  #
  faasr_get_file(faasr, "My_S3_Bucket", folder, input1, "local", "input1.csv")
  faasr_get_file(faasr, "My_S3_Bucket", folder, input2, "local", "input2.csv")


 # ---------test uninstalled package-----------
  is_installed <- function(pkg_name) {
      return(pkg_name %in% rownames(installed.packages()))
  }
  
  packages_to_test <- c("janitor", "lubridate", "broom", "textclean")
  
  for(pkg in packages_to_test){
    if(is_installed(pkg)){
      cat(pkg, "is installed\n")
    } else {
      cat(pkg, "is NOT installed\n")
    }
  }
     # Create a sample data frame
  df <- data.frame(
    "First Name" = c("John", "Jane", "Doe"),
    "Last-Name" = c("Doe", "Doe", "John"),
    "Age___" = c(20, 25, 30),
    "Email.Address" = c("john.doe@email.com", "jane.doe@email.com", "doe.john@email.com")
  )
  
  print("Before cleaning:")
  print(df)
  
  # Use janitor to clean the names
  clean_df <- clean_names(df)
  
  print("After cleaning:")
  print(clean_df)
  # ---------end test uninstalled package-----------

  
  # This demo function computes output <- input1 * input2 and stores the output back into S3
  # First, read the local inputs, compute the sum, and store the output locally
  # 
  frame_input1 <- read.table("local/input1.csv", sep=",", header=T)
  frame_input2 <- read.table("local/input2.csv", sep=",", header=T)
  frame_output <- frame_input1 * frame_input2
  write.table(frame_output, file="local/output.csv", sep=",", row.names=F, col.names=T)

  # Now, upload the output file to the S3 bucket
  #
  faasr_put_file(faasr, "My_S3_Bucket", "local", "output.csv", folder, output)

  # Print a log message
  # 
  log_msg <- paste0('Function compute_product finished; output written to ', folder, '/', output, ' in My_S3_Bucket defined in the JSON configuration')
  faasr_log(faasr, log_msg)
}	
