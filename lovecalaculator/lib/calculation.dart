import 'package:flutter/material.dart';

int calculation({String firstName, String secondName })
{
   int finalScore;
   List<String> firstList=firstName.toLowerCase().split('');
   List<String> secondList=secondName.toLowerCase().split('');
   print(firstList);
   print(secondList);

   //  making complete word "firstName'+ loves+secondName"
  List<String> magicWord =firstList+"loves".split('')+secondList;
  print('Madic word = $magicWord');
  // counting occurence of letter and Storing then into map

    var nameMap = new Map();
     magicWord.forEach((f) {
       nameMap.containsKey(f)? nameMap[f]++:nameMap[f]=1;

     });
     print(nameMap.values);

     List magicCode=nameMap.values.toList();
     print(magicCode);
     List score;
     // repeating calculation untill get magicCode.length of 2

   while(magicCode.length>2)
     {
       score=_calculate(magicCode);
       magicCode=score;
       print(score);
     }

       // print (magicCode)
    finalScore =magicCode[0]*10+magicCode[1];
   if(finalScore==99)
     {
       return 100;
     }
   print(finalScore);
   return finalScore;

}
  // calculation in loop

   List _calculate(List magicCode)
   {
     int coutSum;
     List score = new List();
     do{
       coutSum=magicCode.first+magicCode.last;
       if(coutSum>9)
         coutSum-=9;
        score.add(coutSum);
        magicCode.removeLast();
        magicCode.removeAt(0);
     }while(magicCode.length>=2);
       print(magicCode);
       if(magicCode.isNotEmpty)
         {
           score.add(magicCode.first);

         }
       return score;

   }