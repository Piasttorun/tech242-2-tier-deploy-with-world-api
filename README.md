# Process of World Project App Deployment
## Part one manual testing database
The individual commands were ran, you need to install mysql server and configure its config file, after that the source file needs to be run and mysql reset. MYSQL then needs to have a user to be able to access the database remotely. After running individually instead of making a script testing was done to ensure a connection with the tier 1 vm was made. hence a new VM was made for the app hosting, this app was connected however after some blockers, I accidently enabled a port option in the config file as i thought it  was prudent however it shouldn't have been changed, after trail and error the config file was able to be edited idempotently.
## part two, manually testing App
The app script was mainly already created, but the commands had to be tested individually, an additional dependency of MYSQL-server was added to test the connection with the database, user data was created normally using export without bashrc, the blockers here were mostly when creating the script.
## scripts
the script for the database had no blockers and after tesing worked well. however the APP database would connect to it, i later realised this was because it couldn't create a user and the error was hidden in the database script, after verifying that the VM connected the scripts ran well. The scripts had to be altered slightly for the new requirements with MYSQL connection checked.
## user data
user data for both scripts were rather easy to implement, and took 30m in the morning. User data was put into the user data section and they ran after the first time.
## AMIS
AMI's had some problems, after testing many times the blocker was that i didn't put a shebang at the beginning of the App AMI User data, which wasted a lot of time
## retrospective
Testing before hand and manually and more thoroughly and not adding additional steps before testing again, help back the pace of the deployment of the project, having a more planned out method of testing would be desired. I started of quick and that gave me confidence to move quicker, however i shouldn't have.
# the code for database vm
[user-data](data-user-data.sh)
[ami](data-ami.sh)
# the code for app vm
[user-data](app-user-data.sh)
[ami](app-ami.sh)