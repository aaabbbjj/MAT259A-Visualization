/********************************************************
 * Data Visualization - 2D                              *
 * Author: April Cai                                                     *
 ********************************************************/

/*
Step One: Upload CSV to Table & Get basic information of data. 
 Step Two: Write data from Table to 2D Array & Have max and min value of data.
 Step Three: Visualize 2D Matrix.
 Step Four: Draw labels and title.
 */
 //variables 
PFont font;
Table overall_data;
int rows, cols;
float[][] data_matrix;
float max, min;
final float margin_to_left = 160;
final float margin_to_top = 40;
float cell_width, cell_height;
color checkout_color;

boolean normalization = false;
boolean colorApply = false;
boolean click = false; 

//list of movies
String[] movie_name = {"Twilight", "New Moon", "Eclipse", 
  "Breaking Dawn", "Hunger Games", "Catching fire", "Mockingjay", "Enders game", 
  "Divergent",};
int numMovie = 9;

//year
String [] Year = {"2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"};
int numYear = 10;


//Only run one time
void setup() {
  //set the size
  size(1280, 720); 
  surface.setResizable(true);
  //font
  font = createFont("Roboto-Black.ttf", 38);
  textFont(font);
  
  //load the csv file
  overall_data = loadTable("MovieSearch.csv", "header");
  rows = overall_data.getRowCount();
  cols = overall_data.getColumnCount();
  println("row " + rows);
  println("col " + cols);
  data_matrix = new float[rows][cols - 2];
  for (int i = 0; i < data_matrix.length; i++) {
    for (int j = 0; j < data_matrix[0].length - 2; j++) {
      data_matrix[i][j] = overall_data.getFloat(i, j + 2);
    }
  }
  
  //get max and min value from the array
  for (int i = 0; i < data_matrix.length; i++) {
    for (int j = 0; j < data_matrix[0].length - 2; j++) {
      if (data_matrix[i][j] > max) {
        max = data_matrix[i][j];
      }
    }
  }
  min = 0;
   
  
  cell_width = (width - margin_to_left * 2) / cols;
  cell_height = (height - margin_to_top * 2) / (rows + 2);
  println("width: " + cell_width);
  println("height: " + cell_height);
  //colorBar = loadImage("purple.png");
  
}

//Refresh the canvas every frame
void draw() {  
  background(30);
  surface.setResizable(true);

  //grayscale 
  for (int i = 0; i < data_matrix.length; i++) {
    for (int j = 0; j < data_matrix[0].length ; j++) {
        checkout_color = (int) map(data_matrix[i][j], min, max, 255, 0);
        stroke(20,70,80);
        fill(checkout_color);
        rect(margin_to_left + j * cell_width, margin_to_top + i * cell_height + 60, cell_width, cell_height - 10, 1);
    }
  }

  
  
  // Draw movie labels
  for (int i = 0; i < numMovie; i++) {
    textAlign(RIGHT, CENTER);
    fill(200);
    textSize(14);
    text(movie_name[i], margin_to_left - 10, margin_to_top + cell_height/2 + cell_height*i + 35);
  }

  // Draw year text
  for (int i = 0; i < numYear; i++) {
    fill(200);
    textAlign(CENTER, CENTER);
    textSize(14);
    text(Year[i], margin_to_left + 12*cell_width*i + cell_width*6-3, 
      height - margin_to_top - 40 );
    
    //draw the vertical line for dividing years
    stroke(255);
    line(margin_to_left + 12*cell_width* (i + 1), 100, margin_to_left + 12*cell_width*(i + 1), height - margin_to_top - 60);
    
    //highlight the background when mouse is hovering 
    if (mouseX > (margin_to_left + 12*cell_width*i + cell_width/2 - cell_width + 2)&&
      mouseX < (margin_to_left + 12*cell_width*i + cell_width/2 - cell_width + 2 + 12*cell_width) 
      && mouseY > (height - margin_to_top - 500) && mouseY < height - margin_to_top + 48) {
      fill(255, 100);
      //fill(255);
      noStroke();
      rect(margin_to_left + 12*cell_width*i + cell_width/2-cell_width+2, 100, cell_width*12, height - margin_to_top*2 + 2);
    }
  }
  
  //header
  textAlign(LEFT, CENTER);
  fill(200);
  textSize(28);
  text("How Movie Releases Influence",
  margin_to_left - cell_width*2 + 12, 20);
  text("the Checkout Times of Original Books",
  margin_to_left - cell_width*2 + 12, 50);
  
  //author
  textSize(14);
  textAlign(CENTER, BOTTOM);
  text("MAT259 April Cai", width-100, height-35);
  
  //interaction instruction
  textSize(14);
  textAlign(CENTER, BOTTOM);
  text("press the 'n' key to log normalize / press the 'c' key to view as color / press 'esc' to exit", width/2, height-35);
  
  //interactions
  if (normalization == true) {
    normalize();
    for (int i = 0; i < numYear; i++) {
      stroke(20);
      strokeWeight(2);
      line(margin_to_left + 12*cell_width* (i + 1), 100, margin_to_left + 12*cell_width*(i + 1), height - margin_to_top - 60);
    }
  }
  if (colorApply == true) {
    colorMode();
    //normalize();
    for (int i = 0; i < numYear; i++) {
      stroke(20);
      strokeWeight(2);
      line(margin_to_left + 12*cell_width* (i + 1), 100, margin_to_left + 12*cell_width*(i + 1), height - margin_to_top - 60);
    }
  }
}