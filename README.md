# TABLE LIBRARY MODULE

## Description:

****This is a custom table library module that was made by @Tranquananh2811, this module contains most of the table library functions in Roblox. Since Roblox Bedwars custom Lua is lacking a lot of table library functions and some of them don't even work properly****

Table Library (API) - https://create.roblox.com/docs/reference/engine/libraries/table#summary

## NOTES:

`table.freeze` and `table.isFreeze` are the functions that I will not add into the module!!

## Basic Usage:

Go to the creative script panel. Create a script a name it to whatever you want. Copy & paste the script from the `TableLibraryModule.lua`  then require it by using `require()` from another script and put the script name in the `require()`. After that, save the module and the other script then rerun.

```lua
local TableLibModule = require('TableModule') --- Put the script name in the require() like this

local myTab = {1, true, false, 'Hello, World!!'}

print(TableLibModule.find(myTab, 'Hello, World!!')) --- 4 (The function found the value so it returns the value index.)
TableLibModule.remove(myTab, TableLibModule.find(myTab, 'Hello, World!!')) --- Remove the "Hello, World!!" by using its index.
print(TableLibModule.find(myTab, 'Hello, World!!')) --- nil (The table has removed the "Hello, World" after calling .remove function.)
TableLibModule.insert(myTab, 'Hello, World!!')
print(TableLibModule.find(myTab, 'Hello, World!!')) --- 4 (The function found the value after using .insert function to put "Hello, World!!" back into the table so it can return the value index.)
```
