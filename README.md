# DFS-with-R
Using Rvest and Analytical tools in R to analyze Daily Fantasy Basketball trends

-I would use the DFS scraper to scrape web data into a csv.
-In the csv i would clean up data and delete rows and players I dont need
-Then I would sort the csv in alphabetical order by player name.
-The data necesaary is fantasy points, so following Fanduels Fantasy scoring, 
-I would calculate historical data of each players fantasy game logs.

----------------
2019gameLogs.xlsm
----------------
This CSV i would convert into an XLSM and use macros to mutate and work with the data, purely for visualisation purposes.
After performing varius tasks i would convert the first Worksheet (containing my cleaned up historical data) into a csv.
The csv would then be used in my DFSRegRes File.

-----------
DFSRegRes
------------
The DFSRegRes File runs a series of regression analysis to see which teams give up various stats to different positions.
For example: The ranking of teams that give up the most fantasy points to shooting guards
             The team that gives up the fewest actual points to opposing center
             
My various Regression results would be turned into data tables that i would store as DVP1, DVP2, DVP3. These files contained Regression tables ranking different teams based on different statsitics like points given up, assists given up, and etc. These tables would be pasted into worksheets 2 and 3 of the XLSM workbook.


          
