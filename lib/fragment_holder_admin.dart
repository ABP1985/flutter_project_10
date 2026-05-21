// ==============================
// widget_fragment_holder.dart
// ==============================
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin/home.dart';
import 'admin/election.dart';
import 'admin/candidates.dart';
import 'admin/election_form.dart';
import 'admin/candidate_form.dart';

class WidgetFragmentHolder extends StatefulWidget {
  const WidgetFragmentHolder({super.key});

  @override
  State<WidgetFragmentHolder> createState() => _WidgetFragmentHolderState();
}

class _WidgetFragmentHolderState extends State<WidgetFragmentHolder> {
  String currentRoute = "/";

  String selectedCity = "";

  String selectedElection = "";

  bool isEdit = false;

  int editIndex = -1;

  Map<String, dynamic>? formData;

  bool isCandidateEdit = false;

  int candidateEditIndex = -1;

  Map<String, dynamic>? candidateData;

  // =========================
  // CITY LIST
  // =========================

  List<String> cityList = ["Vadodara", "Surat", "Ahmedabad"];

  // =========================
  // ELECTION LIST
  // =========================

  List<Map<String, dynamic>> electionList = [
    {
      "id": 1,
      "title": "Municipal Election",
      "place": "Vadodara",
      "date": "25 May 2026",
      "icon": Icons.location_city.codePoint,
    },

    {
      "id": 2,
      "title": "State Election",
      "place": "Surat",
      "date": "10 June 2026",
      "icon": Icons.account_balance.codePoint,
    },
  ];

  // =========================
  // CANDIDATE LIST
  // =========================

  List<Map<String, dynamic>> candidateList = [
    {
      "id": 1,

      "election": "Municipal Election",

      "name": "Rahul Sharma",

      "party": "ABC Party",

      "symbol": Icons.diamond.codePoint,

      "votes": 0,
    },

    {
      "id": 2,

      "election": "State Election",

      "name": "Amit Verma",

      "party": "National Party",

      "symbol": Icons.star.codePoint,

      "votes": 0,
    },
  ];

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // SAVE ELECTION

    prefs.setString(
      "electionList",

      jsonEncode(
        electionList.map((e) {
          return {
            "id": e["id"],

            "title": e["title"],

            "place": e["place"],

            "date": e["date"],

            "icon": e["icon"],
          };
        }).toList(),
      ),
    );

    // SAVE CANDIDATE

    prefs.setString(
      "candidateList",

      jsonEncode(
        candidateList.map((c) {
          return {
            "id": c["id"],

            "election": c["election"],

            "name": c["name"],

            "party": c["party"],

            "votes": c["votes"],

            "symbol": c["symbol"],
          };
        }).toList(),
      ),
    );

    // SAVE CITY LIST

    prefs.setStringList("cityList", cityList);
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // =========================
    // LOAD CITY
    // =========================

    cityList = prefs.getStringList("cityList") ?? cityList;

    // =========================
    // LOAD ELECTION
    // =========================

    String? electionData = prefs.getString("electionList");

    if (electionData != null) {
      List decoded = jsonDecode(electionData);

      electionList = decoded.map<Map<String, dynamic>>((e) {
        return {
          "id": e["id"],

          "title": e["title"],

          "place": e["place"],

          "date": e["date"],

"icon": e["icon"],        };
      }).toList();
    }

    // =========================
    // LOAD CANDIDATE
    // =========================

    String? candidateData = prefs.getString("candidateList");

    if (candidateData != null) {
      List decoded = jsonDecode(candidateData);

      candidateList = decoded.map<Map<String, dynamic>>((c) {
        return {
          "id": c["id"],

          "election": c["election"],

          "name": c["name"],

          "party": c["party"],

          "votes": c["votes"],

"symbol": c["symbol"],        };
      }).toList();
    }

    setState(() {});
  }

  // =========================
  // NAVIGATION
  // =========================

  void navigate(String route) {
    setState(() {
      currentRoute = route;
    });
  }

  // =========================
  // ADD CITY
  // =========================

  void addCity(String city) {
    setState(() {
      cityList.add(city);
    });
  }

  // =========================
  // ELECTION FORM
  // =========================

  void openAddForm() {
    isEdit = false;
    formData = null;

    navigate("/form");
  }

  void openEditForm(int id) {
    int index = electionList.indexWhere((e) => e["id"] == id);

    if (index != -1) {
      isEdit = true;

      editIndex = index;

      formData = Map<String, dynamic>.from(electionList[index]);

      navigate("/form");
    }
  }

  // =========================
  // SAVE ELECTION
  // =========================

  void saveElection(String title, String date) {
    setState(() {
      if (isEdit && editIndex != -1) {
        electionList[editIndex] = {
          "id": electionList[editIndex]["id"],

          "title": title,

          "place": selectedCity,

          "date": date,

          "icon": electionList[editIndex]["icon"],
        };
      } else {
        electionList.add({
          "id": electionList.length + 1,

          "title": title,

          "place": selectedCity,

          "date": date,

          "icon": Icons.how_to_vote.codePoint,
        });
      }
    });

    saveData();

    navigate("/election");
  }

  // =========================
  // CANDIDATE FORM
  // =========================

  void openCandidateAdd() {
    isCandidateEdit = false;

    candidateData = null;

    navigate("/candidateForm");
  }

  void openCandidateEdit(int id) {
    int index = candidateList.indexWhere((c) => c["id"] == id);

    if (index != -1) {
      isCandidateEdit = true;

      candidateEditIndex = index;

      candidateData = Map<String, dynamic>.from(candidateList[index]);

      navigate("/candidateForm");
    }
  }
  // =========================
  // SAVE CANDIDATE
  // =========================

  void saveCandidate(String name, String party) {
    setState(() {
      if (isCandidateEdit) {
        candidateList[candidateEditIndex]["name"] = name;

        candidateList[candidateEditIndex]["party"] = party;
      } else {
        candidateList.add({
          "id": candidateList.length + 1,

          "election": selectedElection,

          "name": name,

          "party": party,

          "symbol": Icons.person.codePoint,

          "votes": 0,
        });
      }
    });

    saveData();

    navigate("/candidate");
  }

  // =========================
  // VOTE
  // =========================

  void voteCandidate(
  int index,
  BuildContext context,
) {

  setState(() {

    candidateList[index]
    ["votes"]++;
  });

  saveData();

  showDialog(

    context: context,

    builder: (context) {

      return AlertDialog(

        title:
        const Text("Success"),

        content:
        const Text(
          "Vote Successfully Submitted.",
        ),

        actions: [

          ElevatedButton(

            onPressed: () {

              Navigator.pop(
                  context);
            },

            child:
            const Text("OK"),
          ),
        ],
      );
    },
  );
}
  // =========================
  // PAGE SWITCH
  // =========================

  Widget getCurrentPage() {
    // HOME

    if (currentRoute == "/") {
      return Home(
        cityList: cityList,

        selectedCity: selectedCity,

        onCitySelect: (city) {
          setState(() {
            selectedCity = city;
          });
        },

        onViewElection: () {
          navigate("/election");
        },

        onAddElection: openAddForm,

        onAddCity: () {
          TextEditingController cityController = TextEditingController();

          showDialog(
            context: context,

            builder: (context) {
              return AlertDialog(
                title: const Text("Add City"),

                content: TextField(
                  controller: cityController,

                  decoration: const InputDecoration(hintText: "Enter city"),
                ),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("Cancel"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      addCity(cityController.text);

                      Navigator.pop(context);
                    },

                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
      );
    }
    // ELECTION
    else if (currentRoute == "/election") {
      List filteredElection = electionList.where((e) {
        return e["place"] == selectedCity;
      }).toList();

      return Election(
        elections: filteredElection,

        onElectionTap: (title) {
          selectedElection = title;

          navigate("/candidate");
        },

        onEdit: openEditForm,

        onAddElection: openAddForm,

        onBack: () {
          navigate("/");
        },
      );
    }
    // CANDIDATE
    else if (currentRoute == "/candidate") {
      List filteredCandidate = candidateList.where((c) {
        return c["election"] == selectedElection;
      }).toList();

      return Candidates(
        candidates: filteredCandidate,

        onVote: (index, context) {
          voteCandidate(index, context,);
        },

        onEdit: openCandidateEdit,

        onAddCandidate: openCandidateAdd,

        onBack: () {
          navigate("/election");
        },
      );
    }
    // ELECTION FORM
    else if (currentRoute == "/form") {
      return ElectionForm(
        isEdit: isEdit,

        data: formData,

        onSave: saveElection,

        onBack: () {
          navigate("/election");
        },
      );
    }
    // CANDIDATE FORM
    else {
      return CandidateForm(
        isEdit: isCandidateEdit,

        data: candidateData,

        onSave: saveCandidate,

        onBack: () {
          navigate("/candidate");
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getCurrentPage());
  }
}
