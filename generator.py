from faker import Faker
import random

fake = Faker()

print("insert into NoTelepon (id_akun, no_telepon)")
print("\tvalues")
# Generate nomor telepon
for i in range(1, 251):
    # Simulasikan satu pengguna bisa memiliki lebih dari satu nomor telepon
    # Max 3, min 1
    x = random.randint(1, 3)
    for j in range(x):
        print(f"\t\t({i}, '08{fake.msisdn()[:10]}'),")