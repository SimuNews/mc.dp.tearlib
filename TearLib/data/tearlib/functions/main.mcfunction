################################################
#
# Author:
#  SimuNews
#
# Description:    
#  Give each joined player a unique ID
#
################################################
execute as @a if score @s TearId <= #0 objd_consts run function tearlib:objd/group1
