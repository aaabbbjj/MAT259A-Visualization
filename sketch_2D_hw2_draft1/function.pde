//normalize the graph
//code reference: Sara Lafia
void normalize() {
  for (int i = 0; i < data_matrix.length; i++) {
      for (int j = 0; j < data_matrix[0].length ; j++) {
      colorMode(HSB, 255);
      stroke(50);
      strokeWeight(0.2);
      // dataMatrix[i][j] = log(table.getFloat(j, i+2));
      float sat = map((data_matrix[i][j]), min, max, 0, 100);
      // println(sat);
      float bri = map((data_matrix[i][j]), min, max, 0, 100);
      if (i == 0) {
          fill(HSB,#672E3B,  sat, bri);
        } else if (i == 1) {
          fill(HSB, #944743,  sat, bri);
        } else if (i == 2) {
          fill(HSB, #DC4C46,  sat, bri);
        } else if (i == 3) {
          fill(HSB, #BC70A4,  sat, bri);
        } else if (i == 4) {
          fill(HSB, #DBB1CD,  sat, bri);
        } else if (i == 5) {
          fill(HSB, #EC9787,  sat, bri);
        } else if (i == 6) {
          fill(HSB, #F3D6E4,  sat, bri);
        } else if (i == 7) {
          fill(HSB, #B93A32,  sat, bri);
        } else if (i == 8) {
          fill(HSB, #AD5D5D,  sat, bri);
        } else if (i == 9) {
          fill(HSB, #B76BA3,  sat, bri);
        } else {
          fill(0,0,0);
        }
      pushMatrix();
        // rect(x, y, width, height, radius)
        rect(margin_to_left + j * cell_width, margin_to_top + i * cell_height + 60, cell_width, cell_height - 10, 1);
        popMatrix();
    }
  }
}









//apply color
void colorMode() {
  for (int i = 0; i < data_matrix.length; i++) {
      for (int j = 0; j < data_matrix[0].length ; j++) {
        stroke(50);
        strokeWeight(0.2);
        colorMode(HSB, 255, 255, 255);
        float freq = map(data_matrix[i][j], min, max, 65, 255);
        if (i == 0) {
          fill(#672E3B, freq);
        } else if (i == 1) {
          fill(#944743, freq);
        } else if (i == 2) {
          fill(#DC4C46, freq);
        } else if (i == 3) {
          fill(#BC70A4, freq);
        } else if (i == 4) {
          fill(#DBB1CD, freq);
        } else if (i == 5) {
          fill(#EC9787, freq);
        } else if (i == 6) {
          fill(#F3D6E4, freq);
        } else if (i == 7) {
          fill(#B93A32, freq);
        } else if (i == 8) {
          fill(#AD5D5D, freq);
        } else if (i == 9) {
          fill(#B76BA3, freq);
        } else {
          fill(0,0,0);
        }
        pushMatrix();
        // rect(x, y, width, height, radius)
        rect(margin_to_left + j * cell_width, margin_to_top + i * cell_height + 60, cell_width, cell_height - 10, 1);
        popMatrix();
      }
    }
}