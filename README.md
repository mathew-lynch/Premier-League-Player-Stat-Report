# Premier League Player Stat Report
An interactive RMarkdown HTML document showcasing Premier League player performance data, including xG, from ESPN and Understat. 

This interactive player summary uses the same data as is used in the _Premier League Stat Attack_ RShiny dashboard, which showcases Premier League results and xG data sourced from ESPN and Understat, respectively. The HTML product presents shot data (also from Understat) for each player on an interactive pitch, including shot position, xG, opponent and last action. Some of the code used to scrape data from Understat was sourced from ewenme's understatr package on GitHub (https://github.com/ewenme/understatr) and the code used to create the interactive pitch was sourced from https://github.com/FCrSTATS/StatsBomb_WomensData.

The HTML summary is hosted by shinyapps.io and is available at https://mlynch98.shinyapps.io/Premier-League-Player-Stat-Report/.

## The summary

This HTML summary, produced in RMarkdown, showcases Premier League results, xG and shot data from the 2023/24 season. The user selects a player from a drop-down menu, and is presented with a summary of their team's performance (including games won, drawn and lost and their league rank) as well as their individual performance (including goals, xG, assists and xA). Such a summary is useful as it allows the user to evaluate a certain player and use the visualisations provided to understand the context behind their xG/xA, which can often be difficult to interpret.

An interactive pitch illustrates the position of shots taken by the player which resulted in a goal. When the user hovers over a data point, the following information is provided:

•	The opponent against which the goal was scored

• The xG associated with the shot

• The action which led to the shot being taken, such as a through ball, pass or cross.

A radar chart provides another illustration of the player's performance across a series of metrics, including xG90, xA90 and npxG90.

## The code

**scrape_results**:
Scrapes results for every Premier League team from https://www.espn.co.uk and returns a tibble of results

**process_data**:
Takes the scraped results and calculates home/away win/draw/loss totals and percentages for a SPECIFIC team. The function requires a tibble containing the results, and the team name

**home_and_away**:
Calculates proportions of wins/draws/losses

**summary_all**:
Calculates win/draw/loss totals and percentages for home and away games for EVERY team - this is required when calculating team rankings

**home_and_away_rankings**:
Calculates home and away rankings for wins, draws and losses

**teams_data**:
Scrapes Premier League team xG data from https://understat.com/league/EPL and returns a tibble of results

**players_data**:
Scrapes Premier League player xG data from https://understat.com/league/EPL and returns a tibble of results

**shot_data**:
Scrapes shot data for a given player from https://understat.com/ and returns a tibble of results
