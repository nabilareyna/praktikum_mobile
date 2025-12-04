import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UiLocationScreen extends StatefulWidget {
  const UiLocationScreen({super.key});

  @override
  State<UiLocationScreen> createState() => _UiLocationScreenState();
}

// ... (Bagian import dan class definition tidak berubah)

class _UiLocationScreenState extends State<UiLocationScreen> {
  String? _kecamatan;
  String? _kota;
  bool _isLoading = false;
  String? _errorMessage;

  // *** Definisikan Latitude dan Longitude di sini ***
  final double _defaultLatitude = -7.9404; 
  final double _defaultLongitude = 112.6053; 

  Future<void> _getLocation() async {
    // 1. Set status loading dan reset data
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _kecamatan = null;
      _kota = null;
    });

    try {
      // *** PERUBAHAN UTAMA DIMULAI DI SINI ***

      // 2. & 3. Langkah pengecekan layanan dan izin LOKASI DIHAPUS,
      //    karena kita tidak lagi mengambil posisi perangkat saat ini.

      // 4. Ganti langkah pengambilan posisi dengan koordinat yang sudah ditentukan
      //    Kita tidak lagi menggunakan Geolocator.getCurrentPosition().

      // Ambil koordinat yang sudah ditentukan (hardcode)
      final double lat = _defaultLatitude;
      final double lon = _defaultLongitude;

      // 5. Lakukan reverse geocoding untuk mengubah koordinat menjadi alamat
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      //                                                          ^     ^
      //                                                          |     |
      //                   Gunakan koordinat hardcode di sini ----|-----|

      if (placemarks.isNotEmpty) {
        // Ambil data lokasi pertama dari hasil reverse geocoding
        Placemark place = placemarks[0];
        setState(() {
          _kecamatan = place.subLocality; // subLocality biasanya kecamatan
          _kota = place.subAdministrativeArea; // subAdministrativeArea biasanya kota
        });
      } else {
        // Jika tidak ada data alamat yang ditemukan
        throw Exception('Tidak dapat menemukan informasi alamat untuk koordinat yang diberikan.');
      }
    } catch (e) {
      // 6. Tangani error dan tampilkan pesan
      setState(() {
        _errorMessage = e.toString().replaceAll("Exception: ", "");
      });
    } finally {
      // 7. Hentikan status loading
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... (Bagian widget build tidak berubah)
    return Scaffold(
      appBar: AppBar(title: const Text('Lokasi Saya', style: TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF1A237E)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 10.0),
                child:
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : (_errorMessage != null)
                        ? Text(_errorMessage!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red))
                        : (_kecamatan == null && _kota == null)
                        ? const Text('Tekan tombol untuk menampilkan lokasi.', textAlign: TextAlign.center)
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kelurahan/Kecamatan: $_kecamatan', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text('Kota: $_kota', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _isLoading ? null : _getLocation,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                elevation: 5.0,
              ),
              child: const Text('TAMPILKAN LOKASI SAAT INI', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
