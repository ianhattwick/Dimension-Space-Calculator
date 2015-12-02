# Dimension-Space-Calculator

A simple dimension space creator, made in Processing. Requires the installation of the Processing PDF library:
https://processing.org/reference/libraries/pdf/

The dimension space calculator uses two CSV files as input. 
Once the csv files have been set, simply run the sketch and the output will be a vector pdf file in the same folder as the processing sketch.

The first CSV file defines the axes and labels of the dimensions space in the format:
(axisName,lowAxisValue,...,highAxisValue).
Note that the number of axis values is arbitrary - it will automatically space them appropriately.

The example provided has seven axes:

cats,0,1,2,3,4

dogs,0,5,20,100

hamsters,0,1

frogs,green,brown

tortoises,green,grey

rabbits,cute,cuter, cutest

people,mean,nice

The second CSV file defines an item to be placed into the dimension space. This file has the format:
(axis,axisValue) - note each line can only have two items.

Two examples are given - jan & pete. Here is jan's info:

cats,2

dogs,white

hamsters,brown

frogs,brown

tortoises,grey

rabbits,cuter

people,nice


Basic parameters for colors, lineweights, etc. have been gathered together at the beginning of the sketch to make it easy to customize.

