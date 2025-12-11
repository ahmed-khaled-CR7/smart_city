import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/complaints/presentation/cubit/complaints_cubit.dart';
import 'package:smart_city/features/complaints/presentation/cubit/complaints_state.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/complaint_card.dart';

class MyComplaintsAndSuggestionsView extends StatefulWidget {
  static const String routeName = '/my-complaints-and-suggestions';

  const MyComplaintsAndSuggestionsView({super.key});

  @override
  State<MyComplaintsAndSuggestionsView> createState() =>
      _MyComplaintsAndSuggestionsViewState();
}

class _MyComplaintsAndSuggestionsViewState
    extends State<MyComplaintsAndSuggestionsView> {
  final int citizenId = 1;

  @override
  void initState() {
    super.initState();
    // fetch data on open
    context.read<ComplaintsCubit>().getMyComplaints(citizenId);
  }

  Future<void> _refresh() async {
    await context.read<ComplaintsCubit>().getMyComplaints(citizenId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Complaints & Suggestions")),
      body: BlocBuilder<ComplaintsCubit, ComplaintsState>(
        builder: (context, state) {
          if (state is ComplaintsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ComplaintsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is ComplaintsLoaded) {
            final complaints = state.complaints;

            if (complaints.isEmpty) {
              return const Center(
                child: Text(
                  "No complaints or suggestions available.",
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  return ComplaintCard(complaint: complaints[index]);
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}