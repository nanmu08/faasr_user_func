prepare_data <- function(folder, input1, input2, output) {

  
  # Download the input files from S3 bucket
  # The bucket is configured in the JSON payload as My_S3_Bucket
  # In this demo code, all inputs/outputs are in the same S3 folder, which is also configured by the user
  # The downloaded files are stored in a "local" folder under names input1.csv and input2.csf
  #
  faasr_get_file(faasr, "My_S3_Bucket", folder, input1, "local", "input1.csv")
  faasr_get_file(faasr, "My_S3_Bucket", folder, input2, "local", "input2.csv")
  
  # This demo function computes output <- input1 + input2 and stores the output back into S3
  # First, read the local inputs, compute the sum, and store the output locally
  # 
  frame_input1 <- read.table("local/input1.csv", sep=",", header=T)
  frame_input2 <- read.table("local/input2.csv", sep=",", header=T)
  frame_output <- frame_input1 + frame_input2
  write.table(frame_output, file="local/output.csv", sep=",", row.names=F, col.names=T)

  # Now, upload the output file to the S3 bucket
  #
  faasr_put_file(faasr, "My_S3_Bucket", "local", "output.csv", folder, output)

  # Print a log message
  # 
  log_msg <- paste0('Function prepare_data finished; output written to ', folder, '/', output, ' in My_S3_Bucket defined in the JSON configuration')
  faasr_log(faasr, log_msg)
}	
