# Overview
This script will pull files to machines remotely on the network (to update the screensaver for example: must be used in conjunction with a GPO)</br>
Covid has brought us challenges, but we have PowerShell to save us!

# Usage
Comps.txt --> Build your computer list (one computer per row)</br>
$source --> File(s) path

Run .\Remote_SS_Update.ps1 as Administrator

# Features
You can choose files locally or saved in a network folder ($source variable should be used according to your choice).
