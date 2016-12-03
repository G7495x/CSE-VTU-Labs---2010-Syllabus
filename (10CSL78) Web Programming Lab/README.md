# (10CSL78) Web Programming Lab
### Excersises
1.  Develop and demonstrate a XHTML file that includes Javascript script for the following problems:
  1. Input: A number n obtained using prompt.<br>
  Output: The first n Fibonacci numbers.
  2. Input: A number n obtained using prompt.<br>
  Output: A table of numbers from 1 to n and their squares using alert.
2. 
  1. Develop and demonstrate, using Javascript script, a XHTML document that collects the USN (The valid format is: A digit from 1 to 4 followed by two upper-case characters followed by two digits followed by two upper-case characters followed by three digits; no embedded spaces allowed) of the user. Event handler must be included for the form element that collects this information to validate the input. Messages in the alert windows must be produced when errors are detected.
  2. Modify the above program to get the current semester also (restricted to be a number from 1 to 8)
3. 
  1. Develop and demonstrate, using Javascript script, a XHTML document that contains three short paragraphs of text, stacked on top of each other, with only enough of each showing so that the mouse cursor can be placed over some part of them. When the cursor is placed over the exposed part of any paragraph, it should rise to the top to become completely visible.
  2. Modify the above document so that when a paragraph is moved from the top stacking position, it returns to its original position rather than to the bottom.
 <br>
4. 
  1. Design an XML document to store information about a student in an engineering college affiliated to VTU. The information must include USN, Name, Name of the College, Brach, Year of Joining, and e-mail id. Make up sample data for 3 students. Create a CSS style sheet and use it to display the document.
  2. Create an XSLT style sheet for one student element of the above document and use it to create a display of that element.
 <br>
5. 
  1. Write a Perl program to display various Server Information like Server Name, Server Software, Server protocol, CGI Revision etc.
  2. Write a Perl program to accept UNIX command from a HTML form and to display the output of the command executed.
 <br>
6. 
  1. Write a Perl program to accept the User Name and display a greeting message randomly chosen from a list of 4 greeting messages.
  2. Write a Perl program to keep track of the number of visitors visiting the web page and to display this count of visitors, with proper headings.
 <br>
7. Write a Perl program to display a digital clock which displays the current time of the server.
8. Write a Perl program to insert name and age information entered by the user into a table created using MySQL and to display the current contents of this table.
9. Write a PHP program to store current date-time in a COOKIE and display the 'Last visited on' date-time on the web page upon reopening of the same page.
10. Write a PHP program to store page views count in SESSION, to increment the count on each refresh, and to show the count on web page.
11. Create a XHTML form with Name, Address Line 1, Address Line 2, and E-mail text fields. On submitting, store the values in MySQL table. Retrieve and display the data based on Name.
12. Build a Rails application to accept book information viz. Accession number, title, authors, edition and publisher from a web page and store the information in a database and to search for a book with the title specified by the user and to display the search results with proper headings.

### Technologies
* XHTML
* CSS3
* Javascript
* Perl
* Apache
* MySQL
* PHP
* Ruby on Rails

### Software Stack
**Operating system used:**	Ubuntu 16.04 LTS (32/64 bit) <br>
[Linux is required only for those programs that need shell command execution. For others, Windows may be used. The instructions and code are tailored specifically for Linux only. Some changes may be required for a few of them to work in Windows.] <br>

**Softwares:**
* A web browser - Tested on [Mozilla Firefox](http://www.mozilla.org/firefox/) v50
* [XAMPP](https://www.apachefriends.org/index.html) - Apache local server, MySQL Database, PHPMyAdmin
* Perl (Comes pre-installed in Ubuntu)

* Preferred text editor - [Sublime Text Editor](https://www.sublimetext.com/) or [Atom Text Editor](https://atom.io/) - with plugins.

### Instructions
**Installation:**
1. Install a web browser. <br>[It's **highly recommended** to use Firefox for getting exact output on all programs.]
2. Install XAMPP. Run the following command to add to $PATH for accessing MySQL, etc.
```
export PATH=$PATH:/opt/lampp/bin
```
3. Set root password for MySQL. (You can set your own password, but here ```root123``` is used throughout the programs.)
  1. Run the following commands in shell.
```
mysql -u root
SET PASSWORD FOR root@localhost = PASSWORD('root123');
```
  2. Run ```sudo gedit /opt/lampp/phpmyadmin/config.inc.php``` and search (ctrl+f) for a line that says ```$cfg['Servers'][$i]['user'] = 'root';```. Just enter ```root123``` there. This is so that PHPMyAdmin can work. The result should look like this ```$cfg['Servers'][$i]['password'] = 'root123';```.
4. Run the following commands for granting permissions to access the folders by user and applications.
```
sudo chmod 777 /opt/lampp/htdocs
sudo chmod 777 /opt/lampp/cgi-bin
```
5. Create a folder called ```web-lab``` inside ```htdocs``` for keeping the HTML,XML, XSL, CSS, PHP programs. <br>
  Create a folder called ```web-lab``` inside ```cgi-bin``` for keeping the CGI (perl) programs.
  Run the following commands again.
  ```
  sudo chmod 777 /opt/lampp/htdocs/web-lab
  sudo chmod 777 /opt/lampp/cgi-bin/web-lab
  ```
6. Install DBI for perl.
```
sudo -s
perl -MCPAN -e shell
```
<br> Then cpan> ```install DBI```.
<br> Use perl ```perl -e 'use DBI;'``` to check if its installed. If no error occurs, then installation was successful.

# **Warning!**
* Some code, typed in Windows doesn't work in Linux. This is due to **Line Endings**. Make sure all code has proper Linux line endings (LF).<br>
* Every program written in cgi-bin **MUST** have permissions set to **777**. Othwerwise, they dont work. <br>Just perform ```sudo chmod 777 *``` after saving **EVERY** program in the ```cgi-bin``` folder.

**Info:** <br>
``` /opt/lampp/htdocs/ ``` - This is the folder for all the HTML,XML, XSL, CSS, PHP files. By default, ``` localhost/ ``` in your web browser will direct to the contents in this folder. You can create folders inside it to organize your files, but their respective paths must be reflected while accessing through the browser.

``` /opt/lampp/cgi-bin/ ``` - This is the CGI folder. You can create folders inside it to organize your files, but their respective paths must be reflected inside the codes as well. <br>

**For starting Apache server:** ``` sudo /opt/lampp/lampp start ``` <br>
**For stopping Apache server:** ``` sudo /opt/lampp/lampp stop ``` <br>
[Type ``` localhost ``` in the browser to see if its running.]