//.OBJ GLITCHER BY HASTUR MASSIE
//
//INSTRUCTIONS:
//1) CHANGE THE FILE STRING TO THE NAME OF THE FILE YOU WANT TO GLITCH
//2) PRESS PLAY
//3)??????
//4) LOAD IT IN BLENDER/C4D/MAYA/ETC

//WARNING SOME FILES MIGHT NOT WORK DUE TO THERE BEING 
//EXTRA INFO IN IT, PLEASE CUT THAT FROM YOUR FILE WITH 
//TEXTEDIT, AND THEN JUST PASTE IT BACK AFTER RUNNING THE SCRIPT

PrintWriter output;
String file = "dungeon";

void setup() {
output = createWriter(file + int(random(666)) +".obj"); 

String[] lines = loadStrings(file + ".obj");
String[] exp = new String[lines.length];
exp = lines;

for (int i=0; i < lines.length; ++i) {
  String[] help = split(lines[i]," ");
  int lineSize = help.length; // cache the value for perf
   for(int k=1; k < lineSize; ++k){ // changed i to k 
       
      String n = help[k];

      float j = parseFloat(help[k]);
       
      if (j != (int)j) continue; // j is not an int
       
       j = j + random(5);
       
       help[k] = str(j);
       
    }
    exp[i]= join(help," ");
    
    //join back the **** to one line
    println(lines[i]);
    output.println(exp[i]); //write line of .obj
  }
  
 output.flush(); // Writes the remaining data to the file
 output.close(); // Finishes the file
 exit();
}