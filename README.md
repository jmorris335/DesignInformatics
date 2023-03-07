# DesignInformatics
Class project for Design Informatics at Clemson University

## Installation Guide
### Download Git
To use this you will need to first install Git on your computer. You can do so from [their website](https://git-scm.com/), or you can install a GUI client such as [GitHub Desktop](https://desktop.github.com). 

*As a personal note, Git has a lot of confusing processes, but most IDE's will manage VCS (version control systems) for you. I personally recommend [Visual Studio Code 2](https://code.visualstudio.com/), which is lightweight, free, and infinitely configurable. If you have Git downloaded on your computer it can handle the operations for you just fine.*

### Clone the Repository
This repo serves as our site, so you'll need to clone it into your MAMP Document Root, which you can find if you open up MAMP. You can do this a number of ways, but the easiest is to go to the terminal (or powershell), navigate to your Document Root, and type `git clone https://github.com/jmorris335/DesignInformatics.git`. This will do 2 things, it will make a new folder (named DesignInformatics) that contains all the files in our repo, and it will also put it under the control of Git.

Once you've done that you should be able to navigate to the site (as long as you've started up MAMP's servers) at http://localhost:8888/DesignInfomatics/.

### Setting up the Database
I'm not totally sure the best way to sync our database, though I'm working on an automated script. For now ignore the php files (or change them if you can figure out a way to make them work!). You can put SQL export documents (generated from phpMyAdmin) in the `db` folder. Whenever you need the latest db file you'll have to manually import in phpMyAdmin from these export docs. 

### Working with the Repository
A repo on your computer is just that, on your computer. Nobody has access to it but you. When you make changes, it will only effect you until you upload them to GitHub (our Git server). You can use an IDE to do that, or a client (like GitHub Desktop), or learn the command line interface. 

Note that Git saves previous versions, so its very hard to erase files and lose information (though not impossible). However, when you make changes and upload them, you're making changes to the main branch. Please be clear about what changes your making and why when you do so. The easiest way to avoid versioning conflict is to structure our project so we're never working on the same file at the same time.
