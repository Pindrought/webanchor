This package is to make anchoring web elements simpler allows less brain power invested into the math portion of aligning elements.

The primary function is GenerateWebUI(childAnchorPoint, width, height, parent, parentAnchorPoint, xOffset, yOffset)
childAnchorPoint - The point on your new web ui that will be anchored.
width - ui width
height - ui height
parent [optional] - the parent of this ui element - if this is nil, the game screen will default to the parent
parentAnchorPoint [optional] - the anchor point on the parent - if this is nil, the value will default to match the child's anchor point
xOffset [optional] - xOffset applied after ui is anchored (nil will default to 0)
yOffset [optional] - yOffset applied after ui is anchored (nil will default to 0)

See the example packages provided along with their images.

PLACE THE WEBANCHOR PACKAGE BEFORE ANY PACKAGES THAT WILL IMPORT IT!!