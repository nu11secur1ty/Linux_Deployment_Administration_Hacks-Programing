#!/usr/bin/python3

li = ['23h Edited', '1d Edited', '1d Edited', '1d Edited', '1d', '2d']
time_list = [i.strip('Edited') if 'Edited' in i else i for i in li ]
print(time_list[0])

time_list2 = [i.strip('Edited') if 'Edited' in i else i for i in li ]
print(time_list2[0])

# Output
# 23h
