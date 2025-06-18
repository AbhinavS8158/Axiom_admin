import 'package:axiom_admin/model/category_model.dart';
import 'package:axiom_admin/view/rental_list/rental_list_screen.dart';
import 'package:flutter/material.dart';

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // Deep dark background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header section with animated title
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Glowing container for title
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.cyan.withAlpha(77),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan.withAlpha(26),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withAlpha(13),
                            Colors.white.withAlpha(5),
                          ],
                        ),
                      ),
                      child: const Text(
                        'Select Category',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Choose your preferred category to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withAlpha(178),
                      
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      
              // Category buttons section
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First row - Rental button (highlighted)
                    _buildEnhancedCategoryBtn(
                      context,
                      CategoryButtonModel(
                      
                        title: 'Rental',
                        icon: Icons.home_rounded,
                        color: const Color(0xFF00D4FF),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RentalListScreen(),
                            ),
                          );
                        },
                      ),
                      isPrimary: true,
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Second row - Seller and PG buttons
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 20),

                          Expanded(
                            child: _buildEnhancedCategoryBtn(
                              context,
                              CategoryButtonModel( 
                                title: 'Seller',
                                icon: Icons.store_rounded,
                                color: const Color(0xFF00FF88),
                                onPressed: () => _onCategorySelected(context, 'Seller'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: _buildEnhancedCategoryBtn(
                              context,
                              CategoryButtonModel(
                            
                                title: 'PG',
                                icon: Icons.house_rounded,
                                color: const Color(0xFFFFB800),
                                onPressed: () => _onCategorySelected(context, 'PG'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
      
              // Footer section
              Expanded(
                flex: 1,
                child: Container(
                 
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00D4FF),
                              Color(0xFF00FF88),
                              Color(0xFFFFB800),
                            ],
                          ),
                        ),
                      ),
               
                      Text(
                        'Axiom Admin Dashboard',
                        style: TextStyle(
                          color: Colors.white.withAlpha(128),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedCategoryBtn(
    BuildContext context,
    CategoryButtonModel model, {
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: model.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isPrimary ? 130 : 100,
        width: isPrimary ? 130 : 160,
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              model.color.withAlpha(51),
              model.color.withAlpha(26),
            ],
          ),
          border: Border.all(
            color: model.color.withAlpha(77),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: model.color.withAlpha(51),
              blurRadius: 20,
              spreadRadius: isPrimary ? 4 : 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: model.color.withAlpha(51),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: model.color.withAlpha(77),
                  width: 1,
                ),
              ),
              child: Icon(
                model.icon,
                color: model.color,
                size: isPrimary ? 36 : 28,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              model.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: isPrimary ? 18 : 16,
                fontWeight: isPrimary ? FontWeight.w500 : FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }

  void _onCategorySelected(BuildContext context, String category) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.cyan.withAlpha(77),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withAlpha(26),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.cyan.withAlpha(26),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.cyan,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '$category Selected',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You have selected the $category category.',
                style: TextStyle(
                  color: Colors.white.withAlpha(179),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}