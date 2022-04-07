import random
import time
    
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

print("INSERT INTO batch_vaksin (Jumlah_Tersedia, Jumlah_Terpakai, Tanggal_Kadaluarsa, ID_Fasilitas_Kesehatan, ID_Jenis_Vaksin)")
print("VALUES")
for i in range (100):
  totals = [10, 50, 100, 200, 250]
  total = totals[random.randint(0, 4)]
  jumlah_tersedia = random.randint(0, total)
  date = random_date("1/1/2022 1:30 PM", "1/1/2030 4:50 AM", random.random())[0:10]
  dates = date.split("/")
  id_faskes = random.randint(1, 100)
  id_jenis_vaksin = random.randint(1, 13)
  print("  (", end="")
  print(jumlah_tersedia, end=", ")
  print(total-jumlah_tersedia, end=', "')
  print(dates[2], end="-")
  print(dates[1], end="-")
  print(dates[0], end='", ')
  print(id_faskes, end=", ")
  print(id_jenis_vaksin, end="")
  if (i != 99):
    print("),")
  else:
    print(");")