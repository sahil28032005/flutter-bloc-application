import 'package:expence_tracker/blocs/auth/auth_bloc.dart';
import 'package:expence_tracker/blocs/auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Light gray background for elegance
      appBar: AppBar(
        backgroundColor: Color(0xFF00BFA6), // Fresh teal color for AppBar
        title: Text(
          "Expense Tracker",
          style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, size: 28, color: Colors.white),
            onPressed: () {
              // Trigger logout event
              BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
              Navigator.pushReplacementNamed(context, '/login');
            },
            tooltip: "Logout",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingCard(context),
              SizedBox(height: 30),
              _buildExpenseSummary(context),
              SizedBox(height: 20),
              _buildExpenseActions(context),
            ],
          ),
        ),
      ),
    );
  }

  // Greeting card with personalized message
  Widget _buildGreetingCard(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 8,
        shadowColor: Colors.teal.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFF00BFA6).withOpacity(0.1), // Light Teal background
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Good Morning, User!",
                style: GoogleFonts.montserrat(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF00BFA6)),
              ),
              SizedBox(height: 10),
              Text(
                "Track your expenses efficiently and save money.",
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w400, color: Colors.teal.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Summary of expenses
  Widget _buildExpenseSummary(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 8,
        shadowColor: Colors.teal.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Expense Summary",
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF00BFA6)),
              ),
              SizedBox(height: 10),
              _buildExpenseCategory("Food", 250.00),
              _buildExpenseCategory("Transportation", 120.00),
              _buildExpenseCategory("Entertainment", 80.00),
              SizedBox(height: 20),
              _buildTotalExpenseCard(450.00),
            ],
          ),
        ),
      ),
    );
  }

  // Expense categories like Food, Transportation, etc.
  Widget _buildExpenseCategory(String category, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: GoogleFonts.montserrat(fontSize: 18, color: Color(0xFF00BFA6)),
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }

  // Total expense card
  Widget _buildTotalExpenseCard(double totalAmount) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Card(
        color: Color(0xFF00BFA6).withOpacity(0.15),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Expense",
                style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF00BFA6)),
              ),
              Text(
                "\$${totalAmount.toStringAsFixed(2)}",
                style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Expense actions: Add expense and View reports
  Widget _buildExpenseActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildActionCard(context, "Add Expense", Icons.add_circle, () {
          // Navigate to Add Expense screen
        }),
        SizedBox(height: 10),
        _buildActionCard(context, "View Reports", Icons.bar_chart, () {
          // Navigate to View Reports screen
        }),
      ],
    );
  }

  // Card for each action like adding an expense or viewing reports
  Widget _buildActionCard(BuildContext context, String actionName, IconData icon, Function onTap) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 8,
        shadowColor: Colors.teal.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: Color(0xFF00BFA6),
          ),
          title: Text(
            actionName,
            style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF00BFA6)),
          ),
          onTap: () => onTap(),
        ),
      ),
    );
  }
}

// FadeIn widget for smooth entry animations
class FadeIn extends StatelessWidget {
  final Widget child;
  final Duration duration;

  FadeIn({required this.child, this.duration = const Duration(milliseconds: 500)});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: duration,
      child: child,
    );
  }
}
