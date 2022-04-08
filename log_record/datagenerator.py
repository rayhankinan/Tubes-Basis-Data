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
for i in range (100):
  date = random_date("1/1/2021 1:30 PM", "31/12/2021 4:50 AM", random.random())
  date_time = date.split(" ")
  dates = date_time[0].split("/")
  id_kab_kota = random.randint(1, 100)
  for j in range (3):
    secs = random.randint(0, 59)
    if (secs < 10):
      secs = str(f'0{secs}')
    else:
      secs = str(secs)
    print('  ("', end="")
    print(dates[2], end="-")
    print(dates[0], end="-")
    print(dates[1], end=' ')
    print(date_time[1], end=":")
    print(secs, end='", "')
    print("Tidak Diterima", end='", ')
    print(id_kab_kota, end=", ")
    print(i + 1, end="")
    
  print('  ("', end="")
  print(dates[2], end="-")
  print(dates[0], end="-")
  print(dates[1], end=' ')
  print(date_time[1], end=":")
  print(secs, end='", "')
  print("Diterima", end='", ')
  print(id_kab_kota, end=", ")
  print(i + 1, end="")
  if (i != 99):
    print("),")
  else:
    print(");")