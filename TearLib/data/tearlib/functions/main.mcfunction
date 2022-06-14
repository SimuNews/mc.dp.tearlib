################################################
#
# Author:
#  SimuNews
#
# Description:    
#  Give each joined player a unique ID
#
################################################
execute as @a unless score @s TearId > #0 objd_consts run function tearlib:objd/group1
