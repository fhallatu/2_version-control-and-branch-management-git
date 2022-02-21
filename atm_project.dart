// ATM PROJECT

import 'dart:io';

class nasabah {
  late String nama;
  late int saldo;
  late int pin;
  late int rekening;

  String getnama() {
    return this.nama;
  }

  void setnama(String nama_nasabah) {
    this.nama = nama_nasabah;
  }

  int getsaldo() {
    return this.saldo;
  }

  void setsaldo(int saldo_nasabah) {
    this.saldo = saldo_nasabah;
  }

  int getpin() {
    return this.pin;
  }

  void setpin(int pin_nasabah) {
    this.pin = pin_nasabah;
  }

  int getrekening() {
    return this.rekening;
  }

  void setrekening(int rekening_nasabah) {
    this.rekening = rekening_nasabah;
  }
}

void start() {
  print("---------- SELAMAT DATANG DI ATM DART ----------");
}

void signin(nasabah nasabah1, nasabah nasabah2) {
  print("Masukkan Pin Anda");
  stdout.write("PIN : ");
  int? pin_input = int.parse(stdin.readLineSync()!);

  if (pin_input == nasabah1.pin) {
    print("===== Selamat Datang " + nasabah1.nama + " =====");
    layanan(nasabah1, nasabah2);
  } else if (pin_input == nasabah2.pin) {
    print("===== Selamat Datang " + nasabah2.nama + " =====");
    layanan(nasabah2, nasabah1);
  } else {
    print('Pin Yang ANda Masukkan Salah');
    signin(nasabah1, nasabah2);
  }
}

void layanan(nasabah nasabah_signin, nasabah nasabah1) {
  print("===== PILIH LAYANAN TRANSAKSI ======");
  print("1. Informasi Saldo");
  print("3. Tarik Tunai");
  print("5. Keluar");

  print("Masukkan Layanan Yang Anda Pilih");
  stdout.write("Layanan : ");
  int? layanan_input = int.parse(stdin.readLineSync()!);

  switch (layanan_input) {
    case 1:
      {
        print("===== Informasi Saldo =====");
        print(nasabah_signin.saldo);
        print("===== KONFIRMASI=====");
        stdout.write("Apakah Masih Ingin Melanjutkan Transaksi (Y/T) : ");
        String? konfirmasi_input = stdin.readLineSync();
        if (konfirmasi_input == "Y") {
          signin(nasabah_signin, nasabah1);
        }
        if (konfirmasi_input == "T") {
          finish();
        }
        break;
      }
    case 2:
      {
        print("===== Masukkan Nominal Tarik Tunai =====");
        stdout.write("Nominal : ");
        int? tariktunai_input = int.parse(stdin.readLineSync()!);
        if (tariktunai_input > nasabah_signin.saldo) {
          print(" Saldo Anda Tidak Cukup");
          layanan(nasabah_signin, nasabah1);
        } else {
          nasabah_signin.saldo -= tariktunai_input;
          print("===== Sisa Saldo Anda =====");
          print(nasabah_signin.saldo);
          print("===== KONFIRMASI=====");
          stdout.write("Apakah Masih Ingin Melanjutkan Transaksi (Y/T) : ");
          String? konfirmasi_input = stdin.readLineSync();
          if (konfirmasi_input == "Y") {
            signin(nasabah_signin, nasabah1);
          }
          if (konfirmasi_input == "T") {
            finish();
          }
        }
        break;
      }
    case 3:
      {
        print("===== KELUAR =====");
        finish();
        break;
      }
    default:
  }
}

void finish() {
  print("========== TERIMA KASIH ATAS TRANSAKSI YANG DI LAKUKAN ==========");
}

void main(List<String> args) {
  nasabah nasabah1 = new nasabah();
  nasabah nasabah2 = new nasabah();

  nasabah1.nama = "fani";
  nasabah2.nama = "clarita";

  nasabah1.saldo = 500000;
  nasabah2.saldo = 1000000;

  nasabah1.pin = 12345;
  nasabah2.pin = 09876;

  nasabah1.rekening = 09876;
  nasabah2.rekening = 12345;

  start();
  signin(nasabah1, nasabah2);
  finish();
}
