// ==============================
// listing/election_form.dart
// ==============================

import 'package:flutter/material.dart';

class ElectionForm
    extends StatelessWidget {

  final bool isEdit;

  final Map<String, dynamic>? data;

  final Function(
      String,
      String)
  onSave;

  final VoidCallback onBack;

  ElectionForm({
    super.key,
    required this.isEdit,
    required this.data,
    required this.onSave,
    required this.onBack,
  });

  final TextEditingController
  titleController =
  TextEditingController();

  final TextEditingController
  dateController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    if (data != null) {

      titleController.text =
      data!["title"];

      dateController.text =
      data!["date"];
    }

    return Scaffold(

      appBar: AppBar(

        leading: IconButton(

          onPressed: onBack,

          icon: const Icon(
              Icons.arrow_back),
        ),

        centerTitle: true,

        backgroundColor:
        const Color.fromARGB(
            255, 17, 177, 158),

        title: Text(

          isEdit
              ? "Edit Election"
              : "Add Election",
        ),
      ),

      body: Container(

        width: double.infinity,
        height: double.infinity,

        color: const Color.fromARGB(
            255, 194, 255, 242),

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            children: [

              TextField(

                controller:
                titleController,

                decoration:
                const InputDecoration(

                  filled: true,

                  fillColor:
                  Colors.white,

                  hintText:
                  "Election Title",
                ),
              ),

              const SizedBox(height: 20),


              const SizedBox(height: 20),

              TextField(

                controller:
                dateController,

                decoration:
                const InputDecoration(

                  filled: true,

                  fillColor:
                  Colors.white,

                  hintText: "Date",
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(

                onPressed: () {

                  onSave(

                    titleController.text,
                    dateController.text,
                  );
                },

                child: Text(

                  isEdit
                      ? "Update"
                      : "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}