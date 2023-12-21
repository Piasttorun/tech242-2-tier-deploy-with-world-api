# Process of World Project App Deployment
## Part one manual testing database
The individual commands were ran, you need to isntal mysql server and configure its config file, after that the source file needs to be run and mysql reset. MYSQL then needs to have a user to be able to access the database remotely. After running individualy isntead of makign a script testign was doen to ensure a connection with the tier 1 vm was made. hence a new VM was made for the app hositng, this app was connected however after soem blockers, i accidently enabled a port option in ther config file as i thoguht it  was prudent however it shouldnt have been changed, after trail and error the config file was able to be edited idempotently.
## part two, manually testing App
The app script was mainly already created, but the commands had to be tested individually, an additional dependacncxy of MYSQL-server was added to test the connection with the dabase, user data was created noramly using export without bashrc, the blockers here were mostly when creatign the script.
## scripts
the script for the database had no blockers and after tesing worked well. however the APP databse would connect to it, i later realsied this was becasue it couldnt create a user and the erro was hidden in the database script, after verifying that the VM connected the scripts ran well
## user data
user data for both scripts were rather easy to implement, and took 30m in the morning.
## AMIS
AMI's had some problems, after testign many times the blocker was that i didnt put a shabang at the beginnign of the App AMI User data, which wasted a lot of time
## retrospective
Testing before hand and manually and more thoughirly and not adding aditional steps before testing agan, help back the pace of the deployment of the project, having a more palnned out method of testing would be desired. I started of quick and that gave me confidance to move quicker, however i shoudlnt have.
# the code for database vm
[user-data](data-user-data.md)
[ami](data-ami.md)
# the code for app vm
[user-data](app-user-data.md)
[ami](app-ami.md)