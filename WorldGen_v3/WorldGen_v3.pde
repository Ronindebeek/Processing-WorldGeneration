float[][][] terrainMap; 
//y, x, type
//      0 = height
//      1 = temperature
//      2 = humidity
//      3 = biome
//      4 = humidity/wind v2

PFont font;
PFont fontSmall;
PImage biomes;

//Default starting values
long seed = 4648;
int intensity = 3;
int octaves = 8;
int falloff = 7;
int intensityRidge = 3;
int octavesRidge = 3;
int falloffRidge = 7;
int cutoff = 21;
int windDir = 8;
int equatorOffset = 0;
int ridgeFactor = 28;

boolean edge = true;
boolean greyScale = false;
boolean debug = false;
boolean terrainCurving = true;

int displayType = 1;
//1 = heightmap
//2 = tempmap
//3 = humiditymap
//4 = biome
//5 = humidity/wind v2

public void setup() {
    size(1000, 1000);
    font = createFont("Arial",18,true);
    fontSmall = createFont("Arial",12,true);
    biomes = loadImage("Biomes.bmp");
    biomes.loadPixels();
    //seed(); //Not needed if there is a default seed
    refresh();
}

public void draw() {
    //
}

public void keyPressed(){
      switch (key) {
        case '1': //Renew
            displayType = 1;
            break;
        case '2': //Renew
            displayType = 2;
            break;
        case '3': //Renew
            displayType = 3;
            break;
         case '4': //Renew
            displayType = 4;
            break;  
        case '5': //Renew
            displayType = 5;
            break;       
        case 'q': //Renew
            seed();
            break;
      case 'a': //Renew
            edge = !edge;        
            break; 
       case 'x': //Renew
            debug = !debug;        
            break;   
      case 'c': //Renew
            terrainCurving = !terrainCurving;        
            break;        
      case 'z': //Renew
            greyScale = !greyScale;        
            break;
       case 'w': //Renew
            intensity = add(intensity, 1);
            break;
       case 's': //Renew
            intensity = remove(intensity, 1, 1);        
            break;
      case 'e': //Renew
            octaves = add(octaves, 1);
            break;
       case 'd': //Renew
            octaves = remove(octaves, 1, 1);           
            break;
      case 'r': //Renew
            falloff = add(falloff, 1);
            break;
      case 'f': //Renew
            falloff = remove(falloff, 1, 1);        
            break;    
      case 't': //Renew
            cutoff = add(cutoff, 1);
            break;
      case 'g': //Renew
            cutoff = remove(cutoff, 1, 1);        
            break;
      case 'y': //Renew
            windDir = add(windDir, 1, 1, 8);      
            break;
     case 'h': //Renew
            windDir = remove(windDir, 1, 1, 8);           
            break;     
      case 'u': //Renew
            equatorOffset += 10;  
            break;
     case 'j': //Renew
            equatorOffset -= 10;          
            break;     
     case 'i': //Renew
            ridgeFactor += 1;  
            break;
     case 'k': //Renew
            ridgeFactor -= 1;          
            break;            
      }
      refresh();
}

void refresh(){
      generate();
      drawMap();
      information();
}

void mousePressed(){
  pixelInfo();
}