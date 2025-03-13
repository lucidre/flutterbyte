import 'package:flutterbyte/common_libs.dart';

class CommitteeMemeberModel {
  final String image;
  final String firstName;
  final String secondName;
  final String role;

  CommitteeMemeberModel({
    required this.image,
    required this.firstName,
    required this.secondName,
    required this.role,
  });
}

final committees = [
  CommitteeMemeberModel(
      image: committee1,
      firstName: 'Jamiu',
      secondName: 'Okanlawon',
      role: 'Convener'),
  CommitteeMemeberModel(
      image: committee2,
      firstName: 'David',
      secondName: 'Adegoke',
      role: 'Co-Convener/Organizing Committee Lead'),
  CommitteeMemeberModel(
      image: committee4,
      firstName: 'Mariam',
      secondName: ' Hamzat (BusyBee)',
      role: 'Co-Convener/PowerHouse'),
  CommitteeMemeberModel(
      image: committee5,
      firstName: 'Rebecca',
      secondName: 'Saka',
      role: 'Program Team Lead'),
  CommitteeMemeberModel(
      image: committee6,
      firstName: 'Olamilekan',
      secondName: 'Akinjobi',
      role: 'Project Team Lead'),
  CommitteeMemeberModel(
      image: committee7,
      firstName: 'Favour',
      secondName: 'Mustapha',
      role: 'Design Team Lead'),
  CommitteeMemeberModel(
      image: committee8,
      firstName: 'Maryblessing',
      secondName: 'Okolie',
      role: 'Welfare Team Lead'),
  CommitteeMemeberModel(
      image: committee9,
      firstName: 'Peter',
      secondName: 'Nathaniel',
      role: 'Infrastructure Team Lead'),
  CommitteeMemeberModel(
      image: committee10,
      firstName: 'David',
      secondName: 'Olagookun',
      role: 'Volunteer Team Lead'),
  CommitteeMemeberModel(
      image: committee11,
      firstName: 'Damilola',
      secondName: 'Alimi',
      role: 'Volunteer Team Lead'),
  CommitteeMemeberModel(
      image: committee12,
      firstName: 'Emmanuella',
      secondName: 'Ijeoma 0gbonna',
      role: 'Content/PR'),
  CommitteeMemeberModel(
      image: committee3,
      firstName: 'Christopher',
      secondName: 'Nwosu-Madueke',
      role: 'Hackathon Co-Ordinator'),
  CommitteeMemeberModel(
      image: committee13,
      firstName: 'Kendi',
      secondName: 'J',
      role: 'FlutterBytes Ladies Communities Co-Ordinator'),
  CommitteeMemeberModel(
      image: committee14,
      firstName: 'Adebowale',
      secondName: 'Oluwatobi',
      role: 'Designer'),
  CommitteeMemeberModel(
      image: committee15,
      firstName: 'Joshua',
      secondName: 'Ayoola',
      role: 'Designer'),
  CommitteeMemeberModel(
      image: committee16,
      firstName: 'Shalom',
      secondName: 'Adebola',
      role: 'Host'),
  CommitteeMemeberModel(
      image: committee17,
      firstName: 'Bamigboye',
      secondName: 'TiOluwani',
      role: 'Co-Host'),
];
