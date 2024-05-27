yum update -y
hostnamectl set-hostname gps
exec bash
yum install vim wget tar make unzip -y
yum install curl-devel expat-devel gettext-devel glib-devel openssl-devel -y
yum install gcc perl-ExtUtils-MakeMaker -y
cd /opt
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.43.2.tar.gz
tar -xvf git-2.43.2.tar.gz
ll 
git-2.43.2
git-2.43.2.tar.gz
cd git-2.43.2
ll 
make prefix=/usr/local/git all 
make prefix=/usr/local/git install
vim ~/.bashrc
export PATH=$PATH:/usr/local/git/bin 
save and exit by :wq
source ~/.bashrc
git --version


----------------------
working directory
3 types files

1.deleted files
2.modified files
3. untracked files 


adding the files from working directory to staging area:

git add file-name 
git add file-name file-name file-name .. nth file-name
git add . <--this one used for to add all files(all types of files) at a time.
git add * <-- by this command we can add only normal files and directories(or we can't add hidden files and hidden directories')

git add --all <-- this command used for to add all files at a time. 

git add -A <-- this command used for to add all files at a time. 

git add .java .c r* c* C* 

------------------------------------------------------------------
we can use stage command also for adding the files from working directory to staging

adding the files from working directory to staging area:
--> by using stage command 

git stage file-name 
git stage file-name file-name file-name .. nth file-name
git stage . <--this one used for to add all files(all types of files) at a time.
git stage * <-- by this command we can add only normal files and directories(or we can't add hidden files and hidden directories')

git stage --all <-- this command used for to add all files at a time. 

git stage -A <-- this command used for to add all files at a time. 

git stage .java .c r* c* C* 

-----------------------------------------------------------

staging area

1. deleted
2. modified files
3. new files 


unstage /reset the files from staging to working directory.

git reset file-name  <-- to unstage only one file at a time
git reset file-name file-name file-name .. nth file-name <-- to unstage number files at a time
git reset  <-- this command used for to unstage all files at a time from st to working directory
git reset . <-- this command used for to unstage all files at a time from st to working directory

git reset * <-- here we can reset or unstage only normal files and normal directories only 

-->> Note: by above command we can't unstage or reset hidden files and hidden  directories'



------------------------------------------------
commit: 

commit command used for to send the files from working,staging to committing area. 

git commit -m "any one message" file-name   <-- to commit the only one file from staging to committing area. 


git commit -m "any one message" file-name file-name file-name.. nth file-name  <-- to commit the  one or more file forom staging to committing area. 

git commit -m "message"  <-- this command works on staged files to commit at a time all files. 

NOte: above command only works on staged files only. 


git commit -m "any one message" B* t* *.java *.c 




_______________________________________________________________
un-commit:
to un-commit the files/latest commit from committing to staging area.

git reset --soft HEAD~ <-- by this command we can un-commit on latest committed id 

---------------------------------------------------------------------
un-commit and un-stage all latest commit and all staged files by below command. 

git rest @~ <-- this command works on latest committed files and all stages files. what it will do? 
it will un-commit the on latest commit and all staged files and place into working directory.










-------------------------------------------------------------

git show :  <-- this command used for to see the latest commit  
















