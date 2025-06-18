import 'package:flutter/material.dart';

class RentalListScreen extends StatelessWidget {
  const RentalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text(
          "Premium Rentals",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF161B22),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D1117), Color(0xFF161B22)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF21262D), Color(0xFF30363D)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF30363D), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(77),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6366F1),
                                    Color(0xFF8B5CF6),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.home_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Axiom Residency",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color(0xFF8B949E),
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Kozhikode",
                                        style: const TextStyle(
                                          color: Color(0xFF8B949E),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF10B981),
                                    Color(0xFF059669),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Available",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildFeatureChip(Icons.bed, "4 BHK"),
                            const SizedBox(width: 8),
                            _buildFeatureChip(Icons.bathtub, "4 Bath"),
                            const SizedBox(width: 8),
                            _buildFeatureChip(Icons.apartment_rounded, "Villa"),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Monthly Rent",
                                  style: TextStyle(
                                    color: Color(0xFF8B949E),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "₹50,000",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        31,
                                        104,
                                        33,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withAlpha(102),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Accept',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        128,
                                        12,
                                        3,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.red.withAlpha(102),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Reject',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF30363D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF8B949E), size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF8B949E), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
