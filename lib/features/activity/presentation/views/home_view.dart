import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedPersonCount = 1;
  double _budget = 100;
  String _selectedLocation = 'Evde';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bugün Ne Yapalım?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aktiviteni Özelleştir',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bugün nasıl bir plan istersin? Tercihlerini belirle, gerisini yapay zekâya bırak.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Kişi Sayısı Seçimi
            const Text('Kişi Sayısı', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [1, 2, 3, 4, 5].map((count) {
                final isSelected = _selectedPersonCount == count;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(count == 5 ? '5+' : '$count Kişi'),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) setState(() => _selectedPersonCount = count);
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Ortam Seçimi
            const Text('Mekân Tercihi', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: ['Evde', 'Dışarıda', 'Farketmez'].map((loc) {
                final isSelected = _selectedLocation == loc;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(loc),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) setState(() => _selectedLocation = loc);
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Bütçe Slider
            Text('Maksimum Bütçe: ${_budget.round()} TL',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _budget,
              min: 0,
              max: 1000,
              divisions: 20,
              label: '${_budget.round()} TL',
              onChanged: (value) {
                setState(() => _budget = value);
              },
            ),
            const SizedBox(height: 32),

            // Aktivite Bul Butonu
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$_selectedPersonCount kişi için $_selectedLocation ortamında ${_budget.round()} TL bütçeli aktivite aranıyor...',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Bana Aktivite Öner', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}