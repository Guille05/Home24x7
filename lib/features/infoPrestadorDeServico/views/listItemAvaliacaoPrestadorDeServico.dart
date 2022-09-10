import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import '../../../framework/viewActions.dart';
import '../../../util/customRatingBar.dart';

class ListItemAvaliacaoPrestadorDeServico extends StatelessWidget {
  final ViewActions viewActions;
  final BusinessModelAvaliacaoPrestadorDeServico avaliacao;

  const ListItemAvaliacaoPrestadorDeServico({
    Key? key,
    required this.viewActions,
    required this.avaliacao,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String month = avaliacao.data.substring(5,7);
    String ano = avaliacao.data.substring(0,4);
    String dia = avaliacao.data.substring(8,10);
    String horaMinSegundo = avaliacao.data.substring(11,20);
    double screenWidth = MediaQuery.of(context).size.width;

    return  Card(
          child: Padding(
           padding: const EdgeInsets.all(6.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text(
                      avaliacao.emailUsuario[0].toUpperCase(),
                      style: TextStyle(color: Colors.black87),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 12),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(avaliacao.emailUsuario),
                    ],
                  )),
                  SizedBox(width: 12,),
                  CustomRatingBar(
                    rating: avaliacao.nota.toDouble(),
                  ),
                ],
              ),
              SizedBox(height: 8),

                  SizedBox(width: 8),
              ConstrainedBox(
                  constraints:  BoxConstraints(
                    minHeight: 10,
                    minWidth: 100,
                    maxHeight: 206,
                    maxWidth: screenWidth*.90,
                  ),

                  child: Container(
                    child: Text(avaliacao.comentario,
                      style: Theme.of(context).textTheme.caption,),
                  )
              ),
              SizedBox(height: 8),
              Text(
                dia+' of '+getMonth(month)+' , '+ano+ ' at '+horaMinSegundo,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 20,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      );
    }
  String getMonth(String month){
    if(month == '01') return 'January';
    if(month == '02') return 'February';
    if(month == '03') return 'March';
    if(month == '04') return 'April';
    if(month == '05') return 'May';
    if(month == '06') return 'June';
    if(month == '07') return 'July';
    if(month == '08') return 'August';
    if(month == '09') return 'September';
    if(month == '10') return 'October';
    if(month == '11') return 'November';
    if(month == '12') return 'December';
    return 'September';
  }
}
