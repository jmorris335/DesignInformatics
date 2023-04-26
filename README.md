# DesignInformatics
Class project for Design Informatics at Clemson University

## Installation Guide
### Download Git
To use this you will need to first install Git on your computer. You can do so from [their website](https://git-scm.com/), or you can install a GUI client such as [GitHub Desktop](https://desktop.github.com). 

*As a personal note, Git has a lot of confusing processes, but most IDE's will manage VCS (version control systems) for you. I personally recommend [Visual Studio Code 2](https://code.visualstudio.com/), which is lightweight, free, and infinitely configurable. If you have Git downloaded on your computer it can handle the operations for you just fine.*

### Clone the Repository
This repo serves as our site, so you'll need to clone it into your MAMP Document Root, which you can find if you open up MAMP. You can do this a number of ways, but the easiest is to go to the terminal (or powershell), navigate to your Document Root, and type `git clone https://github.com/jmorris335/DesignInformatics.git`. This will do 2 things, it will make a new folder (named DesignInformatics) that contains all the files in our repo, and it will also put it under the control of Git.

Once you've done that you should be able to navigate to the site (as long as you've started up MAMP's servers) at http://localhost:8888/DesignInformatics/.

### Setting up the Database
I came up with a slightly gamey way to sync our databases. If you go to the DB site (localhost:8888/DesignInformatics/db/) then you can see how it works. Basically we'll just have to press backup whenever we make changes to our database, and press reload whenever we need to sync the changes. 

Note that in order for this to work you'll need to identify where the mysql and mysqldump executables are on your computer, they come predownloaded with M/WAMP. You can set the file path in the `system_info.php` file in the db folder. We'll need to add this file to a `.gitignore` file eventually to keep from updating to everyone else's paths, but I thought I would leave it in the structure for now so you know what to look for. 

If you can come up with a better syncing method, please go ahead and implement it!

### Working with the Repository
A repo on your computer is just that, on your computer. Nobody has access to it but you. When you make changes, it will only effect you until you upload them to GitHub (our Git server). You can use an IDE to do that, or a client (like GitHub Desktop), or learn the command line interface. 

Note that Git saves previous versions, so its very hard to erase files and lose information (though not impossible). However, when you make changes and upload them, you're making changes to the main branch. Please be clear about what changes your making and why when you do so. The easiest way to avoid versioning conflict is to structure our project so we're never working on the same file at the same time.

### Organization
The db folder is for re-uploading the db dump file which is the database in its current state.
The generator folder holds class versions of database entities and generates values for the attributes for random entries while debugging.
The model folder has the database schema in .mwb form for mysql workbench and a pdf of the EER diagram.
The php folder holds all the php files (aka the actual website). It has 2 subfolders for demos which were used for debugging certain functions and rhyans forms for writing specific add, edit, and view pages for each entity.
The last folder (web) has folders forsetting the css style used on every page, the javascript code used on some pages, and media for holding pictures used on the printer overview page. Please keep all use of each of those types of contents to those folders. There is also a nav.php folder that sets up the navigation bar at the top.

When creating a function that other pages might use, please include it in the functions.php file. If it is related to SQL queries, please include it in the SQL_functions.php file. 