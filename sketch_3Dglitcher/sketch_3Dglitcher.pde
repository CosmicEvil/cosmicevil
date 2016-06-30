//.OBJ GLITCHER BY HASTUR MASSIE
//
//INSTRUCTIONS:
//1) CHANGE THE FILE STRING TO THE NAME OF THE FILE YOU WANT TO GLITCH
//1b)change the dist value to how much fuckup you'd like.
//2) PRESS PLAY
//3)??????
//4) LOAD IT IN BLENDER/C4D/MAYA/ETC

//WARNING SOME FILES MIGHT NOT WORK DUE TO THERE BEING 
//EXTRA INFO IN IT, PLEASE CUT THAT FROM YOUR FILE WITH 
//TEXTEDIT, AND THEN JUST PASTE IT BACK AFTER RUNNING THE SCRIPT

PrintWriter output;
String file = "guy";
int dist = 1;
void setup() {
output = createWriter(file + int(random(666)) +".obj"); 

String[] lines = loadStrings(file + ".obj");
String[] exp = new String[lines.length];
exp = lines;

for (int i=0; i < lines.length; ++i) {
  String[] help = split(lines[i]," ");
  if(!help[0].equals("#")||!(help[0].equals("m")&&help[1].equals("t")&&help[2].equals("l"))){
  int lineSize = help.length; // cache the value for perf
   for(int k=1; k < lineSize; ++k){ // changed i to k 
   
      String[] help2 = split(help[k],"/");
      int lineSize2 = help2.length; // cache the value for perf

      String n = help[k];
      for(int l=0; l < lineSize2; ++l){ //subroutine for facets

      float j = parseFloat(help2[l]);
       
      if (j != (int)j) continue; // j is not an int
       
       j = j + random(-dist,dist);
       
       help2[l] = str(j);
       
      }
            
      
      help[k]= join(help2,"/");
 
    }
    exp[i]= join(help," ");
    
    //join back the **** to one line
    println(lines[i]);
    output.println(exp[i]); //write line of .obj
  }
}
  
 output.flush(); // Writes the remaining data to the file
 output.close(); // Finishes the file
 exit();
}