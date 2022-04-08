import random
import time
from turtle import end_fill

from sympy import sec
    
def str_time_prop(start, end, time_format, prop):
    """Get a time at a proportion of a range of two formatted times.
    start and end should be strings specifying times formatted in the
    given format (strftime-style), giving an interval [start, end].
    prop specifies how a proportion of the interval to be taken after
    start.  The returned time will be in the specified format.
    """

    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end, prop):
    return str_time_prop(start, end, '%m/%d/%Y %I:%M %p', prop)

print("INSERT INTO log_record (Timestamp, Status, ID_Kabupaten_Kota, ID_Batch_Vaksin)")
print("VALUES")
kab_kota = [47, 44 ,85,45,48,100,73,31,44,16,82,54,90,26,32,44,33,23,85,32,82,31,49,44,80,11,13,34,28,23,28,26,64,31,72,16,15,73,28,12,82,2,76,12,91,58,60,90,76,4,34,49,97,54,11,30,91,64,3,34,
49,75,39,71,27,2,90,54,97,91,44,49,100,73,19,65,91,89,2,62,71,55,96,42,12,68,3,90,34,63,5,32,97,4,33,52,100,7,71,31]
for i in range (100):
  date = random_date("1/1/2021 1:30 PM", "12/31/2021 4:50 AM", random.random())
  date_time = date.split(" ")
  dates = date_time[0].split("/")
  id_kab_kota = random.randint(1, 100)
  for j in range (3):
    day = int(dates[1]) + j
    secs = random.randint(0, 59)
    if (secs < 10):
      secs = str(f'0{secs}')
    else:
      secs = str(secs)
    print('  ("', end="")
    print(dates[2], end="-")
    print(dates[0], end="-")
    print(str(day), end=' ')
    print(date_time[1], end=":")
    print(secs, end='", "')
    print("Tidak Diterima", end='", ')
    print(str(kab_kota[i]), end=", ")
    print(i + 1, end="")
    print("),")   
  day = int(dates[1]) + 3
  print('  ("', end="")
  print(dates[2], end="-")
  print(dates[0], end="-")
  print(str(day), end=' ')
  print(date_time[1], end=":")
  print(secs, end='", "')
  print("Diterima", end='", ')
  print(str(kab_kota[i]), end=", ")
  print(i + 1, end="")
  if (i != 99):
    print("),")
  else:
    print(");")
