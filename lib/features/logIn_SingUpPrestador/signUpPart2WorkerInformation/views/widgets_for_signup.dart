import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class NameWidget extends StatelessWidget {


  final TextEditingController nameController;
   NameWidget({Key? key, required this.nameController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (nameController) {
            if (nameController!.isEmpty){
              return "Enter a valid username";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => nameController.clear(),
            ),
            hintText: 'Enter your full name',
            labelText: 'Name',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneWidget extends StatelessWidget {
  final TextEditingController phoneController;
  PhoneWidget({Key? key, required this.phoneController}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (phoneNumberController) {
            if (phoneNumberController!.isEmpty|| phoneNumberController.length !=11  || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(phoneNumberController)){
              return "Enter a valid phone number: (xxx)xxx-xxxx";
            } else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => phoneController.clear(),
            ),
            hintText: 'Enter your phone number (only digits)',
            labelText: 'Phone number',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,

              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkingHoursWidget extends StatelessWidget {
  final TextEditingController workingHoursController;
   WorkingHoursWidget({Key? key, required this.workingHoursController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: workingHoursController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => workingHoursController.clear(),
            ),
            hintText: 'I work from 7 am to 6 pm',
            labelText: 'Working hours',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class DescriptionWidget extends StatelessWidget {

  final TextEditingController descriptionController;
  DescriptionWidget({Key? key, required this.descriptionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TextFormField(
          minLines: 1,
          maxLines: 9,
          controller: descriptionController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.next,
          validator: (nameController) {
            if (nameController!.isEmpty) {
              return "A description of your services cannot be empty.";
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => descriptionController.clear(),
            ),
            hintText: 'Enter a description of your service',
            labelText: 'Describe your service',
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
